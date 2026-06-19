# SQL Joins & Subconsultas — Ejercicios prácticos
Este repositorio contiene ejercicios prácticos sobre los distintos tipos de JOIN en SQL Server,
más un ejemplo de subconsulta con agregación. Las tablas utilizadas son:
- **Employees** — datos de empleados (salario, fecha de contratación, departamento)
- **Departments** — departamentos de la empresa
- **Projects** — proyectos, cada uno con un empleado líder
- **Evaluations** — evaluaciones periódicas de desempeño por empleado

## Consultas incluidas
### INNER JOIN
Devuelve únicamente las filas que tienen coincidencia en ambas tablas.
En este caso: empleados que pertenecen a un departamento existente.
Se pierden los empleados sin `DepartmentID` asignado.
```sql
SELECT e.FirstName, d.DepartmentName
FROM dbo.Employees AS e
INNER JOIN dbo.Departments AS d ON e.DepartmentID = d.DepartmentID;
```

### LEFT JOIN
Devuelve todas las filas de la tabla izquierda (Employees), y donde no hay coincidencia
en la tabla derecha (Projects), completa con `NULL`.
Útil para detectar empleados que no lideran ningún proyecto.
```sql
SELECT e.FirstName, p.ProjectName
FROM dbo.Employees AS e
LEFT JOIN dbo.Projects AS p ON e.EmployeeID = p.LeaderEmployeeID;
```

### RIGHT JOIN
Espejo del LEFT JOIN: devuelve todas las filas de la tabla derecha (Projects).
Si un proyecto no tiene líder asignado, aparece igual con `NULL` en los campos del empleado.
```sql
SELECT p.ProjectName, e.FirstName
FROM dbo.Employees AS e
RIGHT JOIN dbo.Projects AS p ON p.LeaderEmployeeID = e.EmployeeID;
```

### FULL JOIN
Combina LEFT y RIGHT: devuelve todas las filas de ambas tablas, con `NULL` donde no hay coincidencia.
Ideal para auditorías: detectar empleados sin evaluación y evaluaciones sin empleado válido.
```sql
SELECT e.FirstName, ev.EvalDate, ev.Score
FROM dbo.Employees AS e
FULL JOIN dbo.Evaluations AS ev ON e.EmployeeID = ev.EmployeeID;
```

### Subconsulta con HAVING
Filtra empleados que pertenecen a departamentos con más de 10 integrantes.
La subconsulta calcula el conteo por departamento; la consulta externa lo usa como filtro.
```sql
SELECT e.EmployeeID, e.FirstName, e.LastName, e.DepartmentID
FROM dbo.Employees AS e
WHERE e.DepartmentID IN (
    SELECT DepartmentID
    FROM dbo.Employees
    GROUP BY DepartmentID
    HAVING COUNT(\*) > 10
);
```

### Cómo ejecutar
1. Ejecutar `schema.sql` para crear la base de datos y las tablas.
2. Ejecutar `data.sql` para cargar los datos de prueba.
3. Ejecutar cualquier bloque de `queries.sql` en el orden que prefieras.
   
Compatibilidad: SQL Server 2016+ (T-SQL). Para adaptar a MySQL o PostgreSQL
reemplazar `dbo.` por el esquema correspondiente y `GETDATE()` por `NOW()`.
