CREATE DATABASE ecommerce;
USE ecommerce;

-- Create 'accounts' table
CREATE TABLE accounts (
    idAccount INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('PF', 'PJ') NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    middleName CHAR(3),
    lastName VARCHAR(50),
    cpf CHAR(11),
    cnpj CHAR(15),
    address VARCHAR(100),
    dateOfBirth DATE
);

-- Create 'customers' table
CREATE TABLE customers (
    idCustomer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    accountId INT,
    CONSTRAINT unique_account_customer UNIQUE (accountId),
    CONSTRAINT fk_customer_account FOREIGN KEY (accountId) REFERENCES accounts(idAccount)
);

-- Create 'products' table
CREATE TABLE products (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    childFriendly BOOLEAN DEFAULT FALSE,
    category ENUM('Electronics', 'Apparel', 'Toys', 'Food', 'Furniture') NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL,
    rating FLOAT NOT NULL DEFAULT 0,
    dimensions VARCHAR(20)
);

-- Create 'orders' table
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    customerId INT,
    orderStatus ENUM('In Progress', 'Processing', 'Shipped', 'Delivered') DEFAULT 'Processing',
    description VARCHAR(255),
    shippingFee FLOAT DEFAULT 10,
    paymentStatus BOOLEAN DEFAULT FALSE,
    deliveryStatus ENUM('Preparing', 'Shipped', 'Out for delivery', 'Delivered') DEFAULT 'Preparing',
    trackingCode VARCHAR(50),
    CONSTRAINT fk_order_customer FOREIGN KEY (customerId) REFERENCES customers(idCustomer)
);

-- Create 'payments' table
CREATE TABLE payments (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT NOT NULL,
    paymentMethod VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_payment_order FOREIGN KEY (orderId) REFERENCES orders(idOrder)
);

-- Create 'product_stock' table
CREATE TABLE product_stock (
    idStock INT AUTO_INCREMENT PRIMARY KEY,
    productId INT,
    quantity INT DEFAULT 0,
    location VARCHAR(100)
);

-- Create 'suppliers' table
CREATE TABLE suppliers (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    cnpj CHAR(15) NOT NULL,
    companyName VARCHAR(100) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_supplier UNIQUE (cnpj),
    CONSTRAINT unique_companyName_supplier UNIQUE (companyName)
);

-- Create 'sellers' table
CREATE TABLE sellers (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    companyName VARCHAR(100) NOT NULL,
    cnpj CHAR(15),
    cpf CHAR(11),
    location VARCHAR(100),
    tradeName VARCHAR(100),
    CONSTRAINT unique_companyName_seller UNIQUE (companyName),
    CONSTRAINT unique_cnpj_seller UNIQUE (cnpj),
    CONSTRAINT unique_cpf_seller UNIQUE (cpf)
);

-- Create 'product_seller' table
CREATE TABLE product_seller (
    idProductSellerSeller INT,
    idProductSellerProduct INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (idProductSellerSeller, idProductSellerProduct),
    CONSTRAINT fk_productSeller_seller FOREIGN KEY (idProductSellerSeller) REFERENCES sellers(idSeller),
    CONSTRAINT fk_productSeller_product FOREIGN KEY (idProductSellerProduct) REFERENCES products(idProduct)
);

-- Create 'product_order' table
CREATE TABLE product_order (
    idProductOrderProduct INT,
    idProductOrderOrder INT,
    quantity INT DEFAULT 1,
    orderStatus ENUM('Available', 'Out of stock') DEFAULT 'Available',
    PRIMARY KEY (idProductOrderProduct, idProductOrderOrder),
    CONSTRAINT fk_productOrder_product FOREIGN KEY (idProductOrderProduct) REFERENCES products(idProduct),
    CONSTRAINT fk_productOrder_order FOREIGN KEY (idProductOrderOrder) REFERENCES orders(idOrder)
);

-- Create 'stock_location' table
CREATE TABLE stock_location (
    idStockLocationProduct INT,
    idStockLocationStock INT,
    location VARCHAR(100) NOT NULL,
    PRIMARY KEY (idStockLocationProduct, idStockLocationStock),
    CONSTRAINT fk_stockLocation_product FOREIGN KEY (idStockLocationProduct) REFERENCES products(idProduct),
    CONSTRAINT fk_stockLocation_stock FOREIGN KEY (idStockLocationStock) REFERENCES product_stock(idStock)
);

-- Create 'product_supplier' table
CREATE TABLE product_supplier (
    idProductSupplierProduct INT,
    idProductSupplierSupplier INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idProductSupplierProduct, idProductSupplierSupplier),
    CONSTRAINT fk_productSupplier_product FOREIGN KEY (idProductSupplierProduct) REFERENCES products(idProduct),
    CONSTRAINT fk_productSupplier_supplier FOREIGN KEY (idProductSupplierSupplier) REFERENCES suppliers(idSupplier)
);
