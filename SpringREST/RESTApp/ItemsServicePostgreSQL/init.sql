DROP TABLE IF EXISTS items CASCADE;

CREATE TABLE IF NOT EXISTS rental_items(
    item_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(250) NOT NULL,
    status INTEGER NOT NULL,
    cost_hour INTEGER,
    cost_day INTEGER
    );

INSERT INTO rental_items(owner_id, title, description, status, cost_hour, cost_day) VALUES(1, 'CAR', 'CAR BY ABOBA', 0, 500, 6000);
INSERT INTO rental_items(owner_id, title, description, status, cost_hour) VALUES(2, 'PERSONAL LESSONS', 'PERSONAL DANCE LESSON', 0, 800);
INSERT INTO rental_items(owner_id, title, description, status, cost_day) VALUES(1, 'DOM', 'DOM BY ABOBA', 1, 3000);


DROP TABLE IF EXISTS rent_contracts CASCADE;

CREATE TABLE IF NOT EXISTS rent_contracts(
    contract_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    item_id INTEGER REFERENCES rental_items(item_id) NOT NULL,
--     status INTEGER NOT NULL,
    borrower_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    reserved_to TIMESTAMP
    );

INSERT INTO rent_contracts(item_id, borrower_id, created_at, reserved_to) VALUES (3, 4, '2024-01-18 12:34:56', '2024-01-20 00:00:00');

