USE NORTHWND
--SELECT COUNT(column_name)
--FROM table_name
-- Đếm số lượng dữ liệu (khác NULL) trong mỗi cột
-- Sử dụng COUNT(*) khi muốn đếm số lượng bản ghi
--SELECT SUM(column_name) / không dùng dấu * được
--FROM table_name
-- Nếu bất kì giá trị trong cột là NULL, kết quả là NULL
--SELECT AVG(column_name)
--FROM table_name
-- tính giá trị trung bình cho 1 cột
-- Nếu tất cả các giá trị trong cột là NULL, giá trị sẽ là NULL
-- Nếu chỉ 1 vài gtri là NILL, AVG sẽ bỏ qua NULL, chỉ tính trung bình gtri còn lại
--Hãy đếm số lượng khách hàng có trong bảng  (Customers)
SELECT COUNT(*) AS [NumberOfCustomers]
FROM [dbo].[Customers]
SELECT COUNT([CustomerID]) AS [NumberOfCustomers]
FROM [dbo].[Customers]

--Tính tổng số tiền vận chuyển (Freight)
--Của tất cả các đơn đặt hàng.
SELECT SUM([Freight]) AS [SumFreight]
FROM dbo.Orders 

--Tính trung bình số lượng đặt hàng (Quantity) 
--của tất cả các sản phẩm trong bảng [Order Details]
SELECT AVG([Quantity]) AS [AvgQuantity]
FROM dbo.[Order Details] 

--Đếm số lượng, tính tổng số lượng hàng trong kho 
--và trung bình giá của các sản phẩm có trong bảng Product.
SELECT COUNT(*) AS [NumberOfProducts],
       SUM([UnitsInStock]) AS [TotalUnitsInStock], 
       AVG([UnitPrice]) AS [AvgUnitPrice]
FROM dbo.Products 

SELECT COUNT(*) AS [NumberOfOrders]
FROM dbo.Orders
SELECT COUNT([OrderID]) AS [NumberOfOrders]
FROM dbo.Orders

SELECT AVG([UnitPrice]) AS [AvgOfUnitPrice],
       SUM([Quantity]) AS [SumOfQuantity]
FROM dbo.[Order Details] 