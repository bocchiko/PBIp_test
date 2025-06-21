--Tiendas
SELECT 
    st.StoreKey,
	st.Description AS Descripcion,
	st.Status,
    s.StateCode AS CodigoEstado,
    co.CountryCode AS CodigoPais,
    co.CountryName AS NombrePais
FROM Data.Store AS st
JOIN Data.State AS s ON st.StateKey = s.StateKey
JOIN Data.Country AS co ON s.CountryCode = co.CountryCode;