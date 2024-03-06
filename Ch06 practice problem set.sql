/**
*Chapter 06
*Sales Orders Database
*Problem 1. Give me the names of all vendors based in Ballard, Bellevue, and Redmond
*/ 
SELECT VendName, VendCity 
FROM Vendors
WHERE (VendCity IN ('Ballard', 'Bellevue','Redmond'))
ORDER BY VendName;

/**
*Problem 2. Show me an alphabetized list of products with a retail price of $125.00 or more.
*/
SELECT ProductName, RetailPrice
FROM Products
WHERE (RetailPrice >= 125.00)
ORDER BY ProductName;

/**
*Problem 3. Which vendors do we work with that don't have a Web site?
*/

SELECT VendName, VendWebPage
FROM Vendors
WHERE (VendWebPage IS NULL)
ORDER BY VendName;

/**
*Entertainment Agency Database
*Problem 1. Let me see a list of all engagements that occurred during October 2012
*/ 
 
 SELECT EngagementNumber, ContractPrice, StartDate, EndDate
 FROM Engagements
 WHERE StartDate <= '2012-10-31'
 AND EndDate >= '2012-10-01';
 
/**
*Entertainment Agency Database
*Problem 2. Show me any engagements in October 2012 that start between noon and 5 P.M.
*/ 

SELECT EngagementNumber, StartDate, StartTime
FROM Engagements
WHERE StartDate <= '2012-10-31'
AND EndDate >= '2012-10-01' 
AND StartTime BETWEEN '12:00:00' AND '17:00:00';

/**
*Entertainment Agency Database
*Problem 3. List all the engagements that start and end on the same day.
*/ 

SELECT EngagementNumber, StartDate, EndDate
FROM Engagements
WHERE EndDate - StartDate = 0;

/**
*School Scheduling Database
*Problem 1. Show me which staff members use a post office box as their address.
*/ 

SELECT StfLastname, StfFirstName, StfStreetAddress
FROM Staff
WHERE StfStreetAddress LIKE '%Box%'
ORDER BY StfLastname, StfFirstName;

/**
*School Scheduling Database
*Problem 2. Can you show me which students live outside of the Pacific Northwest?
*/ 

SELECT CONCAT(StudLastName, ', ' ,StudFirstName) AS StudentName, StudAreaCode, StudPhoneNumber, StudState
FROM Students
WHERE StudState NOT IN ('OR', 'WA', 'ID')
ORDER BY StudLastname, StudFirstName;

/**
*School Scheduling Database
*Problem 3. List all the subjects that have a subject code starting 'MUS'.
*/ 

SELECT SubjectCode, SubjectDescription, SubjectName
FROM Subjects
WHERE SubjectCode Like 'MUS%';

/**
*Bowling League Database
*Problem 1. Give me a list of the tournaments held during September 2012.
*/ 

SELECT TourneyDate, TourneyLocation
FROM Tournaments
WHERE TourneyDate LIKE '2012-09-%%';

/**
*Bowling League Database
*Problem 2. What are the tournament schedules for Bolero, Red Rooster, and Thunderbird Lanes?
*/ 

SELECT TourneyLocation, TourneyDate
FROM Tournaments
WHERE TourneyLocation IN ('Bolero Lanes', 'Red Rooster Lanes', 'Thunderbird Lanes')
ORDER BY TourneyLocation, TourneyDate;

/**
*Bowling League Database
*Problem 3. List the bowlers who live on the Eastside (Bellevue, Bothell, Duvall, Redmond, and Woodinville) and who are on teams 5, 6, 5, or 8.
*/ 

SELECT BowlerFirstName, BowlerLastName, BowlerCity, TeamID
FROM Bowlers
WHERE BowlerCity IN ('Bellevue', 'Bothell', 'Duvall', 'Redmond', 'Woodinville')
AND TeamID BETWEEN '5' AND '8'
ORDER BY BowlerCity;

/**
*Recipes Database
*Problem 1. List all recipes that are main courses (recipe class is 1) and that have notes.
*/ 

SELECT RecipeTitle, Preparation, Notes
FROM Recipes
WHERE RecipeClassID = 1
AND Notes IS NOT NULL;

/**
*Recipes Database
*Problem 2. Display the first five recipes
*/ 

SELECT RecipeID, RecipeTitle, Preparation, Notes
FROM Recipes
WHERE RecipeID BETWEEN 1 AND 5;
