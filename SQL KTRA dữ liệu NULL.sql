--NULL, không tồn tại dữ liệu
-- KTRA dữ liệu NULL
-- SELECT column-name
-- FROM table_name
-- WHERE column_name IS NULL (IS NOT NULL)
-- Ko có ví tiền, là NULL, cả chuỗi ko tồn tại
-- Có ví tiền mà ko có tiền, ko phải NULL, chỉ là EMPTY
-- Lấy ra tất cả các đơn hàng chưa được giao hàng.
SELECT *
FROM dbo.Orders
WHERE ShippedDate IS NULL

--Lấy danh sách các khách hàng có khu vực (Region) không bị NULL.
SELECT *
FROM dbo.Customers 
WHERE Region IS NOT NULL

--Lấy danh sách các khách hàng không có tên công ty (CompanyName).
SELECT *
FROM dbo.Customers 
WHERE CompanyName IS NULL

--Hãy lấy ra tất cả đơn hàng chưa được giao hàng và có khu vực giao hàng
SELECT *
FROM dbo.Orders 
WHERE ShippedDate IS NULL AND ShipRegion IS NOT NULL
