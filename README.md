# 🚗 Vehicle Rental System – Database Design & SQL Queries

## 📌 Project Overview
The **Vehicle Rental System** is a relational database project designed to manage users, vehicles, and rental bookings.  
This project demonstrates practical understanding of **ERD design**, **primary & foreign keys**, and **SQL querying techniques** including `JOIN`, `EXISTS`, `WHERE`, `GROUP BY`, and `HAVING`.

---

## 🎯 Objectives
By completing this project, the following database concepts are demonstrated:

- Designing a relational database using ERD
- Implementing **1-to-1**, **1-to-Many**, and **Many-to-1** relationships
- Using **Primary Keys (PK)** and **Foreign Keys (FK)**
- Writing SQL queries using:
  - `INNER JOIN`
  - `NOT EXISTS`
  - `WHERE`
  - `GROUP BY` and `HAVING`

---

## 🧩 Database Designed

### 📊 Entities (Tables)

#### 1. Users
Stores system users including admins and customers.

**Attributes:**
- `id` (PK)
- `name`
- `email` (Unique)
- `password`
- `phone`
- `role` (Admin / Customer)

---

#### 2. Vehicles
Stores information about rentable vehicles.

**Attributes:**
- `id` (PK)
- `vehicle_name`
- `type` (car / bike / truck)
- `model`
- `registration_number` (Unique)
- `daily_rent_price`
- `availability_status` (available / rented / maintenance)

---

#### 3. Bookings
Stores rental booking information.

**Attributes:**
- `id` (PK)
- `customer_id` (FK → Users)
- `vehicle_id` (FK → Vehicles)
- `rent_start_date`
- `rent_end_date`
- `total_cost`
- `status` (pending / confirmed / completed / cancelled)

---

## 🔗 Relationships (ERD)

- **One-to-Many:**  
  One user can make multiple bookings  
  `Users (1) → Bookings (Many)`

- **Many-to-One:**  
  Many bookings can be associated with one vehicle  
  `Bookings (Many) → Vehicles (1)`

- **Logical One-to-One:**  
  Each booking connects exactly one user and one vehicle

- 📌 ERD Tool Used: DrawSQL
- 🔗 ERD Link:  
https://drawsql.app/teams/mizan-rbf/diagrams/vehicle-rental-system

---

## 🧪 SQL Queries Explanation (`queries.sql`)

This section explains all SQL queries included in the `queries.sql` file.
Each query solves a specific business requirement of the Vehicle Rental System.

------------------------------------------------------------------

🔹 Query 1: Retrieve Booking Information with Customer and Vehicle Details

Purpose:
Retrieve booking details along with customer name and vehicle name.

Concepts Used:
INNER JOIN

SQL Query:
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

Explanation:
This query joins the bookings, users, and vehicles tables to display complete
booking information including which customer booked which vehicle.

------------------------------------------------------------------

🔹 Query 2: Find Vehicles That Have Never Been Booked

Purpose:
Identify vehicles that do not have any booking records.

Concepts Used:
NOT EXISTS

SQL Query:
SELECT * FROM vehicles v
WHERE NOT EXISTS 
(SELECT 1 FROM bookings b WHERE b.vehicle_id = v.id);

Explanation:
The subquery checks whether a vehicle exists in the bookings table.
If no related booking is found, the vehicle is returned in the result.

------------------------------------------------------------------

🔹 Query 3: Retrieve Available Vehicles of a Specific Type

Purpose:
Retrieve all vehicles that are currently available and belong to a specific
vehicle type (e.g., car).

Concepts Used:
SELECT, WHERE

SQL Query:
SELECT * FROM vehicles
WHERE type = 'car' AND availability_status = 'available';

Explanation:
This query filters vehicles based on their availability status and vehicle type.

------------------------------------------------------------------

🔹 Query 4: Find Vehicles with More Than Two Bookings

Purpose:
Identify vehicles that have been booked more than two times.

Concepts Used:
GROUP BY, HAVING, COUNT

SQL Query:
SELECT v.vehicle_name,
  COUNT(b.vehicle_id) AS total_bookings FROM bookings b 
  JOIN vehicles v ON b.vehicle_id = v.id
GROUP BY v.vehicle_name HAVING COUNT(b.vehicle_id) > 2;

Explanation:
The query groups booking records by vehicle and uses the HAVING clause
to filter vehicles that have more than two bookings.

------------------------------------------------------------------



