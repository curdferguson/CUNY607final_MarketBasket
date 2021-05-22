CREATE VIEW TransactionLineView AS
	SELECT L.LineID AS LineID, L.InvoiceID AS InvoiceID, V.InvoiceDate AS Date, V.CustomerID AS CustomerID, C.Country AS Country, 
		L.StockCode AS StockCode, I.Description AS Description, L.Quantity AS Qty, I.Price AS Price
	FROM Items AS I 
		RIGHT JOIN InvoiceLine AS L ON I.StockCode = L.StockCode
			LEFT JOIN Invoices AS V ON L.InvoiceID = V.InvoiceID 
				LEFT JOIN Customers AS C on V.CustomerID = C.CustomerID;

SELECT TOP 10 * FROM TransactionLineView;



CREATE VIEW TransactionTotalView AS
	SELECT L.InvoiceID AS InvoiceID, MAX(V.InvoiceDate) AS Date, MAX(V.CustomerID) AS CustomerID, MAX(C.Country) AS Country, SUM(L.Quantity * I.Price) AS Total
	FROM Items AS I 
		RIGHT JOIN InvoiceLine AS L ON I.StockCode = L.StockCode
			LEFT JOIN Invoices AS V ON L.InvoiceID = V.InvoiceID 
				LEFT JOIN Customers AS C on V.CustomerID = C.CustomerID
	GROUP BY L.InvoiceID;

SELECT TOP 10 * FROM TransactionTotalView;
