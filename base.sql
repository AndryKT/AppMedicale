CREATE DATABASE appmedicale;

\c appmedicale;

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO users (name) VALUES ('John Doe'), ('Jane Smith'), ('Alice Johnson');

CREATE TABLE IF NOT EXISTS patients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    dateNaissance DATE NOT NULL,
    sexe VARCHAR(10) NOT NULL CHECK (sexe IN ('M', 'F')),
    adresse VARCHAR(255) NOT NULL,
    telephone VARCHAR(20) NOT NULL
);      

INSERT INTO patients (nom, prenom, dateNaissance, sexe, adresse, telephone) VALUES
('Doe', 'John', '1980-01-15', 'M', '123 Main St', '555-1234'),
('Smith', 'Jane', '1990-05-20', 'F', '456 Elm St', '555-5678'),
('Johnson', 'Alice', '1975-09-10', 'F', '789 Oak St', '555-9012');