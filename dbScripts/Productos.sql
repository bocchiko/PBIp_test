--Productos
SELECT 
    p.ProductKey,
    p.CategoryKey,
    p.SubCategoryKey,
    p.Manufacturer AS Fabricante,
    p.Brand AS Marca,
    p.WeightUnit AS UnidadPesoOriginal,
    -- Transformar el peso a kilogramos según la unidad
    CASE 
        WHEN LOWER(p.WeightUnit) = 'ounces' THEN p.Weight * 0.0283495
        WHEN LOWER(p.WeightUnit) = 'pounds' THEN p.Weight * 0.453592
        WHEN LOWER(p.WeightUnit) = 'grams' THEN p.Weight / 1000.0
        WHEN p.WeightUnit IS NULL THEN p.Weight  
        ELSE p.Weight  
    END AS Peso_KG,
    p.Cost AS Costo,
    p.Price AS Precio
FROM Data.Product AS p
LEFT JOIN Data.Category AS c ON p.CategoryKey = c.CategoryKey
LEFT JOIN Data.SubCategory AS sc ON p.SubCategoryKey = sc.SubCategoryKey;