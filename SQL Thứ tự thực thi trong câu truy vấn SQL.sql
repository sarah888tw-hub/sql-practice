--Thứ tự thực thi trong câu truy vấn SQL
--SELECT DISTINCT 9 TOP 11,,8 (8 lấy ra cột nào đấy, sau đó mới 9 là bỏ trùng lặp) -> sắp xếp xong mới xét top
--FROM 1 (Kiểm tra table trước)
--full/L/R 4 outer JOIN 2 ON 3 (vào JOIN, KTRA điều kiện on rồi mới xét đến full hay left hy right)
--WHERE 5 
--GROUP BY 6
--HAVING 7
--ORDER BY 10  (tiếp đến sắp xếp) SELECT XONG MỚI SẮP XẾP
SELECT p.ProductID, p.ProductName --2
FROM dbo.Products p --1

SELECT p.ProductID, p.ProductName --3
FROM dbo.Products p --1
WHERE p.CategoryID=1 --2

SELECT p.CategoryID, count(p.ProductID) as [TotalProducts] --4
FROM dbo.Products p --1
WHERE p.CategoryID IN (1, 2, 3) --2
GROUP BY p.CategoryID --3

SELECT p.CategoryID, count(p.ProductID) as [TotalProducts] --5
FROM dbo.Products p --1
WHERE p.CategoryID IN (1, 2, 3, 4, 5, 6, 7) --2
GROUP BY p.CategoryID --3
HAVING count(p.ProductID)>=10 --4

SELECT p.CategoryID, count(p.ProductID) as [TotalProducts] --5
FROM dbo.Products p --1
WHERE p.CategoryID IN (1, 2, 3, 4, 5, 6, 7) --2
GROUP BY p.CategoryID --3
HAVING count(p.ProductID)>=10 --4 [TotalProducts] CHƯA TỒN TẠI
ORDER BY [TotalProducts] ASC --6 [TotalProducts] ĐÃ TỒN TẠI

SELECT TOP 3 P.ProductID, o.Discount, o2.ShipCountry -- chọn 9 ->top 11
FROM dbo.Products p --1
INNER JOIN dbo.[Order Details] o --2 -> inner 4
ON p.ProductID=o.ProductID  --3
INNER JOIN dbo.Orders o2 --5 inner 7
ON o.OrderID=o2.OrderID --6
WHERE o.Discount=0.25 AND o2.ShipCountry='Germany' --8
ORDER BY p.ProductID DESC --10
