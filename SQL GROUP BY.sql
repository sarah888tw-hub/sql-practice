--GROUP BY_Nhóm dữ liệu trong SQL
--SELECT column_name
--FROM table_name
--WHERE condition
--GROUP BY column_name
--ORDER BY column_name
--ãy cho biết mỗi khách hàng đã đặt bao nhiêu đơn hàng?
SELECT CustomerID, COUNT([OrderID]) AS [TotalOrders]
FROM dbo.Orders 
GROUP BY CustomerID 

--Hãy tính giá trị đơn giá trung bình theo mỗi nhà cung cấp sản phẩm.
SELECT SupplierID, AVG([UnitPrice]) AS [AVGUnitPrice]
FROM dbo.Products 
GROUP BY SupplierID  

--Hãy cho biết mỗi thể loại có tổng số bao nhiêu sản phẩm trong kho (UnitsOnStock)?
SELECT CategoryID, SUM([UnitsInStock]) AS [TotalofUnitsInStock]
FROM dbo.Products 
GROUP BY CategoryID 

--Hãy cho biết giá vận chuyển thấp nhất và lớn nhất
--của các đơn hàng theo từng thành phố và quốc gia khác nhau.
SELECT ShipCity, ShipCountry, 
       MIN([Freight]) AS [MinFreight],
       MAX([Freight]) AS [MaxFreight]
FROM dbo.Orders 
GROUP BY ShipCity, ShipCountry 
ORDER BY ShipCountry ASC, ShipCity ASC

-- Hãy thống kê số lượng nhân viên theo từng quốc gia khác nha
SELECT Country, COUNT(EmployeeID) AS [TotalofEmployeeID]
FROM dbo.Employees 
GROUP BY Country 

