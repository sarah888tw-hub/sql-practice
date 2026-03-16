--Viết câu lệnh SQL lấy ra 05 dòng đầu tiên 
--Giới hạn số lượng dòng (hoặc %) được trả về khi gọi SELECT
--* là lấy hết dữ liệu
SELECT TOP 10 *
FROM dbo.Customers 

--Viết câu lệnh SQL lấy ra 30% nhân viên của công ty hiện tại
SELECT TOP 100 percent *
FROM dbo.Employees 

--Viết câu lệnh SQL lấy ra các mã khách hàng trong bảng đơn hàng với quy định là mã khách hàng không được trùng lặp, chỉ lấy 5 dòng dữ liệu đầu tiên.
SELECT DISTINCT CustomerID 
FROM dbo.Orders 
SELECT DISTINCT TOP 5 CustomerID 
FROM dbo.Orders 

--Lấy thể loại sản phẩm ko bị trùng lặp, 3 dòng đầu
SELECT DISTINCT TOP 3 CategoryID  
FROM dbo.Products 

SELECT DISTINCT TOP 5 CompanyName  
FROM dbo.Suppliers 