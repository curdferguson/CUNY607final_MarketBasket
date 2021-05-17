DROP TABLE IF EXISTS InvoiceLine;

DROP TABLE IF EXISTS Invoices;

DROP TABLE IF EXISTS Items;

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
	CustomerID int NOT NULL,
	Country nvarchar(50)
);

CREATE TABLE Items (
	StockCode nvarchar(50) NOT NULL,
	Description nvarchar(50),
	Price float
);

CREATE TABLE Invoices (
    InvoiceID nvarchar(50) NOT NULL,
    InvoiceDate datetime,
    CustomerID int,
);

CREATE TABLE InvoiceLine (
	LineID int IDENTITY(1,1),
	InvoiceID nvarchar(50) NOT NULL,
	StockCode nvarchar(50) NOT NULL,
	Quantity int,
);
