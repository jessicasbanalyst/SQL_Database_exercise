# SQL_Database_exercise
  This is a SQL database exercise I did for one of my undergraduate classes called "Database Design and Implementation" (ITCS 3160).
I first created a database called "prints" followed by the following tables: "customers", "items", "orders", and "orderline". Then,
I inserted the data into the tables. Under "customer", I added "customer_id", "customer_name", "customer_add", "customer_city",
"customer_state", "customer_zip", and "customer_phone". Then, under "items", I added "item_id", "title, artist", "unit_price", 
and "on_hand". Simmilarly, under "orders", I added "order_id", "customer_id", "order_date", and "ship_date". Lastly, under "orderline"
I added "order_id", "item_id", and "order_qty".
  I then answered the following prompts in the exercise:
1. List all customers along with their address, city, state and zip.
2. List all customers and their phone numbers that live in GA.
3. List all customers along with their zip codes that live in NC or SC.
4. List all titles that have been sold along with the artist, order date and ship date.
5. List all item id, title, artist, unit price, and on hand in ascending order by price.
6. List all item id, title, artist, unit price, and on hand for all items with a unit price that is more than $100.00.
7. List all item id, title, artist, unit price, and on hand for all items where there are more than 300 on hand.
8. List all titles along with their unit price and retail price (retail price is unit price doubled).
9. List all customers that have placed an order in 2014 along with their phone numbers.
10. List all titles that have a unit price between $40.00 and $100.00.
11. List all customers, title, artist, quantity ordered.
12. List all customers along with the total revenue received from that customer (revenue would be total retail price).
13. List each state and the number of customers from that state.
14. Create a view named Under_100. It consists of the item_id, title, artist, unit_price and order_qty for every print with a
unit_price under 100 dollars.
15. Create a view named Allen. It consists of the customer_id, customer_name, customer_phone, title, and artist of each print ordered.
16. Create a view named orders. It consists of the item_id, title, artist, unit_price and order_qty for every print ordered in the range
of 2014-01-01 and 2014-02-28.
17. Create a view named zip_27. It consists of the customer_name, customer_phone, title, artist and date_shipped of each print
ordered by a customer whose zip code begins with 27.
18. Create the following indexes. Use the indicated index name.
    a. Create an index named customer_id on the customer_id field in the customers table.
    b. Create an index named name on the customer_name field in the customers table.
    c. Create an index named shipped on the customer_id and ship_date in the orders table.
19. Drop the name index.
20. Specify the integrity constraint that the unit_price of any print must be more than $35.
21. Create the following foreign keys within the prints database.
    a. Customer_id is a foreign key in the orders table.
    b. Item_id is a foreign key in the orderline table.
22. Add to the items table a new character field named type that is one character in length.
23. Change the type field in the items table to M for the print titled Skies Above.
24. Change the length of the artist field in the items table to 30.
25. What command would you use to delete the orders table from the prints database? (Do not delete the orders table.)
