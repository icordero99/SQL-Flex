-- INNER JOIN: empleados con su departamento
SELECT e.FirstName, d.DepartmentName
FROM dbo.Employees AS e 
INNER JOIN dbo.Departments AS d ON e.DepartmentID = d.DepartmentID

-- LEFT JOIN: todos los empleados, tengan o no proyecto liderado
SELECT e.FirstName, p.ProjectName
FROM dbo.Employees AS e
LEFT JOIN dbo.Projects AS p ON e.EmployeeID = p.LeaderEmployeeID

-- RIGHT JOIN: todos los proyectos, tengan o no líder asignado
SELECT p.ProjectName, e.FirstName
FROM dbo.Employees AS e
RIGHT JOIN dbo.Projects AS p ON p.LeaderEmployeeID = e.EmployeeID

-- FULL JOIN: todos los empleados y todas las evaluaciones, haya o no coincidencia
SELECT e.FirstName, ev.EvalDate, ev.Score
FROM dbo.Employees AS e
FULL JOIN dbo.Evaluations AS ev ON e.EmployeeID = ev.EmployeeID

-- SUBCONSULTA: empleados en departamentos con más de 10 integrantes
SELECT e.EmployeeID, e.FirstName, e.LastName, e.DepartmentID
FROM dbo.Employees AS e
WHERE e.DepartmentID IN (
    SELECT DepartmentID
    FROM dbo.Employees
    GROUP BY DepartmentID
    HAVING COUNT(*) > 10
);
