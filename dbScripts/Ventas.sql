-- Ventas
SELECT 
    sd.OrderKey,
    sd.LineNumber AS NumeroLinea,
    sh.CustomerKey,
    sh.StoreKey,
    sd.ProductKey,
    sh.OrderDate AS Fecha,
    sh.CurrencyCode AS MonedaOriginal,
    sd.Quantity AS Cantidad,
    sd.UnitPrice * ce.Exchange AS PrecioUnitario_USD,
    sd.NetPrice * ce.Exchange AS PrecioNeto_USD,
    sd.UnitCost * ce.Exchange AS CostoUnitario_USD
FROM Data.Sales_Details AS sd
JOIN Data.Sales_Header AS sh ON sd.OrderKey = sh.OrderKey
LEFT JOIN Data.CurrencyExchange AS ce
    ON ce.FromCurrency = sh.CurrencyCode
    AND ce.ToCurrency = 'USD'
    AND ce.Date = sh.OrderDate
WHERE sh.CurrencyCode IN ('CAD', 'USD', 'GBP', 'AUD', 'EUR');