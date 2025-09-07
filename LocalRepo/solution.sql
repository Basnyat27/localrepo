use ShopDB

select *
from sys.tables


--Ans.1
select *
from Customers

select *
from Orders

select customers.name, orders.order_date
from customers
left join orders
on customers.customer_id=orders.customer_id
where order_date >= DATEADD(day,-30,'2024-07-01')
order by order_date desc


--Ans.2
select *
from Products

select *
from OrderItems

select Products.product_name, sum(OrderItems.quantity*OrderItems.price) as revenue
from Products
left join OrderItems
on Products.product_id=OrderItems.product_id
group by product_name


--Ans.3
select *
from Products

select *
from Orders

select *
from OrderItems

select product_name, quantity, Orders.status as sold
from Products
left join OrderItems
on Products.product_id=OrderItems.product_id
left join Orders
on OrderItems.order_id=Orders.order_id
where status='completed'
order by quantity desc


--Ans.4
select *
from Customers

select *
from OrderItems

select *
from Orders

select Customers.name, count(orderitems.quantity) as numberOfOrder
from customers
left join orders
on customers.customer_id=orders.customer_id
left join orderitems
on orders.order_id=orderitems.order_id
group by name


--Ans.5
select *
from Orders

select *
from OrderItems

select *
from Customers

select Customers.name, count(OrderItems.order_id) as orderList, sum(quantity*price) as totalOrderAmnt
from orderitems
left join Orders
on OrderItems.order_id=Orders.order_id
left join Customers
on Orders.customer_id=Customers.customer_id
group by name


--Ans.6 (tricky one)
select *
from Customers

select *
from Orders

select name
from Customers
left join Orders
on Customers.customer_id=Orders.customer_id
where Orders.order_id is null


--Ans.7 (mistake in question)
select *
from Categories

select *
from OrderItems

select *
from Products

select top(1) Categories.category_name, sum (OrderItems.quantity*OrderItems.price) as mostPopular
from Categories
left join Products
on Categories.category_id=Products.category_id
left join OrderItems
on Products.product_id=OrderItems.product_id
group by category_name
order by mostPopular desc


--Ans.8 (confusing question)
select *
from Customers

select *
from Orders

select *
from OrderItems

select name, avg(sum(quantity*price)) as averageRevenue --Here aggregate function not working inside another aggregate function
from OrderItems
left join Orders
on OrderItems.order_id=Orders.order_id
left join Customers
on Orders.customer_id=Customers.customer_id
group by name
--or
select name, sum(quantity*price) as averageRevenue
from Customers
join Orders
on Customers.customer_id=Orders.customer_id
join OrderItems
on Orders.order_id=OrderItems.order_id
group by name


--Ans.9
select *
from Products

select *
from OrderItems

select Products.product_name
from Products
left join OrderItems
on Products.product_id=OrderItems.product_id
where OrderItems.order_id is null

--Ans.10 
select *
from Customers

select *
from Orders

select *
from OrderItems

select name, Orders.order_id, quantity*price as oneTimeOrder
from Customers
join Orders
on Customers.customer_id=Orders.customer_id
join OrderItems
on Orders.order_id=OrderItems.order_id
where (quantity*price) >=1000 and status='completed'
order by oneTimeOrder desc

--Best case (Q. Johnson has $80 and $1200 OTO then view for highest OTO > $20)
select name, Orders.order_id, max(quantity*price) as oneTimeOrder
from Customers
join Orders
on Customers.customer_id=Orders.customer_id
join OrderItems
on Orders.order_id=OrderItems.order_id
where (quantity*price) >=20 and status='completed' 
group by name, Orders.order_id
order by oneTimeOrder desc