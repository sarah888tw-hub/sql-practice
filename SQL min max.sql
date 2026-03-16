--Viết câu lệnh SQL tìm giá thấp nhất của các sẩn phẩm trong bảng
SELECT MIN([UnitPrice]) AS [MinPrice]
FROM dbo.Products 

--Viết câu lệnh lấy ra ngày đặt hàng gần đây nhất từ bảng Orders.
SELECT MAX([OrderDate]) AS [MaxOrderDate]
FROM dbo.Orders

-- Viết câu lệnh SQL tìm số lượng hàng trong kho (UnitsInStock) lớn nhất.
SELECT MAX([UnitsInStock]) AS [MaxUnitsInStock]
FROM dbo.Products 

--Ngày sinh của nhân viên có tuổi đời lớn nhất cty
SELECT MIN([BirthDate]) AS [Maxage]
FROM dbo.Employees 

SELECT MAX([QuantityPerUnit]) AS [Số lượng]
FROM dbo.Products 