USE NORTHWND
--Từ bảng Order Details hãy liệt kê 
--các đơn đặt hàng có Unit Price 
--nằm trong phạm vi từ 100 đến 200.
--I 22 dòng
SELECT od.OrderID
FROM dbo.[Order Details] od
WHERE od.UnitPrice BETWEEN 100 AND 200

--Đưa ra các đơn đặt hàng có 
--Quantity bằng 10 hoặc 20
--II 433 dòng
SELECT od.OrderID
FROM dbo.[Order Details] od
WHERE od.Quantity IN(10,20)

--Từ bảng Order Details hãy liệt kê các 
--đơn đặt hàng có Unit Price nằm trong phạm 
--vi từ 100 đến 200 VÀ đơn hàng phải có Quantity 
--bằng 10 hoặc 20
--III = (I AND II) = 7 rows
SELECT od.OrderID
FROM dbo.[Order Details] od
WHERE od.Quantity IN(10,20) AND od.UnitPrice BETWEEN 100 AND 200

--Từ bảng Order Details hãy liệt kê các 
--đơn đặt hàng có Unit Price nằm trong phạm vi từ 100 đến 200 
--HOAC đơn hàng phải có Quantity bằng 10 hoặc 20
--IV = (I OR II) = 448 rows
SELECT od.OrderID
FROM dbo.[Order Details] od
WHERE od.Quantity IN(10,20) OR od.UnitPrice BETWEEN 100 AND 200

--Từ bảng Order Details hãy liệt kê các 
--đơn đặt hàng có Unit Price nằm trong phạm vi từ 100 đến 200 
--HOAC đơn hàng phải có Quantity bằng 10 hoặc 20, DISTINCT
--V = IV + DISTINCT = 360 (DISTINCT KHÔNG LẶP LẠI)
SELECT DISTINCT od.OrderID
FROM dbo.[Order Details] od
WHERE od.Quantity IN(10,20) OR od.UnitPrice BETWEEN 100 AND 200

-- Nếu thêm điều kiện quá nhiều, thủ công rất khó xử lý nên phải dùng UNION
--Kết hợp nhiều truy vấn lại vs nhau thanh kết quả chung
--Có kết quả r mới gom lại
--UNION
--Mỗi câu lệnh phải có cùng số lượng cột
--Các cột phải có cùng kiểu dữ liệu
--Các cột trong mỗi câu lệnh phải cùng thứ tự
--UNION
--Cho phép các giá trị bị lặp lại khi khi trộn các kết quả vs nhau

--UNION
--V = (I OR II) = 360
SELECT od.OrderID
FROM dbo.[Order Details] od
WHERE od.UnitPrice BETWEEN 100 AND 200
UNION 
SELECT od.OrderID
FROM dbo.[Order Details] od
WHERE od.Quantity IN(10,20)
--IV = (I OR II)= 455 = 448+7
SELECT od.OrderID
FROM dbo.[Order Details] od
WHERE od.UnitPrice BETWEEN 100 AND 200
UNION ALL 
SELECT od.OrderID
FROM dbo.[Order Details] od
WHERE od.Quantity IN(10,20)

--Hãy liệt kê toàn bộ các thành phố và quốc gia tồn tại trong 2 tables sau đây
--Với 2 tình huống sử dụng UNION, UNION ALL
SELECT DISTINCT Country
FROM dbo.Suppliers

SELECT DISTINCT Country
FROM dbo.Customers
-- Tạo ra sự lựa chọn quốc gia đầy đủ ở 2 bảng không trùng lặp
SELECT DISTINCT Country
FROM dbo.Suppliers
UNION 
SELECT DISTINCT Country
FROM dbo.Customers
-- Tạo ra sự lựa chọn quốc gia đầy đủ ở 2 bảng có trùng lặp
SELECT DISTINCT Country
FROM dbo.Suppliers
UNION ALL
SELECT DISTINCT Country
FROM dbo.Customers

SELECT City,Country
FROM dbo.Customers
WHERE Country LIKE 'U%'
UNION 
SELECT City,Country
FROM dbo.Suppliers
WHERE City = 'London'
UNION 
SELECT ShipCity,ShipCountry
FROM dbo.Orders
WHERE ShipCountry = 'USA'
