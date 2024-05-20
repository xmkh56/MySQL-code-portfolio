/**
*Chapter 08
*Sales Orders Database
*Problem 1. List customers and the dates they placed an order, sorted in order date sequence.
*/ 

SELECT Concat(Customers.CustFirstName,' ',Customers.CustLastName) AS CustomerFullName, Orders.OrderDate
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
ORDER BY Orders.OrderDate;

/**
*Sales Orders Database
*Problem 2. List employees and the customers for whom they booked an order
*/

SELECT DISTINCT Concat(Employees.EmpFirstName,' ',Employees.EmpLastName) AS EmployeeFullName, Concat(Customers.CustFirstName,' ',Customers.CustLastName) AS CustFullName
FROM (Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID)
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

/**
*Sales Orders Database
*Problem 3. Display all orders, the products in each order, and the amount owed for each product, in order number sequence.
*/

SELECT Orders.OrderNumber AS OrderNo, Orders.OrderDate, Order_Details.ProductNumber AS ProductNo, 
					Products.ProductName AS Product, Order_Details.QuotedPrice AS Price, Order_Details.QuantityOrdered AS Qty,
                    Order_Details.QuotedPrice * Order_Details.QuantityOrdered AS AmountOwed
FROM 		Orders INNER JOIN 
					Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber INNER JOIN 
					Products ON Order_Details.ProductNumber = Products.ProductNumber
ORDER BY Orders.OrderNumber;

/**
*Sales Orders Database
*Problem 4. Show me the vendors and the products they supply to us for products that cost less than $100
*/

SELECT Vendors.VendName, Products.ProductName, Product_Vendors.WholesalePrice 
FROM		Vendors INNER JOIN
					Product_Vendors ON Vendors.VendorID = Product_Vendors.VendorID INNER JOIN
					Products ON Product_Vendors.ProductNumber = Products.ProductNumber
WHERE Product_Vendors.WholesalePrice < 100;

/**
*Sales Orders Database
*Problem 5. Show me customers and employees who have the same last name
*/

SELECT Concat(Customers.CustFirstName,' ',CustLastName) AS CustName, Concat(Employees.EmpFirstName,' ',EmpLastName) AS EmpName
FROM		Customers INNER JOIN
					Employees ON Customers.CustLastName = Employees.EmpLastName;
                    
/**
*Sales Orders Database
*Problem 6. Show me customers and employees who live in the same city
*/

SELECT Concat(Customers.CustFirstName,' ',Customers.CustLastName) As CustName, Concat(Employees.EmpFirstName,' ',EmpLastName) AS EmpName
FROM		Customers INNER JOIN
					Employees ON Customers.CustCity = Employees.EmpCity;

/**
*Entertainment Agency Database
*Problem 1. Display agents and the engagement dates they booked, sorted by booking start date.
*/

SELECT Concat(Agents.AgtFirstName,' ',Agents.AgtLastName) AS AgtName, Engagements.StartDate, Engagements.EndDate
FROM		Agents INNER JOIN
					Engagements ON Agents.AgentID = Engagements.AgentID
ORDER BY Engagements.StartDate;

/**
*Entertainment Agency Database
*Problem 2. List customers and the entertainers they booked.
*/

SELECT DISTINCT Concat(Customers.CustFirstName,' ',Customers.CustLastName) AS CustName, Entertainers.EntStageName
FROM		Customers INNER JOIN
					Engagements ON Customers.CustomerID = Engagements.CustomerID INNER JOIN
                    Entertainers ON Engagements.EntertainerID = Entertainers.EntertainerID;
       
/**
*Entertainment Agency Database
*Problem 3. Find the agents and entertainers who live in the same postal code.
*/

SELECT Concat(Agents.AgtFirstName,' ',Agents.AgtLastName) AS AgtName, Entertainers.EntStageName, Agents.AgtZipCode AS ZipCode
FROM		Agents INNER JOIN
					Entertainers ON Agents.AgtZipCode = Entertainers.EntZipCode;
                    
/**
*School Scheduling Database
*Problem 1. Display buildings and all the classrooms in each building.
*/

SELECT Buildings.BuildingName, Class_Rooms.ClassRoomID
FROM 		Buildings INNER JOIN
					Class_Rooms ON Buildings.BuildingCode = Class_Rooms.BuildingCode;
                    
/**
*School Scheduling Database
*Problem 2. List students and all the classes in which they are currently enrolled
*/

SELECT Concat(Students.StudFirstName,' ',Students.StudLastName) AS StudentFullName, Classes.ClassID, Subjects.SubjectName
FROM		Students INNER JOIN
					Student_Schedules ON Students.StudentID = Student_Schedules.StudentID INNER JOIN
                    Classes ON Student_Schedules.ClassID = Classes.ClassID INNER JOIN
                    Subjects ON Classes.SubjectID = Subjects.SubjectID INNER JOIN
                    Student_Class_Status ON Student_Schedules.ClassStatus = Student_Class_Status.ClassStatus
WHERE Student_Class_Status.ClassStatusDescription = 'Enrolled';

/**
*School Scheduling Database
*Problem 3. List the faculty staff and the subject each teaches
*/

SELECT DISTINCT Concat(Staff.StfFirstName,' ',Staff.StfLastName) AS StaffName, Subjects.SubjectName
FROM		Staff INNER JOIN
					Faculty_Subjects ON Staff.StaffID = Faculty_Subjects.StaffID INNER JOIN
                    Subjects ON Faculty_Subjects.SubjectID = Subjects.SubjectID;
                    
/**
*School Scheduling Database
*Problem 4. Show me the students who have a grade of 85 or better in art and who also have a grade of 85 or better in any computer course.
*/

	SELECT		StudArt.StudFullName
