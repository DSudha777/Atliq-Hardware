SELECT a.product_code,
b.product,a.manufacturing_cost FROM gdb023.fact_manufacturing_cost a
join dim_product b
on a.product_code=b.product_code
where manufacturing_cost = 
(select max(manufacturing_cost) from fact_manufacturing_cost)
union all
SELECT a.product_code,
b.product,a.manufacturing_cost FROM gdb023.fact_manufacturing_cost a
join dim_product b
on a.product_code=b.product_code
where manufacturing_cost = 
(select min(manufacturing_cost) from fact_manufacturing_cost);