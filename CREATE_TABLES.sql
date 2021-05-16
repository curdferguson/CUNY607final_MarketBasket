DROP TABLE IF EXISTS InvoiceLine;

DROP TABLE IF EXISTS Invoices;

DROP TABLE IF EXISTS Items;

DROP TABLE IF EXISTS Customers;


CREATE TABLE Customers (
	CustomerID int PRIMARY KEY NOT NULL,
	Country nvarchar(50)
);

CREATE TABLE Items (
	StockCode nvarchar(50) PRIMARY KEY NOT NULL,
	Description nvarchar(50),
	Price float
);

CREATE TABLE Invoices (
    InvoiceID nvarchar(50) PRIMARY KEY NOT NULL,
    InvoiceDate datetime2(7),
    CustomerID int FOREIGN KEY REFERENCES Customers(CustomerID),
);

CREATE TABLE InvoiceLine (
	InvoiceID nvarchar(50) FOREIGN KEY REFERENCES Invoices(InvoiceID) NOT NULL,
	LineID int IDENTITY(1,1),
	StockCode nvarchar(50) FOREIGN KEY REFERENCES Items(StockCode),
	Quantity nvarchar(50),
    CONSTRAINT PK_InvoiceLine PRIMARY KEY (InvoiceID, LineID)
);
