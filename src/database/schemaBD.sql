CREATE DATABASE manejo_usuarios_claves;

USE manejo_usuarios_claves;

CREATE TABLE USERS(
    ts_creation TIMESTAMP NOT NULL DEFAULT NOW()::TIMESTAMP,
    id SERIAL NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(250) NOT NULL, 
    password VARCHAR NOT NULL,
    max_logon_times INTEGER NOT NULL, 
    CONSTRAINT USERS_PK
        PRIMARY KEY (id),
    CONSTRAINT USERS_EMAIL_NO_REPEAT UNIQUE(email)
);

CREATE TABLE PASSWORDS_LOG(
    ts_creation TIMESTAMP NOT NULL DEFAULT NOW()::TIMESTAMP,
    id SERIAL NOT NULL,
    user_id INTEGER NOT NULL,
    password VARCHAR NOT NULL,
    CONSTRAINT PASSWORDS_LOG_PK
        PRIMARY KEY (id),
    CONSTRAINT PASSWORDS_LOG_FK_USERS
        FOREIGN KEY (user_id)
        REFERENCES USERS(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);