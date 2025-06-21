--Clientes
SELECT 
    c.CustomerKey,
    c.GivenName + ' ' + c.Surname AS NombreCompleto,
	c.Occupation AS Ocupacion,
	c.Company AS Compania,
    s.StateCode AS CodigoEstado,
    co.CountryCode AS CodigoPais,
    co.CountryName AS NombrePais
FROM Data.Customer AS c
JOIN Data.State AS s ON c.StateKey = s.StateKey
JOIN Data.Country AS co ON s.CountryCode = co.CountryCode;
