-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER NOT NULL REFERENCES galaxies
);

CREATE TABLE moons
(
id SERIAL PRIMARY KEY,
name TEXT,
planet_id INTEGER REFERENCES planets
);

CREATE TABLE orbit_features
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER NOT NULL REFERENCES planets,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  orbital_speed TEXT
);


INSERT INTO galaxies
(name)
VALUES
('Milky Way');

INSERT INTO planets
  (name, galaxy_id)
VALUES
  ('Earth', 1 ),
  ('Mars',1),
  ('Venus', 1),
  ('Neptune', 1),
  ('Proxima Centauri b', 1),
  ('Gliese 876 b', 1);

  INSERT INTO moons
  (name, planet_id)
  VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa',4),
  ('Despina',4),
  ('Galatea',4),
  ('Larissa',4),
  ('S/2004 nb 1',4),
  ('Proteus',4),
  ('Triton',4),
  ('Nereid',4),
  ('Halimede',4),
  ('Sao',4),
  ('Laomedia',4),
  ('Psmathe',4),
  ('Neso',4);

  INSERT INTO orbit_features 
  (planet_id,orbital_period_in_years,orbits_around,orbital_speed)
  VALUES
  (1, 1.00, 'The Sun'),
  (2, 1.88, 'The Sun'),
  (3,0.62, 'The Sun'),
  (4, 164.8, 'The Sun'),
  (5, 0.03, 'Proxima Centauri'),
  (6, 0.23, 'Gliese 876');