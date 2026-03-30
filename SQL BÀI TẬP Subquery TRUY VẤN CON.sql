--Liệt kê các đơn hàng có ngày đặt hàng gần nhất
SELECT *
FROM dbo.Orders o
WHERE o.OrderDate=
(
SELECT MAX(OrderDate)
FROM dbo.Orders
)

--Liệt kê các sản phẩm mà không có đơn đặt hàng
SELECT *
FROM dbo.Products p
WHERE p.ProductID NOT IN
(
SELECT DISTINCT ProductID
FROM dbo.[Order Details]
)

--lấy thông tin các đơn hàng,tên sản phẩm thuộc các đơn chưa được giao cho khách
SELECT o.*,p.ProductName
FROM dbo.Orders o
INNER JOIN dbo.[Order Details] od
ON o.OrderID=od.OrderID
INNER JOIN dbo.Products p
ON od.ProductID=p.ProductID
WHERE o.OrderID IN
(
SELECT OrderID
FROM dbo.Orders
WHERE ShippedDate IS NULL
)

--Lấy thông tin về các sản phẩm có số lượng tồn kho
--ít hơn số lượng tồn kho trung bình của tất cả các sản phầm
SELECT *
FROM dbo.Products p
WHERE p.UnitsInStock >
(
SELECT AVG(UnitsInStock)
FROM dbo.Products
)

--lấy thông tin các KH có tổng giá trị đơn hàng lớn nhất
SELECT TOP 1 *, 
(SELECT SUM(UnitPrice*Quantity)
FROM dbo.[Order Details] 
) AS[TotalMoney]
FROM dbo.Customers c
INNER JOIN dbo.Orders o
ON c.CustomerID=o.CustomerID
INNER JOIN dbo.[Order Details] od
ON o.OrderID=od.OrderID

