CREATE TABLE users (
    id UUID PRIMARY KEY,
    surname VARCHAR(255) NOT NULL CHECK (surname != ''),
    name VARCHAR(255) NOT NULL CHECK (name != ''),
	patronyc VARCHAR(255) NOT NULL CHECK (patronyc != ''),
	email VARCHAR(255) NOT NULL CHECK (email != ''),
	hash_password VARCHAR(255) NOT NULL CHECK (hash_password != ''),
    verified BOOL DEFAULT false
);

CREATE TABLE accounts (
    id UUID PRIMARY KEY,
    money INTEGER,
    user_id UUID,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE machines (
    id UUID PRIMARY KEY
);

CREATE TABLE machines_stats (
    machine_id UUID,
    cash_out BIGINT,
    deposit BIGINT,
    FOREIGN KEY (machine_id) REFERENCES machines (id) ON DELETE CASCADE
);