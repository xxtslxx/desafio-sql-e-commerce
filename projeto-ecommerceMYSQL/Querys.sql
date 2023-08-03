-- 1 Quantos pedidos foram feitos por cada cliente?
USE ecommerce;
SELECT c.idCustomer, COUNT(o.idOrder) AS numOrders
FROM customers c
LEFT JOIN orders o ON c.idCustomer = o.customerId
GROUP BY c.idCustomer;

-- 2 Algum vendedor também é fornecedor?

USE ecommerce;
SELECT DISTINCT s.idSeller, s.companyName
FROM sellers s
INNER JOIN product_seller ps ON s.idSeller = ps.idProductSellerSeller
INNER JOIN product_supplier psp ON ps.idProductSellerProduct = psp.idProductSupplierProduct;

-- 3 Relação de produtos fornecedores e estoques:

USE ecommerce;
SELECT p.productName, s.companyName, ps.quantity AS quantitySupplied, pst.quantity AS quantityInStock
FROM products p
LEFT JOIN product_supplier ps ON p.idProduct = ps.idProductSupplierProduct
LEFT JOIN suppliers s ON ps.idProductSupplierSupplier = s.idSupplier
LEFT JOIN product_stock pst ON p.idProduct = pst.productId;

-- 4 Relação de nomes dos fornecedores e nomes dos produtos:

USE ecommerce;
SELECT s.companyName AS supplierName, p.productName
FROM product_supplier ps
INNER JOIN suppliers s ON ps.idProductSupplierSupplier = s.idSupplier
INNER JOIN products p ON ps.idProductSupplierProduct = p.idProduct;


