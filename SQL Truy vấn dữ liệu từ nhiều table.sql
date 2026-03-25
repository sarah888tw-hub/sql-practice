USE NORTHWND
--Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
SELECT c.[CategoryID], c.[CategoryName], p.[ProductID], p.[ProductName]
FROM [dbo].[Products] AS p, [dbo].[Categories] AS c
WHERE c.CategoryID = p.CategoryID

--Từ bảng Employees và Orders, hãy in ra các thông tin sau đây:
--Mã nhân viên
--Tên nhân viên
--Số lượng đơn hàng mà nhân viên đã bán được
SELECT e.EmployeeID, e.LastName, e.FirstName, count(o.OrderID) AS [TotalOrders]
FROM dbo.Employees AS e, dbo.Orders AS o
WHERE o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.LastName, e.FirstName

--Từ bảng Customers và Orders, hãy in ra các thông tin sau đây:
--Mã số khách hàng
--Tên công ty
--Tên liên hệ
--Số lượng đơn hàng đã mua
--Với điều kiện: quốc gia của khách hàng là UK
SELECT c.CustomerID, c.CompanyName, c.Country, c.ContactName, count(o.OrderID) AS [TotalOrders]
FROM dbo.Customers AS c, dbo.Orders AS o
WHERE c.CustomerID = o.CustomerID AND c.Country = 'UK'
GROUP BY c.CustomerID, c.CompanyName, c.ContactName, c.Country

--Từ bảng Orders và Shippers, hãy in ra các thông tin sau đây:
--Mã nhà vận chuyển
--Tên công ty vận chuyển
--Tổng số tiền được vận chuyển (Sum Frieght)
--Và in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giảm dần.
SELECT s.ShipperID, s.CompanyName, sum(o.Freight) AS [TotalFreight]
FROM dbo.Orders AS o, dbo.Shippers AS s
WHERE s.ShipperID = o.ShipVia
GROUP BY s.ShipperID, s.CompanyName
ORDER BY sum(o.Freight) DESC

--Từ bảng Products và Suppliers, hãy in ra các thông tin sau đây:
--Mã nhà cung cấp
--Tên công ty
--Tổng số các sản phẩm khác nhau đã cung cấp
--Và chỉ in ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhiều nhất.
SELECT TOP 1 s.SupplierID, s.CompanyName, count(p.ProductID) AS [TotalProduct]
FROM dbo.Products AS p, dbo.Suppliers AS s
WHERE s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.CompanyName
ORDER BY count(p.ProductID) DESC

--Từ bảng Orders và Orders Details, hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tổng số tiền sản phẩm của đơn hàng đó
SELECT o.OrderID, sum(od.UnitPrice*od.Quantity) AS [TotalMoney]
FROM dbo.Orders AS o, dbo.[Order Details] AS od
WHERE o.OrderID = od.OrderID
GROUP BY o.OrderID

--Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tên nhân viên
--Tổng số tiền sản phẩm của đơn hàng
SELECT o.OrderID, e.LastName, e.FirstName, sum(od.UnitPrice*od.Quantity) AS [TotalMoney]
FROM dbo.Orders AS o, dbo.[Order Details] AS od, dbo.Employees AS e
WHERE o.OrderID = od.OrderID AND e.EmployeeID=o.EmployeeID
GROUP BY o.OrderID, e.LastName, e.FirstName

--Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tên khách hàng
--Tên công ty vận chuyển
--Và chỉ in ra các đơn hàng được giao đến 'UK' trong năm 1997
SELECT o.OrderID, c.CompanyName AS [CUSTOMER NAME], s.CompanyName AS [SHIP NAME], o.ShipCountry, o.ShippedDate
FROM dbo.Customers AS c, dbo.Orders AS o, dbo.Shippers AS s
WHERE o.ShipVia = s.ShipperID AND o.CustomerID=c.CustomerID AND YEAR(o.ShippedDate) = '1997' AND o.ShipCountry = 'UK'
