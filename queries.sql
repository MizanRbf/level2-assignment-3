SELECT
  b.id AS booking_id,
  u.name AS customer_name,
  v.vehicle_name,
  b.rent_start_date AS start_date,
  b.rent_end_date AS end_date,
  b.status
FROM bookings b
  INNER JOIN users u ON b.customer_id = u.id
  INNER JOIN vehicles v ON b.vehicle_id = v.id;

SELECT * FROM vehicles v
WHERE NOT EXISTS 
(SELECT 1 FROM bookings b WHERE b.vehicle_id = v.id);

SELECT * FROM vehicles
WHERE type = 'car' AND availability_status = 'available';

SELECT v.vehicle_name,
  COUNT(b.vehicle_id) AS total_bookings FROM bookings b 
  JOIN vehicles v ON b.vehicle_id = v.id
GROUP BY v.vehicle_name HAVING COUNT(b.vehicle_id) > 2;