
-- Connecting to international_debt database and previewing data
SELECT * 
FROM international_debt
LIMIT 10;

-- Count of unique countries in the dataset
SELECT COUNT(DISTINCT(country_name)) AS Total_Distinct_Country
FROM international_debt;

-- List of distinct debt indicators
SELECT DISTINCT(indicator_code) AS distinct_debt_indicators
FROM international_debt
ORDER BY distinct_debt_indicators;

-- Total amount of debt (in million USD)
SELECT ROUND(SUM(debt)/1000000, 2) AS total_debt
FROM international_debt;

-- Country with the highest total debt (in million USD)
SELECT country_name, ROUND(SUM(debt)/1000000, 2) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;

-- Top 10 debt indicators with highest average debt (in million USD)
SELECT indicator_code AS debt_indicator, 
       ROUND(AVG(debt)/1000000, 2) AS average_debt, 
       indicator_name
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 10;

-- Top 10 countries with highest average debt in long-term debt category (DT.AMT.DLXF.CD)
SELECT country_name, 
       ROUND(AVG(debt)/1000000, 2) AS average_debt, 
       indicator_name, 
       indicator_code
FROM international_debt
GROUP BY country_name, indicator_name, indicator_code
HAVING indicator_code = 'DT.AMT.DLXF.CD'
ORDER BY average_debt DESC
LIMIT 10;

-- Top 20 most common debt indicators across countries
SELECT indicator_name, COUNT(indicator_code) AS indicator_count
FROM international_debt
GROUP BY indicator_code, indicator_name
ORDER BY indicator_count DESC
LIMIT 20;

-- Top 20 maximum debt records by country and indicator
SELECT country_name, indicator_name, MAX(debt) AS maximum_debt
FROM international_debt
GROUP BY country_name, indicator_name
ORDER BY maximum_debt DESC
LIMIT 20;
