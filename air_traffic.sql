-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE city
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
country_id INTEGER NOT NULL REFERENCES country
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline_id INTEGER NOT NULL REFERENCES airlines,
  city_departure_id INTEGER NOT NULL REFERENCES city,
  city_arrival_id INTEGER NOT NULL REFERENCES city,
  departure TIMESTAMP,
  arrival TIMESTAMP
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  flight_id INTEGER NOT NULL REFERENCES flights,
  seat TEXT NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO country
(name)
VALUES
('United States'),
('Japan'),
('France'),
('UAE'),
('Brazil'),
('United Kingdom'),
('Mexico'),
('Moroco'),
('China'),
('Chile');

INSERT INTO city
(name, country_id)
VALUES
('Washington DC',1),
('Tokyo', 2),
('Los Angeles', 1),
('Seattle', 1),
('Paris', 3),
('Dubai', 4),
('New York', 1),
('Cedar Rapids', 1),
('Charlotte', 1),
('Sao paolo', 5),
('London', 6),
('Las Vegas', 1),
('Mexico City', 7),
('Casablanca', 8),
('Beijing', 9),
('Chicago', 1),
('New Orleans', 1),
('Santiago', 10);

INSERT INTO airlines
(name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO flights
(airline_id, city_departure_id, city_arrival_id, departure, arrival)
VALUES
(1, 1, 4, '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
(2, 2, 11, '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
(3, 3, 12, '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
(3, 4, 13, '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
(4, 5, 14, '2018-08-01 18:30:00', '2018-04-15 21:50:00'),
(5, 6, 15, '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
(1, 7, 9, '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
(6, 8, 16, '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
(6, 9, 17, '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
(7, 10, 18, '2019-01-20 19:30:00', '2019-01-20 22:45:00');

INSERT INTO passangers
  (first_name, last_name, seat, flight_id)
VALUES
  ('Jennifer', 'Finch', '33B' 1),
  ('Thadeus', 'Gathercoal', '8A', 2),
  ('Sonja', 'Pauley', '12F', 3),
  ('Jennifer', 'Finch', '20A', 4),
  ('Waneta', 'Skeleton', '23D', 5),
  ('Thadeus', 'Gathercoal', '18C', 6),
  ('Berkie', 'Wycliff', '9E', 7),
  ('Alvin', 'Leathes', '1A', 8),
  ('Berkie', 'Wycliff', '32B', 9),
  ('Cory', 'Squibbes', '10D', 10);