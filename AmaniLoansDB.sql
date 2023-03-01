-- Create the Database for the loan management
CREATE DATABASE AmaniLoansDB;

-- Create the Customers table
CREATE TABLE Customers (
   CustomerID INT PRIMARY KEY,
   FirstName VARCHAR(50) NOT NULL,
   LastName VARCHAR(50) NOT NULL,
   EmploymentStatus VARCHAR(100) NOT NULL,
   HomeOwnerShipStatus VARCHAR(20) NOT NULL,
   Address VARCHAR(100) NOT NULL,
   City VARCHAR(50),
   Province VARCHAR(50),
   PostCode VARCHAR(10),
   Email VARCHAR(100) NOT NULL,
   Phone VARCHAR(20)  NOT NULL 
);

-- Create the LoanOfficers table
CREATE TABLE LoanOfficers (
   LoanOfficerID INT PRIMARY KEY,
   FirstName VARCHAR(50) NOT NULL,
   LastName VARCHAR(50) NOT NULL,
   Email VARCHAR(100),
   Phone VARCHAR(20)
);

-- Create the Loans table
CREATE TABLE Loans (
   LoanID INT PRIMARY KEY,
   LoanAmount MONEY NOT NULL,
   InterestRate DECIMAL(4,2) NOT NULL,
   Term INT NOT NULL,
   CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
   LoanOfficerID INT FOREIGN KEY REFERENCES LoanOfficers(LoanOfficerID)
);

-- Create the LoanApplications table
CREATE TABLE LoanApplications (
   LoanApplicationID INT PRIMARY KEY,
   LoanAmount MONEY NOT NULL,
   InterestRate DECIMAL(4,2) NOT NULL,
   Term INT NOT NULL,
   CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
   LoanOfficerID INT FOREIGN KEY REFERENCES LoanOfficers(LoanOfficerID),
   ApplicationDate DATE NOT NULL,
   ApprovalStatus VARCHAR(50) NOT NULL
);

-- Create the LoanPayments table
CREATE TABLE LoanPayments (
   PaymentID INT PRIMARY KEY,
   LoanID INT FOREIGN KEY REFERENCES Loans(LoanID),
   PaymentDate DATE NOT NULL,
   PaymentAmount MONEY NOT NULL
);

-- Create the LoanRepayments table
CREATE TABLE LoanRepayments (
   RepaymentID INT PRIMARY KEY,
   LoanID INT FOREIGN KEY REFERENCES Loans(LoanID),
   CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
   RepaymentDate DATE NOT NULL,
   RepaymentAmount MONEY NOT NULL
);