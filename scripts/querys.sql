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

-- agregando modulo identificador universal
create extension "uuid-ossp";    

-- creando tabla usuarios
create table dev.users(
id_user uuid primary key default  uuid_generate_v4(),
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(100) not null unique,
password varchar(100) not null,	
id_role serial,
id_country integer not null,
id_state integer not null,
createt_at date not null default current_date,
updated_at date not null default current_date,
last_access timestamp not null default current_timestamp				  
); 

-- creando index btree
create index index_pass on dev.users(password);

-- eliminado la tabla users
drop table dev.users;


insert into dev.users(first_name,last_name,email,password,id_country,id_state)
values('jose','pacheco','jose@hotmail.com','123',1,1);

select * from dev.users;

-- tabla paises
create table dev.countrys(
id_country serial primary key,
country varchar(50) not null unique
);

-- tabla estados
create table dev.states(
id_state serial primary key,
state varchar(50) not null unique,
id_country integer references dev.countrys(id_country)
);

-- tabla capitales
create table dev.capitals(
id_capital serial primary key,
capital varchar(50) not null unique,
id_state integer references dev.states(id_state)
);

