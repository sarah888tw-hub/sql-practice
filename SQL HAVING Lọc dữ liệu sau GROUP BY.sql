--HAVING: Lọc dữ liệu sau GROUP BY
--mục đích lọc cho cột mới
--SELECT column_name
--FROM table_name
--WHERE condition
--GROUP BY column_name
--HAVING condition
--ORDER BY column_name
--Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng, 
--sắp xếp theo thứ tự tổng số đơn hàng giảm dần.
SELECT CustomerID, count(OrderID) AS [TotalOfOrders]
FROM dbo.Orders 
GROUP BY CustomerID 
HAVING count(OrderID)>20
ORDER BY count(OrderID) DESC

--Hãy lọc ra những nhà cung cấp sản phẩm có tổng số lượng 
--hàng trong kho (UnitsInStock) lớn hơn 30, và có trung bình 
--đơn giá (UnitPrice) có giá trị dưới 50.
SELECT SupplierID, 
       SUM(UnitsInStock) AS [TotalOfUnitsInStock],
       AVG(UnitPrice) AS [AVGUnitPrice]
FROM dbo.Products 
GROUP BY SupplierID 
HAVING SUM(UnitsInStock)>30 AND AVG(UnitPrice)<50

--Hãy cho biết tổng số tiền vận chuyển của từng tháng, 
--trong nửa năm sau của năm 1996, sắp xếp theo tháng tăng dần.
--Tổng tiền vận chuyển >1000 đô
SELECT MONTH(ShippedDate) AS [Month], 
SUM([Freight]) AS [TotalOfFreight]
FROM dbo.Orders 
WHERE ShippedDate BETWEEN '1996-07-01' AND '1996-12-31'
GROUP BY MONTH(ShippedDate)
HAVING SUM([Freight])>1000
ORDER BY MONTH(ShippedDate) ASC

--Hãy lọc ra những thành phố
--có số lượng đơn hàng lớn hơn 16
--và sắp xếp tổng số lượng giảm dần
SELECT ShipCity, count(OrderID) AS [TotalOfOrders]
FROM dbo.Orders 
GROUP BY ShipCity  
HAVING count(OrderID)>16
ORDER BY count(OrderID) DESC