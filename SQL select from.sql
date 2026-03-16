-- Viết câu lệnh SQL lấy ra tên của tất cả các sản phẩm
SELECT [ProductName]
FROM [dbo].[Products];
-- Viết câu lệnh SQL lấy ra tên sản phẩm, giá bán trên mỗi đơn vị, số lượng sản phẩm trên đơn vị
SELECT [ProductName],[UnitPrice],[QuantityPerUnit]
FROM [dbo].[Products]
-- Viết câu lệnh SQL lấy ra tên công ty của khách hàng ,và quốc gia của các khách hàng đó
SELECT [CompanyName],[Country]
FROM [dbo].[Customers]

SELECT CompanyName, Country 
FROM dbo.Customers;

SELECT CompanyName,Phone 
FROM dbo.Suppliers 

SELECT LastName,BirthDate, HireDate 
FROM dbo.Employees; 

--Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng Products
SELECT *
FROM dbo.Products; 

SELECT *
FROM dbo.Customers;

SELECT *
FROM dbo.Suppliers 

USE NORTHWND 
