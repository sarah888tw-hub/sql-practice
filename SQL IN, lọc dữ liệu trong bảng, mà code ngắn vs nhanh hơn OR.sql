-- Lọc dữ liệu trong danh sách, IN khiến code ngắn gọn hơn OR rất nhiều
-- SELECT column_name
-- FROM table_name
-- WHERE column_name IN (value1, value2,...)
--Hãy lọc ra tất cả các đơn hàng với điều kiện:
--a, Đơn hàng được giao đến Germany, UK, Brazil
--b, Đơn hàng được giao đến các quốc gia khác Germany, UK, Brazil
SELECT *
FROM dbo.Orders 
WHERE ShipCountry IN ('Germany', 'UK', 'Brazil')

SELECT *
FROM dbo.Orders 
WHERE ShipCountry NOT IN ('Germany', 'UK', 'Brazil')

--Lấy ra các sản phẩm có mã thể loại khác với 2, 3 và 4.
SELECT *
FROM dbo.Products 
WHERE CategoryID NOT IN (2, 3, 4)

--Hãy liệt kê các nhân viên không phải là nữ từ bảng nhân viên.
SELECT *
FROM dbo.Employees 
WHERE TitleOfCourtesy NOT IN ('Ms.', 'Mrs.')
--Hãy liệt kê các nhân viên là nữ từ bảng nhân viên.
SELECT *
FROM dbo.Employees 
WHERE TitleOfCourtesy IN ('Ms.', 'Mrs.')
--Hãy lất ra KH đến từ các thành phố sau: Berlin, London, Warszawa
SELECT *
FROM dbo.Customers 
WHERE City IN ('Berlin', 'London', 'Warszawa')