-- EJERCICIO
SELECT FirstName, DepartmentName FROM dbo.Employees AS e
INNER JOIN dbo.Departments ON e.DepartmentID = dbo.Departments.DepartmentID

SELECT FirstName, ProjectName FROM dbo.Employees AS e
LEFT JOIN dbo.Projects ON e.EmployeeID = dbo.Projects.LeaderEmployeeID

SELECT ProjectName, FirstName FROM dbo.Employees AS e
RIGHT JOIN dbo.Projects ON dbo.Projects.LeaderEmployeeID = e.EmployeeID

SELECT FirstName, EvalDate, Score FROM dbo.Employees AS e
FULL JOIN dbo.Evaluations ON e.EmployeeID = dbo.Evaluations.EmployeeID

SELECT EmployeeID, FirstName, LastName, DepartmentID FROM Employees
WHERE DepartmentID IN (
    SELECT DepartmentID FROM Employees
    GROUP BY DepartmentID
    HAVING COUNT(*) > 10
    );
