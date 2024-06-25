with prod_20 as(
select count(distinct product_code)as Unique_prod_2020 from fact_sales_monthly
 where fiscal_year=2020), 
 prod_21 as
 (select count(distinct product_code)as Unique_prod_2021 from fact_sales_monthly
 where fiscal_year=2021)
 
 select Unique_prod_2020,Unique_prod_2021,
 round(((Unique_prod_2021 - Unique_prod_2020)/Unique_prod_2020)*100,2)
 as percentage_unique
 from prod_20,prod_21