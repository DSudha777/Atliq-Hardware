with cte1 as(
select a.* ,c.channel,
round(sum(a.sold_quantity *b.gross_price)/1000000,2) as gross_sales_Millions
FROM fact_sales_monthly a 
join fact_gross_price b
on a.product_code = b.product_code and a.fiscal_year = b.fiscal_year
join dim_customer c 
on a.customer_code = c.customer_code
where a.fiscal_year =2021
group by c.channel)

select channel, gross_sales_Millions,
concat(round(gross_sales_Millions*100/(select sum(gross_sales_Millions) from cte1),2),'%') as Percentile
from cte1
order by Percentile desc


