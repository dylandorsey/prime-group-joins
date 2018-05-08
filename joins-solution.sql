-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" 
ON "addresses"."customer_id" = "customers"."id"
ORDER BY "customers"."id";

-- 2. Get all orders and their line items.
SELECT * FROM "line_items"
JOIN "orders" 
ON "line_items"."order_id" = "orders"."id"
ORDER BY "orders"."id";

-- 3. Which warehouses have cheetos?
SELECT "warehouse"."warehouse", "warehouse_product"."warehouse_id", "warehouse"."id", "products"."description", "warehouse_product"."product_id", "products"."id" 
FROM "products"
JOIN "warehouse_product" 
ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" 
ON "warehouse"."id" = "warehouse_product"."warehouse_id"

-- 4. Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse", "warehouse_product"."warehouse_id", "warehouse"."id", "products"."description", "warehouse_product"."product_id", "products"."id" 
FROM "products"
JOIN "warehouse_product" 
ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" 
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "products"."description" = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."id", "customers"."last_name", COUNT("orders"."id")
FROM "orders"
JOIN "addresses" 
ON "orders"."address_id" = "addresses"."id"
JOIN "customers" 
ON "customers"."id" = "addresses"."customer_id"
GROUP BY "customers"."id"
ORDER BY "customers"."id";


-- 6. How many customers do we have?
SELECT COUNT("id") FROM "customers";

-- 7. How many products do we carry?
SELECT COUNT("id") FROM "customers";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product"."on_hand")
FROM "products"
JOIN "warehouse_product" 
ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" 
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "products"."description" = 'diet pepsi';