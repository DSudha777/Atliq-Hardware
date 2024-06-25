with sales as( 
select *, month(date) as month ,
case 
when month(date) between 9 and 11  then "Q1"
when month(date) in(12,1,2) then "Q2"
when month(date) between 3 and 5 then "Q3"
when month(date) between 6 and 8 then "Q4"
end fiscal_Quarter
 from fact_sales_monthly
 where fiscal_year = 2020)
  select fiscal_quarter,sum(sold_quantity) as Total_quantity  from sales 
  group by fiscal_quarter 