---Viewing the whole table
SELECT * 
FROM `workspace`.`default`.`car_sales_data` 
Limit 1000;






-----------------------------------------------------------

---Remove Duplicates

SELECT DISTINCT *
FROM `workspace`.`default`.`car_sales_data`;







----Selling price with clean sale date
SELECT sellingprice,
       To_date(substring(saledate, 5), 'MMM dd yyyy HH:mm:ss') AS clean_sale_date
FROM `workspace`.`default`.`car_sales_data`;






---Standard model Category
SELECT model as standard_model
FROM `workspace`.`default`.`car_sales_data`;







------Flag Invalid Values
SELECT 
    sellingprice,
    saledate,
    CASE 
        WHEN sellingprice < 0 THEN 'Invalid'
        ELSE 'Valid'
    END AS amount_status
FROM `workspace`.`default`.`car_sales_data`;







---Total Sales & Revenue
SELECT 
    COUNT(*) AS total_sales,
    SUM(sellingprice) AS total_revenue
FROM `workspace`.`default`.`car_sales_data`;








---Revenue by Car Model
SELECT 
    model,
    COUNT(*) AS units_sold,
    SUM(sellingprice) AS revenue
FROM `workspace`.`default`.`car_sales_data`
GROUP BY model
ORDER BY revenue DESC;





----Top 5 Customers
SELECT 
    body, trim, model, seller, interior, color,
    SUM(sellingprice) AS total_spent
FROM `workspace`.`default`.`car_sales_data`
GROUP BY body, trim, model, seller, interior, color
ORDER BY total_spent DESC
LIMIT 5;





---Average Sale Value
SELECT 
    AVG(sellingprice) AS avg_sale_value
FROM `workspace`.`default`.`car_sales_data`;




---DATA QUALITY CHECKS
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN sellingprice = 0 THEN 1 ELSE 0 END) AS zero_prices,
    SUM(CASE WHEN saledate IS NULL THEN 1 ELSE 0 END) AS missing_dates
FROM `workspace`.`default`.`car_sales_data`;



----Low Performing Models
SELECT 
    model,
    COUNT(*) AS units_sold,
    SUM(sellingprice) AS revenue
FROM `workspace`.`default`.`car_sales_data`
GROUP BY model
ORDER BY revenue ASC
LIMIT 10;


---Top Models
SELECT 
    model,
    COUNT(*) AS units_sold,
    SUM(sellingprice) AS revenue
FROM `workspace`.`default`.`car_sales_data`
GROUP BY model
ORDER BY revenue DESC
LIMIT 10;


---Top Brands Performance
SELECT 
    make,
    COUNT(*) AS units_sold,
    SUM(sellingprice) AS revenue
FROM `workspace`.`default`.`car_sales_data`
GROUP BY make
ORDER BY revenue DESC;
