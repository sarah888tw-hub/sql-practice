--Subquery hoạt động như 1 bảng ảo tạm thời
--nó được sử dụng để trích xuất thông tin từ các bảng hoặc tập dữ liệu
--khác nhau trong cùng 1 câu truy vấn
--Được sử dụng ở bên trong 1 truy vấn khác, truy vấn con
--Liệt kê ra toàn bộ sản phẩm
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products

--Tìm giá trung bình của các sản phẩm
SELECT AVG(UnitPrice)
FROM dbo.Products

--Lọc những sản phẩm có giá > giá trung bình DÙNG SUB QUERY
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice > 
     (SELECT AVG(UnitPrice)
      FROM dbo.Products)

--Lọc ra những khách hàng có số đơn hàng > 10, DÙNG HAVING
SELECT c.CustomerID, c.CompanyName, count(o.OrderID) AS [TotalOrders]
FROM dbo.Customers c
LEFT JOIN dbo.Orders o
ON c.CustomerID=o.CustomerID
GROUP BY c.CustomerID, c.CompanyName 
HAVING count(o.OrderID) >10
--Lọc ra những khách hàng có số đơn hàng > 10, DÙNG SUB QUERY
SELECT*
FROM dbo.Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM dbo.Orders
    GROUP BY CustomerID
    HAVING count(OrderID)>10)

--Tính tổng tiền cho từng đơn hàng
SELECT o.*,
   (
   SELECT SUM(od.Quantity*od.UnitPrice) 
   FROM dbo.[Order Details] od
   WHERE o.OrderID=od.OrderID
   ) AS [TotalMoney]
FROM dbo.Orders o

--Lọc ra tên sản phẩm và tổng số đơn hàng của sản phẩm
SELECT p.ProductID,p.ProductName,
   (
   SELECT count(*)
   FROM dbo.[Order Details] od
   WHERE od.ProductID=p.ProductID
   ) as [TotalOrders]
FROM dbo.Products p

--In ra mã đơn hàng và số lượng sản phẩm của đơn hàng đó
SELECT o.OrderID,
   (
   SELECT SUM(od.Quantity)
   FROM dbo.[Order Details] od
   WHERE od.OrderID=o.OrderID
   ) as [TotalProductsPerOrder]
FROM dbo.Orders o

SELECT od.OrderID, SUM(od.Quantity) AS [TotalProductsPerOrder]
FROM dbo.[Order Details] od
GROUP BY od.OrderID
