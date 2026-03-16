USE NORTHWND 
-- Phục vụ mục đích tìm kiếm bằng từ khóa
--SELECT column1, column2,...
--FROM table_name
--WHERE columnN LIKE pattern
--% đại diện cho 0, 1 hoặc nhiều kí tự
--(_) đại diện cho duy nhất 1 kí tự đơn
--Hãy lọc ra tất cả các khách hàng đến từ các quốc gia (Country)
--bắt đầu bằng chữ ‘A’
SELECT *
FROM dbo.Customers 
WHERE Country LIKE 'A%'

--Lấy danh sách các đơn đặt được gửi đến các thành phố có chứa chữ ‘a’.
SELECT *
FROM dbo.Orders 
WHERE ShipCity LIKE '%a%'

--Hãy lọc ra tất cả các đơn hàng với điều kiện:
--ShipCountry  LIKE ‘U_’
--ShipCountry LIKE ‘U%’
SELECT *
FROM dbo.Orders 
--WHERE ShipCountry LIKE 'U__'
WHERE ShipCountry LIKE 'U%'

-- lấy ra tất cả nhà cung cấp có chữ 'b' trong tên công ty
SELECT *
FROM dbo.Suppliers 
WHERE CompanyName LIKE '%b%'