-- Inserir dados na tabela 'accounts'
INSERT INTO accounts (type, firstName, lastName, cpf, address, dateOfBirth)
VALUES
    ('PF', 'John', 'Doe', '12345678901', '123 Main St, City', '1990-05-15'),
    ('PF', 'Jane', 'Smith', '98765432101', '456 Elm St, Town', '1985-10-25'),
    ('PF', 'Michael', 'Johnson', '45678912301', '789 Oak St, Village', '1995-02-08'),
    ('PJ', 'Company A', NULL, NULL, '100 Business Ave, City', NULL),
    ('PJ', 'Company B', NULL, NULL, '200 Corporate St, Town', NULL);

-- Inserir dados na tabela 'customers'
INSERT INTO customers (accountId)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5);

-- Inserir dados na tabela 'products'
INSERT INTO products (productName, childFriendly, category, description, price, rating, dimensions)
VALUES
    ('Smartphone XYZ', FALSE, 'Electronics', 'High-end smartphone with great features', 599.99, 4.5, '5.5" x 2.8" x 0.3"'),
    ('T-Shirt ABC', TRUE, 'Apparel', 'Comfortable cotton t-shirt for kids', 19.99, 4.0, '12" x 10" x 1"'),
    ('Teddy Bear', TRUE, 'Toys', 'Cute and cuddly teddy bear', 29.99, 4.8, '10" x 8" x 5"');

-- Inserir dados na tabela 'orders'
INSERT INTO orders (customerId, orderStatus, description, shippingFee, paymentStatus, deliveryStatus, trackingCode)
VALUES
    (1, 'Processing', 'Order #1234', 8.50, TRUE, 'Preparing', NULL),
    (2, 'Shipped', 'Order #5678', 10.00, TRUE, 'Shipped', 'ABCD1234'),
    (3, 'Delivered', 'Order #9012', 5.00, TRUE, 'Delivered', 'WXYZ5678');

-- Inserir dados na tabela 'payments'
INSERT INTO payments (orderId, paymentMethod, amount)
VALUES
    (1, 'Credit Card', 608.49),
    (2, 'PayPal', 29.99),
    (3, 'Bank Transfer', 34.99),
    (3, 'Credit Card', 0.01);

-- Inserir dados na tabela 'product_stock'
INSERT INTO product_stock (productId, quantity, location)
VALUES
    (1, 50, 'Warehouse A'),
    (2, 100, 'Warehouse B'),
    (3, 20, 'Warehouse C');

-- Inserir dados na tabela 'suppliers'
INSERT INTO suppliers (cnpj, companyName, contact)
VALUES
    ('12345678901234', 'Supplier XYZ', '9876543210'),
    ('56789012345678', 'Supplier ABC', '6543210987');

-- Inserir dados na tabela 'sellers'
INSERT INTO sellers (companyName, cnpj, cpf, location, tradeName)
VALUES
    ('Seller Company 1', '87654321098765', NULL, 'Store 1, City', 'Seller 1'),
    ('Seller Company 2', NULL, '76543210987', 'Store 2, Town', 'Seller 2');

-- Inserir dados na tabela 'product_seller'
INSERT INTO product_seller (idProductSellerSeller, idProductSellerProduct, quantity)
VALUES
    (1, 1, 20),
    (1, 2, 30),
    (2, 3, 15);

-- Inserir dados na tabela 'product_order'
INSERT INTO product_order (idProductOrderProduct, idProductOrderOrder, quantity, orderStatus)
VALUES
    (1, 1, 2, 'Available'),
    (2, 1, 1, 'Available'),
    (3, 1, 3, 'Out of stock');

-- Inserir dados na tabela 'stock_location'
INSERT INTO stock_location (idStockLocationProduct, idStockLocationStock, location)
VALUES
    (1, 1, 'Shelf 1'),
    (1, 2, 'Shelf 2'),
    (2, 1, 'Shelf 3'),
    (3, 3, 'Shelf 4');

-- Inserir dados na tabela 'product_supplier'
INSERT INTO product_supplier (idProductSupplierProduct, idProductSupplierSupplier, quantity)
VALUES
    (1, 1, 100),
    (2, 2, 50),
    (3, 1, 30);
