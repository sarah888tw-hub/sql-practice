-- Cách đặt tên thay thế cho cột và bảng - Alias
-- SELECT column_name AS [alias_name]
-- FROM table_name
-- Mục đích của alias giúp code ngắn gọn và dễ đọc hơn
-- Viết câu lệnh SQL lấy “CompanyName” và đặt tên thay thế là “Công ty”; 
-- “PostalCode” và đặt tên thay thế là “Mã bưu điện”
SELECT CompanyName AS [Tên công ty], PostalCode AS [Mã bưu điện],City AS [Thành phố]
FROM dbo.Customers

-- LẤY LASTNAME THÀNH HỌ, FIRST NAME THÀNH TÊN
SELECT LastName AS [Họ], FirstName [Tên]
FROM dbo.Employees 

--Lấy ra 15 dòng đầu tiên tất cả các cột trong bảng orders, đặt tên thay thế cho bảng order là O
SELECT TOP 15 [o].*
FROM dbo.Orders AS [o] 
-- Câu lệnh trên khác gì vs mấy câu lệnh ban đầu
-- Câu lệnh trên là thay đổi tên cả bảng, mấy câu lệnh ban đầu là thau đổi tên cột

SELECT ProductName AS [Tên sản phầm], SupplierID [Mã nhà cung cấp],CategoryID [Mã thể loại]
FROM dbo.Products   
SELECT TOP 5 p.[ProductName] AS [Tên sản phầm], p.[SupplierID] [Mã nhà cung cấp],p.[CategoryID] [Mã thể loại] 
FROM dbo.Products AS [p]
-- Câu lệnh thay đổi tên và địa chỉ của nhà cung cấp, lấy 10 dòng đầu, tên và địa chỉ, số điện thoại. Thay tên nhà cung cấp thành s
SELECT TOP 10 s.CompanyName [Tên], s.Address [Địa chỉ],s.Phone [Số điện thoại]
FROM dbo.Suppliers as [s] 



