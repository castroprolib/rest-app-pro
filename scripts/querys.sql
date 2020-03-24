-- role dev
CREATE ROLE dev WITH
	LOGIN
	SUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	REPLICATION
	CONNECTION LIMIT -1;

-- creamos la db
CREATE DATABASE "web-app-pro"
    WITH 
    OWNER = dev
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- creamos el schema
CREATE SCHEMA dev
    AUTHORIZATION dev;  	