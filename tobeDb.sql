--create database
create database tobe

--use
use tobe

--drop
drop database tobe


--create table
create table funcionarios(
	ID smallint primary key identity,
	FirstName varchar(50),
	LastName varchar(50),
	Created_at datetime default current_timestamp,
	updated_at datetime
)

create table tarefas(
	ID smallint primary key identity,
	task varchar(60),
	empployee_fk  smallint,
	constraint empployee_fk foreign key(empployee_fk)
	references funcionarios (ID) on delete cascade,
	Created_at datetime default current_timestamp,
	updated_at datetime
)

--insert into
insert into funcionarios (FirstName , LastName) values ('Tiago', 'Mabango')
insert into funcionarios (FirstName , LastName) values ('Ant�nio', 'Mabango')

insert into tarefas (task, empployee_fk) values('Terminar o sistema do MIREX',1);
insert into tarefas (task, empployee_fk) values('Terminar o sistema do Ivent�rio',2);


--select
select * from tarefas 

select funcionarios.FirstName as primeiro_nome,
funcionarios.LastName as ultimo_nome , 
tarefas.task  as tarefa from tarefas join funcionarios 
on tarefas.empployee_fk = funcionarios.ID 


--procedure

create procedure tarefa 
(@Id smallint)
as  select funcionarios.FirstName as primeiro_nome,
funcionarios.LastName as ultimo_nome , 
tarefas.task  as tarefa from tarefas join funcionarios 
on tarefas.empployee_fk = funcionarios.ID  where empployee_fk = @Id

exec tarefa @Id = 2

--view
create view view_listar_tarefa	
as select funcionarios.FirstName as primeiro_nome,
funcionarios.LastName as ultimo_nome , 
tarefas.task  as tarefa from tarefas join funcionarios 
on tarefas.empployee_fk = funcionarios.ID 


--insert into select
select * from view_listar_tarefa;

insert into tarefas (task, empployee_fk) select 'Estudar SQL', 2

insert into tarefas (task, empployee_fk) select  FirstName , ID  from funcionarios


--update into select
update
tarefas 
set tarefas.task = funcionarios.FirstName
from  funcionarios
where tarefas.empployee_fk = funcionarios.ID

--function
create function returna_tarefa (@ID smallint)
returns table
as
return ( select funcionarios.FirstName as primeiro_nome,
funcionarios.LastName as ultimo_nome , 
tarefas.task  as tarefa from tarefas join funcionarios 
on tarefas.empployee_fk = funcionarios.ID  where empployee_fk = @ID )


select * from returna_tarefa(2)


--select
select *  from tarefas;


--transaction

begin transaction;
	update tarefas
	set task = LOWER(task)
commit;

begin transaction;
	update tarefas
	set task = UPPER(task)
rollback;

declare @task varchar(20)
	select @task = 'Transa��o de Listar Tarefas'

begin transaction @task;
	select task from tarefas where task like 't%';
commit transaction @task;

select @@TRANCOUNT


BEGIN TRANSACTION;
	select task from tarefas where task like 't%';
IF @@ERROR = 0
	COMMIT;
ELSE
	ROLLBACK;


create procedure InsertSelect (@ID smallint)
as 
insert into tarefas (task, empployee_fk) select  FirstName , ID  from funcionarios where ID = @ID

exec InsertSelect @Id = 1

select * from funcionarios;
select * from tarefas;