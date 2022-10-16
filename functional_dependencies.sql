CREATE TABLE country
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

id -> name

CREATE TABLE departament
(
	id SERIAL PRIMARY KEY,
	country_id INT NOT NULL,
	name VARCHAR(255) NOT NULL
);

id -> country_id
id -> name

ALTER TABLE departament ADD CONSTRAINT fk_country 
	FOREIGN KEY(country_id)
	 	REFERENCES country(id) ON DELETE CASCADE;

CREATE TABLE spacemission 
(
	id SERIAL PRIMARY KEY,
	country_id INT NOT NULL
);

id -> country_id

ALTER TABLE spacemission ADD CONSTRAINT fk_country_space
	FOREIGN KEY(country_id)
		REFERENCES country(id) ON DELETE CASCADE;


CREATE TABLE telescope 
(
	id SERIAL PRIMARY KEY
);


CREATE TABLE telescope_spacemission
(
	telescope_id INT NOT NULL,
	spacemission_id INT NOT NULL,
	PRIMARY KEY(telescope_id, spacemission_id),

	CONSTRAINT fk_telescope
		FOREIGN KEY(telescope_id)
			REFERENCES telescope(id) ON DELETE CASCADE,

	CONSTRAINT fk_spacemission
		FOREIGN KEY(spacemission_id)
			REFERENCES spacemission(id) ON DELETE CASCADE
);

CREATE TABLE spaceship
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

id -> name

CREATE TABLE spaceship_spacemission
(
	spaceship_id INT NOT NULL,
	spacemission_id INT NOT NULL,
	PRIMARY KEY(spaceship_id, spacemission_id),

	CONSTRAINT fk_spaceship
		FOREIGN KEY(spaceship_id)
			REFERENCES spaceship(id) ON DELETE CASCADE,

	CONSTRAINT fk_spacemission
		FOREIGN KEY(spacemission_id)
			REFERENCES spacemission(id) ON DELETE CASCADE
);

CREATE TYPE gender AS ENUM ('MALE', 'FEMALE');

CREATE TABLE person
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	patronymic VARCHAR(255),
	gender gender
);

id -> name
id -> last_name
id -> patronymic
id -> gender

CREATE TABLE crew_member
(
	id INT PRIMARY KEY,
	spaceship_id INT NOT NULL,

	CONSTRAINT fk_person
		FOREIGN KEY(id)
			REFERENCES person(id) ON DELETE CASCADE,
	CONSTRAINT fk_spaceship
		FOREIGN KEY(spaceship_id)
			REFERENCES spaceship(id) ON DELETE CASCADE
);

id -> spaceship_id

CREATE TABLE scientist
(
	id INT PRIMARY KEY,

	CONSTRAINT fk_person
		FOREIGN KEY(id)
			REFERENCES person(id) ON DELETE CASCADE
);

CREATE TABLE telescope_scientist
(
	telescope_id INT NOT NULL,
	scientist_id INT NOT NULL,
	PRIMARY KEY(telescope_id, scientist_id),

	CONSTRAINT fk_telescope
		FOREIGN KEY(telescope_id)
			REFERENCES telescope(id) ON DELETE CASCADE,

	CONSTRAINT fk_scientist
		FOREIGN KEY(scientist_id)
			REFERENCES scientist(id) ON DELETE CASCADE
);