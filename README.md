# TicketDatabase
The aim of this project was to undertake the design and implementation of a database system to mirror selected aspects of a commercial event ticketing system like Ticketmaster. The use of SQL queries based on real-world operation will demonstrate the database in use, for example retrieving event information and purchasing a ticket.

## Schema

<img width="1627" height="828" alt="Schema" src="https://github.com/user-attachments/assets/7db67e21-499b-4570-911a-281cc0d247c6" />

## Sample SQL Queries

1. [Create a New User Account](#1-create-a-new-user-account)  
2. [Search Events in a Region on a Specific Date](#2-search-events-in-a-region-on-a-specific-date)  
3. [Add a New Event](#3-add-a-new-event-transaction)  
4. [Book a Ticket](#4-book-a-ticket-transaction)  
5. [Extra Queries](#5-extra-queries)  

---

### 1. Create a New User Account  
```sql
START TRANSACTION;

-- Insert into the region table
INSERT INTO region (region_name)
VALUES ('Northern Ireland')
ON DUPLICATE KEY UPDATE region_id = LAST_INSERT_ID(region_id);

-- Capture the region_id
SET @region_id = LAST_INSERT_ID();

-- Insert into the city table
INSERT INTO city (city_name, region_id)
VALUES ('Belfast', @region_id)
ON DUPLICATE KEY UPDATE city_id = LAST_INSERT_ID(city_id);

-- Capture the city_id
SET @city_id = LAST_INSERT_ID();

-- Insert into the address table
INSERT INTO address (building_num, building_name, address_line_1, address_line_2, town, city_id, postcode)
VALUES ('123', 'My Big Building', 'The Alleyway', 'Main Street', 'Lisburn Road', @city_id, 'BT9 123')
ON DUPLICATE KEY UPDATE address_id = LAST_INSERT_ID(address_id);

-- Capture the address_id
SET @address_id = LAST_INSERT_ID();

-- Define our password
SET @plainPassword := 'password';

-- Create a random code, 16 chars in length
SET @randomNumber := RAND();
SET @hashedRandomNumber := SHA1(@randomNumber);
SELECT @salt := SUBSTRING(@hashedRandomNumber, 1, 16);

-- Concat salt and plain password, then hash them
SELECT @saltPlusPlainPassword := CONCAT(@salt, @plainPassword);
SELECT @saltedHash := SHA1(@saltPlusPlainPassword) AS salted_hash_value;

-- Get the value to store (concat salt + hash)
SELECT @storedSaltedHash := CONCAT(@salt, @saltedHash) AS password_to_be_stored;

-- Insert into the customer table
INSERT INTO customer (first_name, last_name, email_address, password, address_id)
VALUES ('John', 'Murphy', 'jmurphy@gmail.com', @storedSaltedHash, @address_id);

COMMIT;
```

---

### 2. Search Events in a Region on a Specific Date  
```sql
SELECT
    artist.artist_name AS "Artist",
    event.event_name AS "Event",
    event_date.event_date AS "Date",
    event.availability AS "Availability",
    venue.venue_name AS "Venue",
    city.city_name AS "City",
    region.region_name AS "Region"
FROM event
JOIN venue ON event.venue_id = venue.venue_id
JOIN address ON venue.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN region ON city.region_id = region.region_id
JOIN event_date ON event.event_date_id = event_date.event_date_id
JOIN artist ON event.artist_id = artist.artist_id
WHERE region.region_name = 'Northern Ireland'
  AND event_date.event_date = '2024-12-01';
```

---

### 3. Add a New Event (Transaction)  
```sql
START TRANSACTION;

-- Choose O2 Arena in London (venue_id = 11)
SET @venue_id = 11;

-- Insert into event_date table or update if it exists
INSERT INTO event_date (event_date)
VALUES ('2025-05-28')
ON DUPLICATE KEY UPDATE event_date = VALUES(event_date);

-- Get the last inserted or existing event_date_id
SET @event_date_id = (SELECT event_date_id FROM event_date WHERE event_date = '2025-05-28');

-- Insert into event_time table or update if it exists
INSERT INTO event_time (event_time)
VALUES ('19:30:00')
ON DUPLICATE KEY UPDATE event_time = VALUES(event_time);

-- Get the last inserted or existing event_time_id
SET @event_time_id = (SELECT event_time_id FROM event_time WHERE event_time = '19:30:00');

-- Get event_type_id which already holds 'Music' as id 1
SET @event_type_id = 1;

-- Insert into artist table or update if it exists
INSERT INTO artist (artist_name, genre_id)
VALUES ('The Killers', 2)
ON DUPLICATE KEY UPDATE genre_id = VALUES(genre_id);

-- Get the last inserted or existing artist_id
SET @artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'The Killers');

-- Insert into event table or update if it exists
INSERT INTO event (event_name, capacity, availability, venue_id, event_date_id, event_time_id, event_type_id, artist_id)
VALUES ('2025 World Tour', 15000, 800, @venue_id, @event_date_id, @event_time_id, @event_type_id, @artist_id)
ON DUPLICATE KEY UPDATE
    capacity = VALUES(capacity),
    availability = VALUES(availability),
    venue_id = VALUES(venue_id),
    event_date_id = VALUES(event_date_id),
    event_time_id = VALUES(event_time_id),
    event_type_id = VALUES(event_type_id),
    artist_id = VALUES(artist_id);

COMMIT;
```

---

### 4. Book a Ticket (Transaction)  
```sql
START TRANSACTION;

-- Check seat availability (seat 10D for Adele concert, event_id = 13)
SELECT
    seat.seat_id,
    seat.seat_number,
    seat.seat_row,
    event_section_seat.seat_available
FROM seat
JOIN event_section_seat ON seat.seat_id = event_section_seat.seat_id
JOIN event_section ON event_section_seat.event_section_id = event_section.event_section_id
JOIN event ON event_section.event_id = event.event_id
WHERE seat.seat_row = 'D'
  AND seat.seat_number = '10'
  AND event_section_seat.seat_available = 1
  AND event.event_id = 13;

-- Make the seat unavailable while completing booking
UPDATE event_section_seat
SET seat_available = 0
WHERE seat_id = (
    SELECT seat_id
    FROM seat
    WHERE seat_row = 'D'
      AND seat_number = '10'
);

-- Complete the booking
INSERT INTO booking (booking_id, booking_made_date, booking_ref, total_price_paid, customer_id)
VALUES (NULL, '2024-11-23', 'RE14242477', '75.00', '3');

COMMIT;
```

---

### 5. Extra Queries  

_Get newly created customer info (after Query 1):_  
```sql
SELECT * FROM customer WHERE customer.first_name = 'John';
```

_Get all gig info for a certain artist (similar to Query 2, here with Adele):_  
```sql
SELECT
    artist.artist_name AS "Artist",
    event.event_name AS "Event",
    event_date.event_date AS "Date",
    event.availability AS "Availability",
    venue.venue_name AS "Venue",
    city.city_name AS "City",
    region.region_name AS "Region"
FROM event
JOIN venue ON event.venue_id = venue.venue_id
JOIN address ON venue.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN region ON city.region_id = region.region_id
JOIN event_date ON event.event_date_id = event_date.event_date_id
JOIN artist ON event.artist_id = artist.artist_id
WHERE artist.artist_name = 'Adele';
```
