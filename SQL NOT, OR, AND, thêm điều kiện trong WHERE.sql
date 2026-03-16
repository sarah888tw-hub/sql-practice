-- AND. phải thỏa mãn tất cả điều kiện
--SELECT column1, column2,... 
--FROM table_name
--WHERE condition1 AND conition2 AND condition3

-- OR. Chỉ cần thỏa mãn 1 điều kiện
--SELECT column1, column2,... 
--FROM table_name
--WHERE condition1 OR conition2 OR condition3

-- NOT. hiển thị nếu điều kiện có gtri sai
--SELECT column1, column2,... 
--FROM table_name
--WHERE NOT condition

--Bạn hãy liệt kê tất cả các sản phẩm có số lượng trong kho (UnitsInStock)
--nhỏ hơn 50 hoặc lớn hơn 100.
SELECT *
FROM dbo.Products 
WHERE UnitsInStock<50 OR UnitsInStock >100

--Bạn hãy liệt kê tất các đơn hàng được giao đến Brazil, đã bị giao muộn, 
--biết rằng ngày cần phải giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate.
SELECT *
FROM dbo.Orders 
WHERE ShipCountry = 'Brazil' AND ShippedDate > RequiredDate 

-- Lấy ra tất cả các sản phẩm có giá dưới 100$ và mã thể loại khác 1.
--Lưu ý: dùng NOT
SELECT *
FROM dbo.Products  
WHERE NOT (UnitPrice >=100 OR CategoryID=1)

-- Hãy liệt kê tất cả các đơn hàng có giá vận chuyển Freight trong khoảng [50,100] đô la
SELECT *
FROM dbo.Orders 
WHERE Freight >=50 AND Freight <=100
-- Hãy liệt kê các sp có số lượng hàng trong kho lớn hơn 20 và số lượng hàng trong đơn hàng nhỏ hơn 20
SELECT *
FROM dbo.Products 
WHERE NOT (UnitsInStock<=20 OR UnitsOnOrder >=20)

