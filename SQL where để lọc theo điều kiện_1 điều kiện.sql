USE NORTHWND 
--SELECT column1, column2,...
--FROM table_name
--WHERE condition
--Bạn hãy liệt kê tất cả các nhân viên đến từ thành phố London.
--Sắp xếp kết quả theo lastname A->Z
SELECT *
FROM dbo.Employees 
WHERE City = 'London'
ORDER BY LastName ASC

--Bạn hãy liệt kê tất các đơn hàng bị giao muộn, 
--biết rằng ngày cần phải giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate.
SELECT COUNT(*) AS [So don giao hang muon]
FROM dbo.Orders 
WHERE ShippedDate > RequiredDate 

--Lấy ra tất cả các đơn hàng chi tiết được giảm giá nhiều hơn 10%.
-- (Discount > 0.1)
SELECT *
FROM dbo.[Order Details]  
WHERE Discount > 0.1 

-- Hãy liệt kê tất cả các đơn hàng được gửi đến quốc gia France
SELECT *
FROM dbo.Orders 
WHERE ShipCountry = 'France'

-- Hãy liệt kê các sp có số lượng hàng trong kho lớn hơn 20
SELECT *
FROM dbo.Products 
WHERE UnitsInStock > 20
