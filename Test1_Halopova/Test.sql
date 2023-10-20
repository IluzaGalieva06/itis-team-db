
SELECT * FROM Restaurants WHERE city = 'Город 1' ORDER BY name;
SELECT restaurant_id, COUNT(*) as order_count FROM Orders GROUP BY restaurant_id ORDER BY order_count DESC LIMIT 3;