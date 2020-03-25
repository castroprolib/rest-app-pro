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
-- el tipo serial agrega not null por defecto
create table dev.capitals(
id_capital serial primary key,
capital varchar(50) not null unique,
id_state serial references dev.states(id_state)
);

--
drop table dev.states cascade;

--
drop table dev.states,dev.capitals;


insert into dev.countrys(country)
values('Venezuela');

-- los estados
insert into dev.states(state)
values('Amazonas'),
('Anzoategui'),
('Apure'),
('Aragua'),
('Barinas'),
('Bolivar'),
('Carabobo'),
('Cojedes'),
('Delta Amacuro'),
('Distrito Capital'),
('Falcon'),
('Guarico'),
('Lara'),
('Merida'),
('Miranda'),
('Monagas'),
('Nueva Esparta'),
('Portuguesa'),
('Sucre'),
('Tachira'),
('Trujillo'),
('La Guaira'),
('Yaracuy'),
('zulia');

update dev.states set id_country = 1
where id_country is null;

/* al insertar registros como nulos no hay problemas,
ya despues si queremos actualizar o insertar la restriccion foranea
 no dejaria
*/

-- las capitales
select * from dev.capitals;
insert into dev.capitals(capital)
values('Puerto Ayacucho'),
('Barcelona'),
('San Fernando De Apure'),
('Maracay'),
('Barinas'),
('Ciudad Bolivar'),
('Valencia'),
('San Carlos'),
('Tucupita'),
('Caracas'),
('Coro'),
('San Juan De Los Morros'),
('Barquisimeto'),
('Merida'),
('Los Teques'),
('Maturin'),
('La Asuncion'),
('Guanare'),
('Cumana'),
('San Cristobal'),
('Trujillo'),
('La Guaira'),
('San Felipe'),
('Maracaibo');