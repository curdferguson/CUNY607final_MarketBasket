ALTER TABLE Customers
	ADD CONSTRAINT PK_Customer PRIMARY KEY (CustomerID);

ALTER TABLE Items
	ADD CONSTRAINT PK_Item PRIMARY KEY (StockCode);

ALTER TABLE Invoices
	ADD CONSTRAINT PK_Invoice PRIMARY KEY (InvoiceID);

ALTER TABLE Invoices
	ADD CONSTRAINT FK_Invoice_CustID FOREIGN KEY (CustomerID) 
		REFERENCES Customers (CustomerID);

ALTER TABLE InvoiceLine
    ADD CONSTRAINT PK_InvoiceLine PRIMARY KEY (LineID, InvoiceID);

ALTER TABLE InvoiceLine
	ADD CONSTRAINT FK_IL_Invoice FOREIGN KEY (InvoiceID) 
		REFERENCES Invoices (InvoiceID);

DELETE FROM InvoiceLine 
	WHERE StockCode IN 
	(SELECT StockCode FROM InvoiceLine
		WHERE StockCode NOT IN
		(SELECT StockCode from Items));

ALTER TABLE InvoiceLine
	ADD CONSTRAINT FK_IL_StockCode FOREIGN KEY (StockCode)
		REFERENCES Items (StockCode);

