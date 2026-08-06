/*=====================================================================================
Script Name : rls_fact_shipping_performance.sql

Purpose     : Creates a Row-Level Security (RLS) policy that filters data
              in the Gold reporting table based on Microsoft Entra ID.

Input       : Fact_Shipping_Performance

Output      : Secured access to Fact_Shipping_Performance based on Microsoft Entra ID.

Project     : End-to-End E-Commerce Shipping Analytics
Platform    : Microsoft Fabric
=======================================================================================*/

-- Drop the security policy before modifying the predicate function.
-- The policy creates a binding that prevents CREATE OR ALTER FUNCTION.
DROP SECURITY POLICY Security.WarehouseDataFilter;


-- STEP 1
-- *Run this separately just by selecting this line alone in THIS same window, then comment out and then run the funtion creation*
--CREATE SCHEMA Security;


-- STEP 2 - CREATE SECURITY PREDICATE FUNCTION
CREATE OR ALTER FUNCTION Security.fn_SecurityPredicateByWarehouse (@Warehouse_Block varchar(10))
    RETURNS TABLE
WITH SCHEMABINDING
AS
    RETURN SELECT 1 AS fn_security_predicate_result
    WHERE
        -- Microsoft Fabric uses Microsoft Entra ID for authentication.
        -- CURRENT_USER returns the signed-in Entra ID rather than 'dbo',
        -- so the administrator account must be explicitly included in the predicate.
        
        --Rule 1 FIX: Replace with your exact cloud name from Step 1
        CURRENT_USER = 'FabricAdmin@yourcompany.com'
        --Rule 2: Warehouse A Manager can ONLY see Block A data
        OR (CURRENT_USER = 'WarehouseA_Manager@yourcompany.com' AND @Warehouse_Block = 'A')
        --Rule 3: Warehouse D Manager can ONLY see Block D data
        OR (CURRENT_USER = 'WarehouseD_Manager@yourcompany.com' AND @Warehouse_Block = 'D')
        --Rule 4: Warehouse F Manager can ONLY see Block F data
        OR (CURRENT_USER = 'WarehouseF_Manager@yourcompany.com' AND @Warehouse_Block = 'F')


--STEP 3: CREATE AND ENABLE SECURITY POLICY
-- Drop the security policy before modifying the predicate function.
-- The policy creates a binding that prevents CREATE OR ALTER FUNCTION.
CREATE SECURITY POLICY Security.WarehouseDataFilter
ADD FILTER PREDICATE Security.fn_SecurityPredicateByWarehouse(Warehouse_Block)
ON dbo.Fact_Shipping_Performance
WITH (STATE = ON);