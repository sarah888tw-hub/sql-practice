USE NORTHWND 
--SELECT column1, column2,...
--FROM table_name
--ORDER BY column1, column2,... ASC (TĂNG DẦN)/DESC (GIẢM DẦN)/NẾU KO GHI MẶC ĐỊNH TĂNG DẦN
--Bạn hãy liệt kê tất cả các nhà cung cấp theo thứ tự tên đơn vị CompanyName
--Từ A-Z
SELECT *
FROM dbo.Suppliers 
ORDER BY CompanyName ASC 

--Bạn hãy liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần.
SELECT *
FROM dbo.Products 
ORDER BY UnitPrice DESC

--Bạn hãy liệt kê tất cả các nhân viên theo thứ tự họ và tên đệm A-Z.
--Không dùng ASC | DESC
SELECT *
FROM dbo.Employees
ORDER BY LastName,FirstName 

--Hãy lấy ra một sản phẩm có số lượng bán cao nhất từ bảng [Order Details].
SELECT TOP 1*
FROM dbo.[Order Details] 
ORDER BY Quantity DESC

--Hãy liệt kê danh sác các đơn đặt hàng trong bảng order 
--theo thứ tự giảm dần của ngày đặt hàng
SELECT *
FROM dbo.Orders 
ORDER BY OrderDate DESC

--Liệt kê tên, đơn giá số lượng trong kho của tất cả các sản phẩm 
--trong bảng product theo thứ tự giảm dần
SELECT ProductName,UnitPrice, UnitsInStock 
FROM dbo.Products 
ORDER BY UnitsInStock  DESC