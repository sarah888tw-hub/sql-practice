--WILDCARD-Ký tự đại diện trong SQL
--% ví dụ bl% sẽ ra bl, black, blue, blob,...
--(_) ví dụ h_t sẽ tìm ra hot, hat, hit
--[] ví dụ h[oa]t sẽ ra hot và hat, ko ra hit
--^ ko chưa kí tự, ví dụ h[^oa]t tìm ra hit, nhưng ko tìm ra hot, hat
-- (-) đại diện khoảng c[a-b]t tìm ra cat, cbt, ko tìm ra cot
--Hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ ‘A’
SELECT *
FROM dbo.Customers 
WHERE ContactName LIKE 'A%'

--Hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ ‘H’
--và có chữ thứ 2 là bất kỳ ký tự nào.
SELECT *
FROM dbo.Customers 
WHERE ContactName LIKE 'H_%'

--Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố 
--có chữ cái bắt đầu là L, chữ cái thứ hai là u hoặc o.
SELECT *
FROM dbo.Orders 
WHERE ShipCity LIKE 'L[uo]%'

--Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố 
--có chữ cái bắt đầu là L, chữ cái thứ hai không là u hoặc o.
SELECT *
FROM dbo.Orders 
WHERE ShipCity LIKE 'L[^uo]%'

--Hãy lọc ra tất cả các đơn hang được gửi đến thành phố có 
--chữ cái bắt đầu là L, chữ cái thứ hai là các ký tự từ a đến e.
SELECT *
FROM dbo.Orders 
WHERE ShipCity LIKE 'L[a-e]%'

--Hãy lấy ra tất cả các nhà cung cấp hàng có tên công ty bắt đầu bằng chữ G, không chứa kí tự m
SELECT *
FROM dbo.Suppliers
WHERE CompanyName LIKE 'G%'
AND CompanyName NOT LIKE '%m%'