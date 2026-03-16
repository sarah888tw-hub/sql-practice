--Hàm lấy ngày, tháng, năm
SELECT DAY('2023-08-25')
-- KQ 25
SELECT MONTH('2023-08-25')
-- KQ 8
SELECT YEAR('2023-08-25')
-- KQ 2023

-- Tính số lượng đơn đặt hàng trong năm 1997 của từng khách hàng
SELECT CustomerID, COUNT(*) AS [TotalOrder], YEAR(OrderDate) AS [Year]
FROM dbo.Orders 
WHERE YEAR(OrderDate)=1997
GROUP BY CustomerID, YEAR(OrderDate) 

-- Hãy lọc ra các đơn hàng được đặt hàng vào tháng 5 năm 1997
SELECT *
FROM dbo.Orders 
WHERE YEAR(OrderDate)=1997 AND MONTH(OrderDate)=5

--Lấy danh sách khách hàng đặt hàng trong năm 1998 
--và số đơn hàng mỗi tháng, sắp xếp tăng dần
SELECT CustomerID, MONTH(OrderDate) as [Month], count (*) AS [TotalOrders]
FROM dbo.Orders 
WHERE YEAR(OrderDate)=1998
GROUP BY CustomerID, MONTH(OrderDate)
ORDER BY MONTH(OrderDate) ASC

--Hãy lọc các đơn đặt hàng đã được giao vào tháng 5, sắp xếp tăng dần theo năm
SELECT OrderID, YEAR(ShippedDate) as [Year]
FROM dbo.Orders
WHERE MONTH(ShippedDate) = 5
GROUP BY OrderID,YEAR(ShippedDate)
ORDER BY YEAR(ShippedDate) ASC