CREATE TABLE stars (
    name TEXT PRIMARY KEY,
    temp_kelvin INT NOT NULL
);

CREATE TABLE planets (
    name TEXT PRIMARY KEY,
    orbital_period_years FLOAT NOT NULL,
    star_name TEXT NOT NULL REFERENCES stars
);

CREATE TABLE moons (
    name TEXT PRIMARY KEY,
    planet_name TEXT NOT NULL REFERENCES planets
);

INSERT INTO stars(name, temp_kelvin) VALUES 
    ('The Sun',5800),
    ('Proxima Centauri',3042),
    ('Gliese 876',3192);

INSERT INTO planets(name, orbital_period_years, star_name) VALUES
    ('Earth',1.00,'The Sun'),
    ('Mars',1.882,'The Sun'),
    ('Venus',.62,'The Sun'),
    ('Proxima Centauri b',.03,'Proxima Centauri'),
    ('Gliese 876 b',.236,'Gliese 876');

INSERT INTO moons (name, planet_name) VALUES
    ('The Moon','Earth'),
    ('Phobos','Mars'),
    ('Deimos','Mars');

SELECT p.name as planet, s.name as star, COUNT(m.name) as moon_count
    FROM planets AS p
        LEFT JOIN moons as m
            ON p.name = m.planet_name
        LEFT JOIN stars as s
            ON p.star_name = s.name
    GROUP BY p.name
    ORDER BY p.name;
    