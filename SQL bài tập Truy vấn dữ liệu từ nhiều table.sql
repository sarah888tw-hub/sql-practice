--Từ bảng Products và Categories, 
--hãy tìm các sản phẩm thuộc danh mục ‘Seafood’ 
--(Đồ hải sản) in ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm

SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products AS p, dbo.Categories AS c
WHERE c.CategoryName = 'Seafood' AND p.CategoryID=c.CategoryID

--Từ bảng Products và Suppliers, 
--hãy tìm các sản phẩm thuộc được cung cấp từ nước ‘Germany’ (Đức) :
--Mã nhà cung cấp
--Quốc gia
--Mã sản phẩm
--Tên sản phẩm
SELECT s.SupplierID, s.Country, p.ProductID, p.ProductName
FROM dbo.Products AS p, dbo.Suppliers AS s
WHERE s.Country = 'Germany' AND s.SupplierID=p.SupplierID

--Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tên khách hàng
--Tên công ty vận chuyển
--Và chỉ in ra các đơn hàng của các khách hàng đến từ thành phố ‘London’
SELECT o.[OrderID], c.ContactName AS [Customer Name], s.CompanyName AS [Shipper Name], c.City
FROM dbo.Customers AS c, dbo.Orders AS o, dbo.Shippers AS s
WHERE o.[ShipVia]=s.ShipperID 
    AND o.[CustomerID]=c.CustomerID 
    AND c.City='London'

--Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tên khách hàng
--Tên công ty vận chuyển
--Ngày yêu cầu chuyển hàng
---Và chỉ in ra các đơn hàng bị giao muộn hơn quy định.
--RequiredDate < ShippedDate
SELECT o.[OrderID], c.ContactName AS [Customer Name], s.CompanyName AS [Shipper Name], o.[RequiredDate], o.[ShippedDate]
FROM dbo.Customers AS c, dbo.Orders AS o, dbo.Shippers AS s
WHERE o.[ShipVia]=s.ShipperID 
    AND o.[CustomerID]=c.CustomerID 
    AND o.[RequiredDate]<o.[ShippedDate]

--Give these shipcountries for which customers don't come from the United States
--Select only this countries which is over than 100 orders
--Display Shipcountry and Number of order
SELECT o.[ShipCountry], count(o.[OrderID]) AS [TotalOrders]
FROM dbo.Customers AS c, dbo.Orders AS o
WHERE o.[CustomerID]=c.CustomerID AND NOT(c.Country = 'USA')
GROUP BY o.[ShipCountry]
HAVING count(o.[OrderID])>100 
