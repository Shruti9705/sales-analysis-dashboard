-- Query to calculate monthly sales growth
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') as month, 
    SUM(total_amount) as revenue,
    (SUM(total_amount) - LAG(SUM(total_amount)) OVER (ORDER BY DATE_FORMAT(sale_date, '%Y-%m'))) / LAG(SUM(total_amount)) OVER (ORDER BY DATE_FORMAT(sale_date, '%Y-%m')) * 100 as growth_percentage
FROM sales_data
GROUP BY month
ORDER BY month;
