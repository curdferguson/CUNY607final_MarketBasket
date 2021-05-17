/* Populate the Customers table */
DELETE FROM Customers;

INSERT INTO Customers (CustomerID, Country)
	SELECT DISTINCT a.Customer_ID, b.Country 
	FROM online_retail_II AS a LEFT JOIN online_retail_II AS b ON a.Customer_ID = b.Customer_ID
	WHERE a.Customer_ID IS NOT NULL;

/* Populate the Items table */
DELETE FROM Items;

INSERT INTO Items (StockCode, Description, Price)
	SELECT DISTINCT a.StockCode, b.Description, b.Price 
	FROM online_retail_II AS a LEFT JOIN online_retail_II AS b ON a.StockCode = b.StockCode
	WHERE a.Invoice IS NOT NULL;


/* Populate the Invoices table */
DELETE FROM Invoices;

INSERT INTO Invoices (InvoiceID, InvoiceDate, CustomerID)
	SELECT DISTINCT a.Invoice, b.InvoiceDate, b.Customer_ID
	FROM online_retail_II AS a LEFT JOIN online_retail_II AS b ON a.Invoice = b.Invoice
	WHERE a.Invoice IS NOT NULL;

/* Populate the InvoiceLine table */
DELETE FROM InvoiceLine;

INSERT INTO InvoiceLine (InvoiceID, StockCode, Quantity)
	SELECT a.Invoice, b.StockCode, b.Quantity
	FROM online_retail_II AS a LEFT JOIN online_retail_II AS b ON a.Invoice = b.Invoice
	WHERE a.Invoice IS NOT NUSLL;