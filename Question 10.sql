with cte1 as(
select a.fiscal_year,a.product_code,b.product,
sum(sold_quantity) as Total_Qty,
b.division
 from  fact_sales_monthly a
join dim_product b 
on a.product_code=b.product_code
where fiscal_year=2021
group by a.product_code),
cte2 as(

select * , row_number() over (partition by division order by Total_Qty desc) as division_order
 from cte1 )
 
 select * from cte2 where division_order<4