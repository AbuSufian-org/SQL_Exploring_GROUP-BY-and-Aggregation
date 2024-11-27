#Question 1. Write an SQL query to find the names of restaurants that have at least one menu item with a price greater than $10.
SELECT R.NAME AS RESTAURANT_NAME, M.PRICE
FROM RESTAURANT_INFO R
JOIN MENUITEMS M ON R.RESTAURANT_ID = M.RESTAURANT_ID
WHERE M.PRICE > 10;

#Question 2. Write an SQL query to retrieve the user names and their corresponding orders where the order total is greater than the average order total for all users.
SELECT U.NAME, O.ORDER_ID, O.TOTAL_AMOUNT
FROM USER_INFO U
JOIN ORDERS O ON U.ID = O.USER_ID
WHERE O.TOTAL_AMOUNT > (
	SELECT AVG(TOTAL_AMOUNT)
	FROM ORDERS
);

#Question 3. Write an SQL query to list the names of users whose last names start with 'S' or ends with ‘e’.
SELECT NAME
FROM USER_INFO
WHERE NAME LIKE 'S%' OR NAME LIKE '%E';

#Question 4. Write an SQL query to find the total order amounts for each restaurant. If a restaurant has no orders, display the restaurant name and a total amount of 0. Use the COALESCE function to handle null values.
SELECT R.NAME RESTAURANT_NAME, COALESCE(SUM(O.TOTAL_AMOUNT), 0) AS TOTAL_ORDER_AMOUNT
FROM RESTAURANT_INFO R
LEFT JOIN ORDERS O ON R.RESTAURANT_ID = O.RESTAURANT_ID
GROUP BY R.NAME;

#Question 5. Write a query to find out how many orders were placed using cash or credit.
SELECT COUNT(ORDER_ID) AS TOTAL_ORDERS,
	CASE
		WHEN PAY_TYPE_ID = 1 THEN 'CASH'
		WHEN PAY_TYPE_ID = 2 THEN 'CREDIT'
	END AS  PAYMENT_TYPE
FROM PAYMENT_TRANSACTIONS
WHERE PAY_TYPE_ID IN (1, 2)
GROUP BY PAY_TYPE_ID;