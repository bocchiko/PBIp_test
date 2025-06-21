WITH CTE_Fecha AS (
    SELECT CAST('2020-01-01' AS DATE) AS Fecha
    UNION ALL
    SELECT DATEADD(DAY, 1, Fecha)
    FROM CTE_Fecha
    WHERE Fecha < '2025-12-31'
)
SELECT 
    Fecha,
    YEAR(Fecha) AS Año,
    MONTH(Fecha) AS Mes,
    DATENAME(MONTH, Fecha) AS NombreMes,
    DAY(Fecha) AS Día,
    DATENAME(WEEKDAY, Fecha) AS NombreDiaSemana
FROM CTE_Fecha
OPTION (MAXRECURSION 32767);