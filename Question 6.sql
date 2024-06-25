select a.customer_code,a.pre_invoice_discount_pct
 ,b.customer from fact_pre_invoice_deductions a
join dim_customer b
on a.customer_code =b.customer_code
where fiscal_year=2021 and b.market="India"
order by a.pre_invoice_discount_pct desc limit 5
