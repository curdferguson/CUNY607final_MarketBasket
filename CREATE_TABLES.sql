DROP TABLE IF EXISTS InvoiceLine;

DROP TABLE IF EXISTS Invoices;

DROP TABLE IF EXISTS Items;

DROP TABLE IF EXISTS Customers;


CREATE TABLE Customers (
	CustomerID int NOT NULL,
	Country nvarchar(50)
);

BULK INSERT Customers
FROM 'customers.csv'
WITH (DATA_SOURCE = 'azure_mba_affinity', FORMAT = 'CSV', FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', FIRSTROW=2);


CREATE TABLE Items (
	StockCode nvarchar(50) NOT NULL,
	Description nvarchar(50),
	Price float
);

BULK INSERT Items 
FROM 'items.csv'
WITH (DATA_SOURCE = 'azure_mba_affinity', FORMAT = 'CSV', FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', FIRSTROW=2);


CREATE TABLE Invoices (
    InvoiceID nvarchar(50) NOT NULL,
    InvoiceDate datetime,
    CustomerID int,
);

BULK INSERT Invoices 
FROM 'invoices.csv'
WITH (DATA_SOURCE = 'azure_mba_affinity', FORMAT = 'CSV', FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', FIRSTROW=2);


CREATE TABLE InvoiceLine (
	LineID int IDENTITY(1,1),
	InvoiceID nvarchar(50) NOT NULL,
	StockCode nvarchar(50) NOT NULL,
	Quantity int,
);

BULK INSERT InvoiceLine 
FROM 'invoice_lines.csv'
WITH (DATA_SOURCE = 'azure_mba_affinity', FORMAT = 'CSV', FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', FIRSTROW=2);