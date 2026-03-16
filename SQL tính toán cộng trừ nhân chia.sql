--Tính số lượng sản phẩm còn lại trong kho (UnitsInStock) 
--sau khi bán hết các sản phẩm đã được đặt hàng (UnitsOnOrder) .
-- StockRemaining = UnitsInStock - UnitsOnOrder
SELECT ProductID,
       ProductName,
       UnitsInStock,
       UnitsOnOrder,
        (UnitsInStock - UnitsOnOrder) AS [StockRemaining]
FROM dbo.Products 

--Tính giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng OrderDetails
SELECT *,
       (UnitPrice * Quantity ) AS [OrderDetailValue]
FROM dbo.[Order Details] 

--Tính tỷ lệ giá vận chuyển đơn đặt hàng (Freight) trung bình
--của các đơn hàng trong bảng Orders so với giá trị vận chuyển của đơn hàng lớn nhất (MaxFreight)
SELECT
        AVG([Freight])/MAX([Freight]) AS [FreightRatio]
FROM [dbo].[Orders]

-- Liệt kê danh sách các sản phẩm và giá của ừng sản phẩm sau khi giảm giá 10%
SELECT *,
       UnitPrice*90/100 AS [UnitPrice_Discount]
FROM dbo.Products 

