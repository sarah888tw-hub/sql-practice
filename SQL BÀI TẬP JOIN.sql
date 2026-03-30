--Bài tập 1 (INNER JOIN): Liệt kê tên sản phẩm và tên nhà cung cấp
--của các sản phẩm đã được đặt hàng trong bảng “Order Details”. 
--Sử dụng INNER JOIN để kết hợp bảng “Order Details” với các bảng 
--liên quan để lấy thông tin sản phẩm và nhà cung cấp.
SELECT DISTINCT od.ProductID,p.ProductName,s.CompanyName
FROM dbo.Products p
INNER JOIN dbo.[Order Details] od
ON p.ProductID=od.ProductID
INNER JOIN dbo.Suppliers s
ON p.SupplierID=s.SupplierID

--Bài tập 2 (LEFT JOIN): Liệt kê tên khách hàng và tên 
--nhân viên phụ trách của các đơn hàng trong bảng “Orders”. 
--Bao gồm cả các đơn hàng không có nhân viên phụ trách.
--Sử dụng LEFT JOIN để kết hợp bảng “Orders” với bảng “Employees” 
--để lấy thông tin về khách hàng và nhân viên phụ trách.
SELECT o.OrderID, c.CompanyName,e.LastName,e.FirstName
FROM dbo.Orders o
LEFT JOIN dbo.Customers c 
ON o.CustomerID=c.CustomerID
LEFT JOIN dbo.Employees e
ON o.EmployeeID=e.EmployeeID

--Bài tập 3 (RIGHT JOIN): Liệt kê tên khách hàng và tên 
--nhân viên phụ trách của các đơn hàng trong bảng “Orders”. 
--Bao gồm cả các khách hàng không có đơn hàng.
--Sử dụng RIGHT JOIN để kết hợp bảng “Orders” với bảng “Employees” 
--để lấy thông tin về khách hàng và nhân viên phụ trách.
SELECT o.OrderID, c.CompanyName,e.LastName,e.FirstName
FROM dbo.Orders o
RIGHT JOIN dbo.Customers c 
ON o.CustomerID=c.CustomerID
RIGHT JOIN dbo.Employees e
ON o.EmployeeID=e.EmployeeID


--Bài tập 4 (FULL JOIN): Liệt kê tên danh mục và tên 
--nhà cung cấp của các sản phẩm trong bảng “Products”. 
--Bao gồm cả các danh mục và nhà cung cấp không có sản phẩm. 
--Sử dụng FULL JOIN hoặc kết hợp LEFT JOIN và RIGHT JOIN để lấy  
--thông tin về danh mục và nhà cung cấp.
SELECT DISTINCT p.ProductName, c.CategoryName, s.CompanyName
FROM dbo.Products p
FULL JOIN dbo.Suppliers s
ON p.SupplierID = s.SupplierID
FULL JOIN dbo.Categories c
ON c.CategoryID=p.CategoryID

--Bài tập 5 (INNER JOIN): Liệt kê tên khách hàng và tên sản phẩm
--đã được đặt hàng trong bảng “Order Details” và "Orders" 
--Sử dụng INNER JOIN để kết hợp bảng bảng “Order Details” và "Orders"  
--để lấy thông tin khách hàng và sản phẩm đã được đặt hàng
SELECT od.*,c.CompanyName
FROM dbo.Orders o
INNER JOIN dbo.[Order Details] od
ON o.OrderID=od.OrderID
INNER JOIN dbo.Customers c
ON o.CustomerID=c.CustomerID

--Bài tập 6 (FULL JOIN): Liệt kê tên nhân viên và tên khách hàng 
--của các đơn hàng trong bảng "Orders" 
--Bao gồm cả các đơn hàng ko có nhân viên hoặc khách hàng tương ứng
--Sử dụng FULL JOIN hoặc kết hợp LEFT JOIN và RIGHT JOIN để kết hợp  
--bảng "Orders" vs bảng "Employees" và "Customers" để lấy thông tin nhân viên và khách hàng
SELECT o.OrderID, c.CompanyName,e.LastName,e.FirstName
FROM dbo.Orders o
FULL JOIN dbo.Customers c 
ON o.CustomerID=c.CustomerID
FULL JOIN dbo.Employees e
ON o.EmployeeID=e.EmployeeID
