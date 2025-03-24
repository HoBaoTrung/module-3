CREATE DATABASE demo;
USE demo;

CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50),
    productName VARCHAR(100),
    productPrice DECIMAL(10, 2),
    productAmount INT,
    productDescription TEXT,
    productStatus BOOLEAN
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES 
('P001', 'Laptop', 1500.00, 10, 'High-performance laptop', TRUE),
('P002', 'Smartphone', 800.00, 20, 'Latest smartphone model', TRUE),
('P003', 'Tablet', 500.00, 15, 'Lightweight and portable', FALSE),
('P004', 'Headphones', 100.00, 30, 'Noise-cancelling headphones', TRUE);

CREATE UNIQUE INDEX idx_unique_productCode ON Products (productCode);

CREATE INDEX idx_composite_productName_price ON Products (productName, productPrice);

EXPLAIN SELECT * FROM Products WHERE productName = 'Laptop' AND productPrice = 1500.00;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;
SELECT * From ProductInfo;

-- Tiến hành sửa đổi view
ALTER VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;
SELECT * From ProductInfo;

-- xoá view
DROP VIEW ProductInfo;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;
CALL GetAllProducts()

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE AddProduct(
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10, 2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus BOOLEAN
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END //
DELIMITER ;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE UpdateProduct(
    IN p_Id INT,
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10, 2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus BOOLEAN
)
BEGIN
    UPDATE Products
    SET 
        productCode = p_productCode,
        productName = p_productName,
        productPrice = p_productPrice,
        productAmount = p_productAmount,
        productDescription = p_productDescription,
        productStatus = p_productStatus
    WHERE Id = p_Id;
END //
DELIMITER ;

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE DeleteProduct(IN p_Id INT)
BEGIN
    DELETE FROM Products WHERE Id = p_Id;
END //
DELIMITER ;