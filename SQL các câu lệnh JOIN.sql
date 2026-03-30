--Câu lệnh JOIN ( HOẶC INNER JOIN)
--Trả về tất cả các hàng khi có ít nhất 1 giá trị ở cả hai bảng
--SELECT column_name(s)
--FROM table1
--INNER JOIN table2
--ON table1.column_name = table2.column_name
--Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
SELECT c.CategoryID,c.CategoryName,p.ProductID,p.ProductName
FROM dbo.Categories c
INNER JOIN dbo.Products p
ON c.CategoryID=p.CategoryID

--Từ bảng Products và Categories, hãy đưa ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Số lượng sản phẩm
SELECT c.CategoryID,c.CategoryName,count(p.ProductID) AS [Total Products]
FROM dbo.Categories c
INNER JOIN dbo.Products p
ON c.CategoryID=p.CategoryID
GROUP BY c.CategoryID,c.CategoryName

--Sử dụng INNET JOIN, hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tên công ty khách hàng
SELECT o.OrderID,c.CompanyName
FROM dbo.Orders o
INNER JOIN dbo.Customers c
ON o.CustomerID=c.CustomerID

--lEFT JOIN (HOẶC LEFT OUTER JOIN)
--Trả lại TẤT CẢ CÁC DÒNG từ bảng bên trái, kể cả các dòng đó ko có ở bên bảng phải,sau đó mới lấy phần giao
--SELECT column_name(s)
--FROM table1
--LEFT JOIN table2
--ON table1.column_name = table2.column_name
--Thêm các thể loại sản phẩm mới vào bảng Categories 
--Asian Food
--Vietnamese Food
SELECT c.CategoryID,c.CategoryName,p.ProductID,p.ProductName
FROM dbo.Categories c
LEFT JOIN dbo.Products p
ON c.CategoryID=p.CategoryID

SELECT c.CategoryID,c.CategoryName,count(p.ProductID) AS [Total Products]
FROM dbo.Categories c
LEFT JOIN dbo.Products p
ON c.CategoryID=p.CategoryID
GROUP BY c.CategoryID,c.CategoryName

--RIGHT JOIN (HOẶC RIGHT OUTER JOIN)
--Trả lại TẤT CẢ CÁC DÒNG từ bảng bên phải, kể cả các dòng đó ko có ở bên bảng trái, sau đó mới lấy phần giao
--SELECT column_name(s)
--FROM table1
--RIGHT JOIN table2
--ON table1.column_name = table2.column_name
--Thêm 1 công ty mới vào bảng Customer
SELECT o.OrderID,c.CompanyName
FROM dbo.Orders o
RIGHT JOIN dbo.Customers c
ON o.CustomerID=c.CustomerID

SELECT c.CompanyName, count(o.OrderID) AS [TotalOrders]
FROM dbo.Orders o
RIGHT JOIN dbo.Customers c
ON o.CustomerID=c.CustomerID
GROUP BY c.CompanyName

--FULL JOIN (HOẶC FULL OUTER JOIN)
--Trả lại TẤT CẢ CÁC DÒNG ĐÚNG VS 1 TRONG CÁC BẢNG, CẢ PHẦN GIAO VÀ KHÔNG GIAO, KHÔNG LẶP LẠI
--SELECT column_name(s)
--FROM table1
--FULL JOIN table2
--ON table1.column_name = table2.column_name
--WHERE condition
SELECT c.CategoryID,c.CategoryName,p.ProductID,p.ProductName
FROM dbo.Categories c
FULL JOIN dbo.Products p
ON c.CategoryID=p.CategoryID

--Bài tập
--1(INNER JOIN): liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng orders
SELECT o.OrderID,e.LastName, e.FirstName, c.CompanyName
FROM dbo.Orders o
INNER JOIN dbo.Employees e
ON o.[EmployeeID]=e.[EmployeeID]
INNER JOIN dbo.Customers c
ON o.[CustomerID]=c.[CustomerID]
--2(LEFT JOIN): Hãy liệt kê tên nhà cung cấp và tên sản phẩm của các sản phẩm trong bảng "Products", bao gồm cả các sản phầm không có nhà cung cấp
SELECT s.CompanyName,p.ProductName
FROM dbo.Products p
LEFT JOIN dbo.Suppliers s
ON p.SupplierID=s.SupplierID
--3(RIGHT JOIN): Hãy liệt kê tên khách hàng và tên đơn hàng của các đơn hàng trong bảng "Orders", bao gồm cả các khách hàng không có đơn hàng
SELECT c.CompanyName, o.OrderID
FROM dbo.Orders o
RIGHT JOIN dbo.Customers c
ON o.CustomerID=c.CustomerID
--4(FULL JOIN): Hãy liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm trong bảng "Products", bao gồm cả các danh mục và nhà cung cấp ko có sản phẩm
SELECT p.ProductName,c.CategoryName, s.CompanyName
FROM dbo.Categories c 
FULL JOIN dbo.Products p
ON p.CategoryID=c.CategoryID
FULL JOIN dbo.Suppliers s
ON p.SupplierID=s.SupplierID
--Các bảng đồng cấp

--Liệt kê tên nhân viên, tổng tiền 1 nhân viên kiếm được trong mỗi order
SELECT e.LastName, e.FirstName, sum(od.UnitPrice*od.Quantity) AS [TotalMoney]
FROM dbo.Orders o
FULL JOIN dbo.Employees e
ON o.EmployeeID=e.EmployeeID
FULL JOIN dbo.[Order Details] od
ON o.OrderID=od.OrderID
GROUP BY e.LastName, e.FirstName





