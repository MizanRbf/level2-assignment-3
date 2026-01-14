-- Query 1 : JOIN
SELECT u.name AS customer_name, v.vehicle_name
FROM bookings b
  INNER JOIN users u ON b.customer_id = u.id
  INNER JOIN vehicles v ON b.vehicle_id = v.id;

-- Query 2 : EXISTS
SELECT * FROM vehicles v
WHERE NOT EXISTS 
(SELECT 1 FROM bookings b WHERE b.vehicle_id = v.id);

-- Query 3 : WHERE
SELECT * FROM vehicles
WHERE type = 'car' AND availability_status = 'available';

-- Query 4 : GROUP BY and HAVING
SELECT v.vehicle_name,
  COUNT(b.vehicle_id) AS total_bookings FROM bookings b 
  JOIN vehicles v ON b.vehicle_id = v.id
GROUP BY v.vehicle_name HAVING COUNT(b.vehicle_id) > 2;