FROM		(SELECT DISTINCT Students.StudentID, Concat(Students.StudFirstName,' ',Students.StudLastName) AS StudFullName
			FROM	Students INNER JOIN
					Student_Schedules ON Students.StudentID = Student_Schedules.StudentID INNER JOIN
                    Classes ON Student_Schedules.ClassID = Classes.ClassID INNER JOIN
                    Subjects ON Classes.SubjectID = Subjects.SubjectID INNER JOIN
                    Categories ON Subjects.CategoryID = Categories.CategoryID
				WHERE 		Categories.CategoryDescription = 'Art' 
							AND Student_Schedules.Grade >= 85) AS StudArt
	INNER JOIN
			(SELECT DISTINCT Student_Schedules.StudentID
            FROM	Student_Schedules INNER JOIN
					Classes ON Student_Schedules.ClassID = Classes.ClassID INNER JOIN
                    Subjects ON Classes.SubjectID = Subjects.SubjectID INNER JOIN
                    Categories ON Subjects.CategoryID = Categories.CategoryID
				WHERE		Categories.CategoryDescription LIKE '%Computer%'
							AND Student_Schedules.Grade >= 85) AS StudCS
	ON StudArt.StudentID = StudCS.StudentID;
                    
 /**
*Bowling League Database
*Problem 1. List the bowling teams and all the team members.
*/                   
     
SELECT TeamName, Concat(BowlerFirstName,' ',BowlerLastName) AS BowlerName
FROM		Teams INNER JOIN
					Bowlers ON Teams.TeamID = Bowlers.TeamID;
                    
 /**
*Bowling League Database
*Problem 2. Display the bowlers, the matches they played in, and the bowler game scores. 
*/   

SELECT Bowler_Scores.MatchID, Teams.TeamName, Concat(BowlerLastName,', ',BowlerFirstName) AS BowlerName, 
		Bowler_Scores.GameNumber, Bowler_Scores.RawScore AS GameScores
FROM		Teams INNER JOIN
					Bowlers ON Teams.TeamID = Bowlers.TeamID INNER JOIN
					Bowler_Scores ON Bowlers.BowlerID = Bowler_Scores.BowlerID;

 /**
*Bowling League Database
*Problem 3. Find the bowlers who live in the same ZIP Code. Notes: Join a table to itself 2X, give 1X a name, 2X a name, join on where bowler ID is not equal to bowler ID
*/ 

SELECT     Concat(Bowlers.BowlerLastName,', ', Bowlers.BowlerFirstName) AS FirstBowler, Bowlers.BowlerZip,
           Concat(Bowlers2.BowlerLastName,', ', Bowlers2.BowlerFirstName) AS SecondBowler

FROM		Bowlers INNER JOIN 
					Bowlers AS Bowlers2 ON Bowlers.BowlerID <> Bowlers2.BowlerID
					AND Bowlers.BowlerZipCode = Bowlers2.BowlerZipCode;

 /**
*Recipes Database
*Problem 1. List all the recipes for salads. 
*/ 

SELECT     RecipeTitle
FROM			Recipes
WHERE 			RecipeTitle LIKE '%Salad%';

 /**
*Recipes Database
*Problem 2. List all recipes that contain a dairy ingredient. Hint - join more than two tables
*/ 

SELECT     DISTINCT Recipes.RecipeTitle AS RecipesWithDairy
FROM 		Recipes INNER JOIN
					Recipe_Ingredients ON Recipes.RecipeID = Recipe_Ingredients.RecipeID INNER JOIN
                    Ingredients ON Recipe_Ingredients.IngredientID = Ingredients.IngredientID INNER JOIN
                    Ingredient_Classes ON Ingredients.IngredientClassID = Ingredient_Classes.IngredientClassID
WHERE		Ingredient_Classes.IngredientClassDescription = 'Dairy';

 /**
*Recipes Database
*Problem 3. Find the ingredients that use the same default measurement amount. 
*/ 

SELECT	First_Ingredient.FirstIngredientName, First_Ingredient.MeasurementDescription, Second_Ingredient.SecondIngredientName	
FROM  
(SELECT Ingredients.IngredientName AS FirstIngredientName, Measurements.MeasurementDescription
		FROM Ingredients INNER JOIN
				Measurements ON Ingredients.MeasureAmountID = Measurements.MeasureAmountID) AS First_Ingredient
	INNER JOIN
    (SELECT Ingredients.IngredientName AS SecondIngredientName, Measurements.MeasurementDescription
		FROM Ingredients INNER JOIN
				Measurements ON Ingredients.MeasureAmountID = Measurements.MeasureAmountID) AS Second_Ingredient
                ON First_Ingredient.FirstIngredientName <> Second_Ingredient.SecondIngredientName
                AND First_Ingredient.MeasurementDescription = Second_Ingredient.MeasurementDescription;

 /**
*Recipes Database
*Problem 4. Show me the recipes that have beef and garlic. 
*/ 

CREATE VIEW Beef_Recipes
AS
SELECT Recipes.RecipeID, Recipes.RecipeTitle
FROM		Recipes INNER JOIN
					Recipe_Ingredients ON Recipes.RecipeID = Recipe_Ingredients.RecipeID INNER JOIN
                    Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
			WHERE Ingredients.IngredientName = 'Beef';

CREATE VIEW Garlic_Recipes
AS 
SELECT Recipe_Ingredients.RecipeID
FROM		Recipe_Ingredients INNER JOIN
					Ingredients ON Recipe_Ingredients.IngredientID = Ingredients.IngredientID
			WHERE Ingredients.IngredientName = 'Garlic';
            
SELECT Beef_Recipes.RecipeTitle
FROM		Beef_Recipes INNER JOIN
					Garlic_Recipes ON Beef_Recipes.RecipeID = Garlic_Recipes.RecipeID;
