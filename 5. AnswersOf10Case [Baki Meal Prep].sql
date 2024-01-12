--1
SELECT	[Regional Branch Name] = MsRegionalBranch.RegionalBranchName,
		[Purchase Date] = PurchaseHeader.PurchaseDate,
		[Total Item Purchase] = SUM(PurchaseDetail.PurchaseQuantity)
FROM PurchaseHeader
JOIN MsRegionalBranch
ON PurchaseHeader.RegionalBranchID = MsRegionalBranch.RegionalBranchID
JOIN PurchaseDetail
ON PurchaseHeader.PurchaseID = PurchaseDetail.PurchaseID
where DAY(PurchaseHeader.PurchaseDate) Like '10'
AND MsRegionalBranch.RegionalBranchName like 'Tangerang'
GROUP BY MsRegionalBranch.RegionalBranchName, PurchaseHeader.PurchaseDate
--ANSWER NOTE: 
-- 1. We don't have any purchase Date day at 20th but we have other you just need to change it...
-- 2. We also don't have Tangerang in our database for regionalbranchname...
--------------------------------------------------------------------------------------------------------------------------------------

-- 2. StaffName, SalesDate, & Total Sales Quantity.
SELECT	[Staff Name] = MsStaff.StaffName , 
		[Sales Date] = Salesheader.SalesDate , 
		[Total Sales Quantity] = SUM(SalesDetail.SalesQuantity)
FROM Salesheader
JOIN SalesDetail
ON Salesheader.SalesID=SalesDetail.SalesID
JOIN MsStaff
ON Salesheader.StaffID=MsStaff.StaffID
where MONTH(SalesDate) between '10'and'11'
AND MsStaff.StaffSalary < 5000000
GROUP BY MsStaff.StaffName , Salesheader.SalesDate , Salesheader.StaffID
--------------------------------------------------------------------------------------------------------------------------------------

-- 3. Display Staff Name Gender Female, AVG Purchase Quantity, SUM Prep Meal Purchase.
-- Extra Answers Bellow
SELECT	[Staff Name] = MsStaff.StaffName , 
		[Average Purchase Quantity] = AVG(PurchaseDetail.PurchaseQuantity),
		[Total Meal Supplied] = SUM(PurchaseDetail.PurchaseQuantity)
FROM PurchaseHeader
JOIN PurchaseDetail
ON PurchaseHeader.PurchaseID = PurchaseDetail.PurchaseID
JOIN MsStaff
ON PurchaseHeader.StaffID = MsStaff.StaffID
WHERE MsStaff.StaffGender LIKE 'Female'
Group BY MsStaff.StaffID, MsStaff.StaffName
HAVING SUM(PurchaseQuantity) < 8
-- Extra/Alter Answer
-- If you start the code there will be no data because we don't have total purchase bellow 8
-- Alter answers
-- Change Number at line HAVING SUM(xxx) from 8 to 100
-- so...
-- HAVING SUM(PurchaseQuantity) < 100
--------------------------------------------------------------------------------------------------------------------------------------

--4. Display RegionalBranchName, Total Purchase, Average Purchase Price 
SELECT	[Regional Branch Name] = MsRegionalBranch.RegionalBranchName,
		[Total Purchase Quantity Meal Prep] = SUM(PurchaseDetail.PurchaseQuantity),
		[Average Purchase Price per-RB] = CONCAT('Rp. ', SUM(PurchaseDetail.PurchaseQuantity) * SUM(MsMealPrep.MealPrepPurchasePrice))
FROM PurchaseHeader
JOIN MsRegionalBranch
ON PurchaseHeader.RegionalBranchID = MsRegionalBranch.RegionalBranchID
JOIN PurchaseDetail
ON PurchaseHeader.PurchaseID = PurchaseDetail.PurchaseID
JOIN MsMealPrep
ON PurchaseDetail.MealPrepID = MsMealPrep.MealPrepID
WHERE LEN(MsRegionalBranch.RegionalBranchName) > 15 --CHARACTERS
and LEN('test 123 213 123') - LEN(REPLACE('test 123 213 123', ' ', '')) + 1 > 3 --WORDS
Group By  MsRegionalBranch.RegionalBranchName
--EXTRA NOTE: You will not find anything becaouse our Regional Branch Name all under 3 word and 15 characters...
--------------------------------------------------------------------------------------------------------------------------------------

--5. Display RegionalBranchAddress, BranchPhone, PurchaseDate, StaffName, and Quantity 
SELECT	[Regional Branch Address] = MsRegionalBranch.RegionalBranchAddress,
		[Regional Branch Phone Number] = CONCAT('+62', (RIGHT(MsRegionalBranch.RegionalBranchPhoneNumber, LEN(MsRegionalBranch.RegionalBranchPhoneNumber) - 1))),
		[Purchase Date] = PurchaseHeader.PurchaseDate,
		[Staff Name] = MsStaff.StaffName,
		[Quantity] = CONCAT(sum(PurchaseDetail.PurchaseQuantity),' pcs')
FROM PurchaseHeader
JOIN PurchaseDetail
ON PurchaseHeader.PurchaseID = PurchaseDetail.PurchaseID
JOIN MsRegionalBranch
ON PurchaseHeader.RegionalBranchID = MsRegionalBranch.RegionalBranchID
JOIN MsStaff
ON PurchaseHeader.StaffID = MsStaff.StaffID
Group By MsRegionalBranch.RegionalBranchAddress,MsRegionalBranch.RegionalBranchPhoneNumber,PurchaseHeader.PurchaseDate,MsStaff.StaffName
--------------------------------------------------------------------------------------------------------------------------------------

