clcreate database teste

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

select @@SERVERNAME
select @@LANGUAGE
select @@LANGID
select @@TRANCOUNT

if @@LANGUAGE <> 'Portugu�s (Brasil)'
	select 'Today is ' + DATENAME(WEEKDAY,GETDATE())
else
	select 'Hoje � ' + DATENAME(WEEKDAY,GETDATE())

if OBJECT_ID('tasks','U') is null
	select 'Esta tabela n�o existe'
else
	exec sp_columns tasks

declare @valor int
set @valor = 0

while @valor < = 2
	begin
		insert into empployes(FirstName, LastName) values('Tiago','Neves')
	end

insert into empployes(FirstName, LastName) values('','')

select * from empployes;

drop table empployes

BEGIN TRANSACTION
	delete from empployes
commit

BEGIN TRANSACTION
	delete from empployes
rollback
