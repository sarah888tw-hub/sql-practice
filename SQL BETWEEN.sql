USE NORTHWND 
--SELECT column_name
--FROM table_name
--WHERE column_name BETWEEN value1 AND value2
--Lấy danh sách các sản phẩm có giá bán trong khoảng từ 10 đến 20 đô la.
SELECT *
FROM dbo.Products 
WHERE UnitPrice BETWEEN 10 AND 20

--Lấy danh sách các đơn đặt hàng được đặt trong khoảng thời gian 
--từ ngày 1996-07-01 đến ngày 1996-07-31:
SELECT *
FROM dbo.Orders 
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31'

--Tính tổng số tiền vận chuyển (Freight) của các
--đơn đặt hàng được đặt trong khoảng thời gian từ ngày 1996-07-01 
--đến ngày 1996-07-31:
SELECT SUM(Freight) AS [So tien van chuyen]
FROM dbo.Orders 
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31'

--lấy danh sách các đơn hàng có ngày đặt hàng từ 1/1/1997 đến 31/12/1997
--và được vận chuyển bằng đường tày thủy (ShipVia=3)
SELECT *
FROM dbo.Orders 
WHERE (OrderDate BETWEEN '1997-01-01' AND '1997-12-31') AND ShipVia =3
