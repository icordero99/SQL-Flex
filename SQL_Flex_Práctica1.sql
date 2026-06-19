-- EJERCICIO CON INNER JOIN
SELECT FirstName, DepartmentName FROM dbo.Employees AS e
INNER JOIN dbo.Departments ON e.DepartmentID = dbo.Departments.DepartmentID

-- EJERCICIO CON LEFT JOIN    
SELECT FirstName, ProjectName FROM dbo.Employees AS e
LEFT JOIN dbo.Projects ON e.EmployeeID = dbo.Projects.LeaderEmployeeID

-- EJERCICIO CON RIGHT JOIN    
SELECT ProjectName, FirstName FROM dbo.Employees AS e
RIGHT JOIN dbo.Projects ON dbo.Projects.LeaderEmployeeID = e.EmployeeID

-- EJERCICIO CON FULL JOIN    
SELECT FirstName, EvalDate, Score FROM dbo.Employees AS e
FULL JOIN dbo.Evaluations ON e.EmployeeID = dbo.Evaluations.EmployeeID

-- EJERCICIO CON SUBCONSULTA
SELECT EmployeeID, FirstName, LastName, DepartmentID FROM Employees
WHERE DepartmentID IN (
    SELECT DepartmentID FROM Employees
    GROUP BY DepartmentID
    HAVING COUNT(*) > 10
    );
