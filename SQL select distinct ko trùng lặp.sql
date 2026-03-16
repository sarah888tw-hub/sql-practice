--Viết câu lệnh SQL lấy ra tên các quốc gia (Country) khác nhau
SELECT DISTINCT [Country]
FROM [dbo].[Customers];
--Viết câu lệnh SQL lấy ra tên các mã số bưu điện (PostalCode) khác nhau từ bảng Nhà cung cấp Suppliers
SELECT DISTINCT PostalCode 
FROM dbo.Suppliers 
--Viết câu lệnh SQL lấy ra các dữ liệu khác nhau về họ của nhân viên (LastName) và cách gọi danh hiệu lịch sự (TitleOfCourtesy) của nhân viên từ bảng Employees
SELECT DISTINCT LastName, TitleOfCourtesy 
FROM dbo.Employees 
SELECT LastName, TitleOfCourtesy 
FROM dbo.Employees 
SELECT DISTINCT TitleOfCourtesy 
FROM dbo.Employees 
SELECT TitleOfCourtesy 
FROM dbo.Employees 

SELECT DISTINCT ShipPostalCode 
FROM dbo.Orders  


SELECT DISTINCT CompanyName 
FROM dbo.Customers 