create database playground;

use playground;

create table users (
	id integer unsigned primary key,
	username varchar(255) not null unique,
	password varchar(255) not null
);

insert into users values
(1, 'docker', 'd0ck3r'),
(2, 'mysql', 'my591');
