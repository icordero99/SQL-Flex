-- EJERCICIO 1
SELECT FirstName, DepartmentName FROM dbo.Employees AS e
INNER JOIN dbo.Departments ON e.DepartmentID = dbo.Departments.DepartmentID