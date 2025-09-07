# SQL Qestion Answer
Assume you have these tables:

- **Customers**(`customer_id`, `name`, `email`, `city`)
- **Orders**(`order_id`, `customer_id`, `order_date`, `status`)
- **OrderItems**(`order_item_id`, `order_id`, `product_id`, `quantity`, `price`)
- **Products**(`product_id`, `product_name`, `category`, `price`)
- **Categories**(`category_id`, `category_name`)


#### Q1. Write a query to get customer names and their order dates from last 30 days
#### Q2. Query product_name and total revenue (quantity * price) grouped by product
#### Q3. Return product_name and total quantity sold, sorted descending, limit 3
#### Q4. Return customer name and order count
#### Q5. Total order amount = sum of (quantity * price) per order
#### Q6. Return customer names who do not have any orders
#### Q7. Return category_name with highest sum of revenue (quantity * price)
#### Q8. Average of total order amount per customer
#### Q9. Return product names that are not in any order item
#### Q10. Return customer name and order_id for orders with total > 1000

