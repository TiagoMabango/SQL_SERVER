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

select @@SERVERNAME
select @@LANGUAGE
select @@LANGID
select @@TRANCOUNT

if @@LANGUAGE <> 'Português (Brasil)'
	select 'Today is' + DATENAME(WEEKDAY,GETDATE())
else
	select 'Hoje é' + DATENAME(WEEKDAY,GETDATE())

if OBJECT_ID('tasks','U') is null
	select 'Esta tabela não existe'
else
	exec sp_columns tasks

declare @valor int
set @valor = 0

while @valor < 10
	begin
		print 'Número: ' + cast(@valor as varchar(2))
		set @valor = @valor + 1
		insert into empployes(FirstName, LastName) values('Jorge', 'Neves')
	end

select * from empployes;