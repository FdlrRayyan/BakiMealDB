Drop database [Baki Meal Prep]
CREATE DATABASE [Baki Meal Prep]
USE [Baki Meal Prep]

CREATE TABLE MsCustomer(
	CustomerID VARCHAR(5) PRIMARY KEY CHECK(CustomerID LIKE 'CS[0-9][0-9][0-9]'),
	CustomerName VARCHAR(255) CHECK(LEN(CustomerName) > 5),
	CustomerGender VARCHAR(50) CHECK(CustomerGender IN ('Male' , 'Female')),
	CustomerEmail VARCHAR(255) CHECK(CustomerEmail like ('%_@_%')),
	CustomerPhoneNumber VARCHAR(13) CHECK(LEN(CustomerPhoneNumber) = 13),
	CustomerAddress VARCHAR(255) NOT NULL
)

CREATE TABLE MsStaff(
	StaffID VARCHAR(5) PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(255) CHECK(LEN(StaffName) > 3),
	StaffGender VARCHAR(50) CHECK(StaffGender IN ('Male' , 'Female')),
	StaffEmail VARCHAR(255) CHECK(StaffEmail like ('%_@_%')),
	StaffPhoneNumber VARCHAR(13) CHECK(LEN(StaffPhoneNumber) = 13),
	StaffSalary INT NOT NULL
)

CREATE TABLE MsRegionalBranch(
	RegionalBranchID VARCHAR(5) PRIMARY KEY CHECK(RegionalBranchID LIKE 'RB[0-9][0-9][0-9]'),
	RegionalBranchName VARCHAR(255) CHECK(LEN(RegionalBranchName) > 5),
	RegionalBranchEmail VARCHAR(255) CHECK(RegionalBranchEmail like ('%_@_%')),
	RegionalBranchPhoneNumber VARCHAR(13) CHECK(LEN(RegionalBranchPhoneNumber) = 13),
	RegionalBranchAddress VARCHAR(255) NOT NULL
)
drop table MsMealPrep
CREATE TABLE MsMealPrep(
	MealPrepID VARCHAR(5) PRIMARY KEY CHECK(MealPrepID LIKE 'PM[0-9][0-9][0-9]'),
	MealPrepName VARCHAR(255) NOT NULL,
	MealPrepExpiryDate DATE CHECK(DateName(year,MealPrepExpiryDate) >= 2021),
	MealPrepSalesPrice INT CHECK (MealPrepSalesPrice > 50000),
	MealPrepPurchasePrice INT NOT NULL,
	MealPrepStock INT check (MealPrepStock > 0)
)
drop table SalesDetail
CREATE TABLE PurchaseHeader(
    PurchaseID VARCHAR(5) PRIMARY KEY CHECK(PurchaseID LIKE 'PC[0-9][0-9][0-9]'),
    StaffID VARCHAR(5) REFERENCES MsStaff(StaffID) ON DELETE CASCADE ON UPDATE CASCADE,
    RegionalBranchID VARCHAR(5) REFERENCES MsRegionalBranch(RegionalBranchID) ON DELETE CASCADE ON UPDATE CASCADE,
    PurchaseDate DATE NOT NULL,
)

CREATE TABLE PurchaseDetail(
    PurchaseID VARCHAR(5) REFERENCES PurchaseHeader(PurchaseID) ON DELETE CASCADE ON UPDATE CASCADE,
    MealPrepID VARCHAR(5) REFERENCES MsMealPrep(MealPrepID) ON DELETE CASCADE ON UPDATE CASCADE,
    PurchaseQuantity INT NOT NULL
)

CREATE TABLE SalesHeader(
	SalesID VARCHAR(5) PRIMARY KEY CHECK(SalesID LIKE 'SS[0-9][0-9][0-9]'),
	StaffID VARCHAR(5) REFERENCES MsStaff(StaffID) ON DELETE CASCADE ON UPDATE CASCADE,
	CustomerID VARCHAR(5) REFERENCES MsCustomer(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE,
	SalesDate DATE NOT NULL
)

CREATE TABLE SalesDetail(
	SalesID VARCHAR(5) REFERENCES SalesHeader(SalesID) ON DELETE CASCADE ON UPDATE CASCADE,
	MealPrepID VARCHAR(5) REFERENCES MsMealPrep(MealPrepID) ON DELETE CASCADE ON UPDATE CASCADE,
	SalesQuantity INT NOT NULL
)