--6. Display Customer ID, Staff ID, Total Meal Prep Sales Price, MealPrepName, and Quantity  
SELECT	[Customer ID] = CONCAT('Customer ', (RIGHT(MsCustomer.CustomerID, LEN(MsCustomer.CustomerID) - 2))),
		[Staff ID] = CONCAT('Customer ', (RIGHT(MsStaff.StaffID, LEN(MsStaff.StaffID) - 2))),
		[Total Meal Prep Sales Price] = CONCAT('Rp. ', SUM(SalesDetail.SalesQuantity) * sum(MsMealPrep.MealPrepSalesPrice)),
		[Meal Prep Name] = MsMealPrep.MealPrepName,
		[Quantity] = sum(SalesDetail.SalesQuantity)
FROM SalesHeader
JOIN SalesDetail
ON SalesHeader.SalesID = SalesDetail.SalesID
JOIN MsStaff
ON SalesHeader.StaffID = MsStaff.StaffID
JOIN MsCustomer
ON SalesHeader.CustomerID = MsCustomer.CustomerID
JOIN MsMealPrep
ON SalesDetail.MealPrepID = MsMealPrep.MealPrepID
GROUP BY MsCustomer.CustomerID, MsStaff.StaffID,MsMealPrep.MealPrepName
HAVING SUM(SalesQuantity) > 2
--------------------------------------------------------------------------------------------------------------------------------------

--7. Display Last Name, Total Purchase, and StaffSalary
SELECT	[Staff's Last Name] = SUBSTRING(MsStaff.StaffName, CHARINDEX(' ', MsStaff.StaffName) + 1, LEN(MsStaff.StaffName) - CHARINDEX(' ', MsStaff.StaffName)),
		[Total Purchase] = SUM(PurchaseDetail.PurchaseQuantity),
		[Staff Salary Bellow Average] = MsStaff.StaffSalary 
FROM PurchaseHeader
JOIN PurchaseDetail
ON PurchaseHeader.PurchaseID = PurchaseDetail.PurchaseID
JOIN MsStaff
ON PurchaseHeader.StaffID = MsStaff.StaffID
WHERE StaffSalary < (SELECT AVG(StaffSalary) from MsStaff)
AND
MsStaff.StaffGender LIKE 'Female'
GROUP BY MsStaff.StaffName, MsStaff.StaffSalary
--------------------------------------------------------------------------------------------------------------------------------------

--8. Display Staff Initial, CustomerID, Total Sales, and SalesDate 
SELECT	[Staff Initial] = UPPER(SUBSTRING(MsStaff.StaffName, 1, 1) + ' ' + SUBSTRING(MsStaff.StaffName, CHARINDEX(' ', MsStaff.StaffName) + 1, 1)),
		[Customer ID] = MsCustomer.CustomerID,
		[Total Sales] = SUM(SalesDetail.SalesQuantity),
		[Sales Date] = SalesHeader.SalesDate
FROM SalesHeader
JOIN SalesDetail
ON SalesHeader.SalesID = SalesDetail.SalesID
JOIN MsStaff
ON SalesHeader.StaffID = MsStaff.StaffID
JOIN MsCustomer
ON SalesHeader.CustomerID = MsCustomer.CustomerID
where MONTH(SalesDate) = 9
GROUP BY MsStaff.StaffName, MsCustomer.CustomerID, SalesHeader.SalesDate
--Alter/Other Answer
-- WHERE MONTH change to other than 9 because we dont have any data at 9 month

--------------------------------------------------------------------------------------------------------------------------------------

--9. Create a view named ‘ViewPurchaseTransaction’ 
CREATE VIEW ViewPurchaseTransaction AS
SELECT	[Staff Email] = MsStaff.StaffEmail,
		[Purchase Date] = PurchaseHeader.PurchaseDate,
		[Total Purchase Meal Prep] = SUM(PurchaseDetail.PurchaseQuantity),
		[Total Purchase Transaction] = COUNT(PurchaseHeader.PurchaseID)
FROM PurchaseHeader
JOIN PurchaseDetail
ON PurchaseHeader.PurchaseID = PurchaseDetail.PurchaseID
JOIN MsStaff
ON PurchaseHeader.StaffID = MsStaff.StaffID
WHERE (MsStaff.StaffEmail LIKE '%_@Gmail_%' OR MsStaff.StaffEmail LIKE '%_@Hotmail_%')
GROUP BY MsStaff.StaffEmail, PurchaseHeader.PurchaseDate
HAVING SUM(PurchaseDetail.PurchaseQuantity) > 50
--------------------------------------------------------------------------------------------------------------------------------------

--10. Create a view named ‘ViewSalesTransaction’ 
CREATE VIEW ViewSalesTransaction AS
SELECT	[Staff Name] = MsStaff.StaffName,
		[Sales Date] = SalesHeader.SalesDate,
		[Total Sales Transaction] = SUM(SalesDetail.SalesQuantity),
		[Total Sales Quantity] = COUNT(SalesHeader.SalesID)
FROM SalesHeader
JOIN SalesDetail
ON SalesHeader.SalesID = SalesDetail.SalesID
JOIN MsStaff
ON SalesHeader.StaffID = MsStaff.StaffID
JOIN MsMealPrep
ON SalesDetail.MealPrepID = MsMealPrep.MealPrepID
WHERE MsMealPrep.MealPrepSalesPrice < 450000
GROUP BY MsStaff.StaffName, SalesHeader.SalesDate
HAVING COUNT(SalesHeader.SalesID) > 1

