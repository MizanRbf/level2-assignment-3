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

## 🧩 Database Design

### 📊 Entities (Tables)

#### 1. Users
Stores system users including admins and customers.

**Attributes:**
- `user_id` (PK)
- `role` (Admin / Customer)
- `name`
- `email` (Unique)
- `password`
- `phone_number`

---

#### 2. Vehicles
Stores information about rentable vehicles.

**Attributes:**
- `vehicle_id` (PK)
- `vehicle_name`
- `vehicle_type` (car / bike / truck)
- `model`
- `registration_number` (Unique)
- `price_per_day`
- `availability_status` (available / rented / maintenance)

---

#### 3. Bookings
Stores rental booking information.

**Attributes:**
- `booking_id` (PK)
- `user_id` (FK → Users)
- `vehicle_id` (FK → Vehicles)
- `start_date`
- `end_date`
- `booking_status` (pending / confirmed / completed / cancelled)
- `total_cost`

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

📌 **ERD Tool Used:** Lucidchart  
📌 **Submission Requirement:** Public shareable ERD link

---

## 🧪 SQL Queries (`queries.sql`)

### Query 1: INNER JOIN
**Retrieve booking information along with customer name and vehicle name.**

```sql
SELECT 
    u.name AS customer_name,
    v.vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status,
    b.total_cost
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;
