with prod_20 as(
select f.fiscal_year ,p.segment,count(distinct f.product_code) as unique_product
 from fact_sales_monthly f
join dim_product p
on f.product_code = p.product_code
where f.fiscal_year =2020
group by segment 
order by unique_product desc),
prod_21 as(
select f.fiscal_year ,p.segment,count(distinct f.product_code) as unique_product
 from fact_sales_monthly f
join dim_product p
on f.product_code = p.product_code
where f.fiscal_year =2021
group by segment 
order by unique_product desc)

select a.segment,a.unique_product as P_2020,
b.unique_product as P_2021,
(b.unique_product -a.unique_product) as Diff_Product
 from prod_20 as a
join prod_21 as b
on a.segment = b.segment
order by Diff_Product desc
