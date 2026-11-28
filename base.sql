CREATE DATABASE appmedicale;

\c appmedicale;

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO users (name) VALUES ('John Doe'), ('Jane Smith'), ('Alice Johnson');