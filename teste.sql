create database teste

use teste

create table empployes(
	ID smallint primary key identity,
	FirstName varchar(50),
	LastName varchar(50),
	Created_at datetime default current_timestamp,
	updated_at datetime
)

create table tasks(
	ID smallint primary key identity,
	task varchar(60),
	empployee_fk  smallint,
	constraint empployee_fk foreign key(empployee_fk)
	references empployes (ID) on delete cascade,
	Created_at datetime default current_timestamp,
	updated_at datetime
)


