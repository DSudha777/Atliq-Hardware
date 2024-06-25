SELECT year(date) as Year,monthname(date) as Month,
round(sum(a.sold_quantity *b.gross_price)/1000000,2) as gross_sales_Millions
FROM fact_sales_monthly a 
join fact_gross_price b
on a.product_code = b.product_code and a.fiscal_year = b.fiscal_year
join dim_customer c 
on a.customer_code =c.customer_code
where c.customer ="Atliq Exclusive" 
group by Month,Year
order by Year

