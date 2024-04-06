CREATE TABLE users (
    id UUID PRIMARY KEY,
    surname VARCHAR(255) NOT NULL CHECK (surname != ''),
    name VARCHAR(255) NOT NULL CHECK (name != ''),
	Patronyc VARCHAR(255) NOT NULL CHECK (patronyc != ''),
	Email VARCHAR(255) NOT NULL CHECK (email != ''),
	hash_password VARCHAR(255) NOT NULL CHECK (hash_password != '')
);

CREATE TABLE accounts (
    id UUID PRIMARY KEY,
    money INTEGER,
    userId UUID,
    FOREIGN KEY (userId) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE places (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL CHECK (name != ''),
    cash_out_stats BIGINT,
    deposit_stats BIGINT
);

CREATE TABLE machines (
    id UUID PRIMARY KEY,
    place UUID,
    FOREIGN KEY (place) REFERENCES places (id)
);