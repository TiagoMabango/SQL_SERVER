create database total;

use total;


--create table

create table veiculos(
	ID smallint primary key identity,
	Marca varchar(20) not null,
	Modelo varchar(20) not null,
	Matricula varchar(20) not null,
	data_cadastro  datetime default current_timestamp,
	data_actualizacao  datetime
)

--insert

insert into veiculos(Marca, Modelo, Matricula) values('Toyota','Hiunday','12-223-LA');
insert into veiculos(Marca, Modelo, Matricula) values('Toyota','Hiunday3','14-223-LA');
insert into veiculos(Marca, Modelo, Matricula) values('Toyota','Hiunday2','11-223-LA');

--select

select * from veiculos


--create table

create table tipos_combustiveis(
	ID smallint primary key identity,
	Nome varchar(20) not null,
	data_cadastro  datetime default current_timestamp,
	data_actualizacao  datetime
)

--insert

insert into tipos_combustiveis(Nome) values('Gasolina')
insert into tipos_combustiveis(Nome) values('Petroleo')


--select

select * from tipos_combustiveis


--create table

create table bombas(
	ID smallint primary key identity,
	Numero smallint not null,
	TipoCombustivel_Fk  smallint,
	constraint TipoCombustivel_Fk foreign key(TipoCombustivel_Fk)
	references tipos_combustiveis (ID) on delete cascade,
	data_cadastro  datetime default current_timestamp,
	data_actualizacao  datetime
)

--insert

insert into bombas(Numero, TipoCombustivel_Fk) values(22, 1)
insert into bombas(Numero, TipoCombustivel_Fk) values(23, 2)

--select 

select * from bombas

--create table

create table operadores(
	ID smallint primary key identity,
	Primeiro_Nome varchar(50),
	Ultimo_Nome varchar(50),
	Telefone varchar(50),
	Enderenco varchar(50),
	data_cadastro  datetime default current_timestamp,
	data_actualizacao  datetime
)

--insert

insert into operadores(Primeiro_Nome, Ultimo_Nome, Telefone, Enderenco) values('Eurico','Vissanço', '+2449374678756', 'Viana')
insert into operadores(Primeiro_Nome, Ultimo_Nome, Telefone, Enderenco) values('Tiago','Mabango', '+2449374678756', 'Petrangol')

--select

select * from operadores;

--create table 

create table abasteciimentos(
	ID smallint primary key identity,
	Operador_Fk  smallint,
	constraint Operador_Fk foreign key(Operador_Fk)
	references operadores (ID) on delete cascade,
	Veiculo_Fk  smallint,
	constraint Veiculo_Fk foreign key(Veiculo_Fk)
	references veiculos (ID) on delete cascade,
	Bomba_Fk smallint, 
	constraint Bomba_Fk foreign key(Bomba_Fk)
	references bombas (ID) on delete cascade,
	Litro varchar(50) not null,
	data_cadastro  datetime default current_timestamp,
	data_actualizacao  datetime
)

--insert 

insert into abasteciimentos(Operador_Fk, Veiculo_Fk, Bomba_Fk, Litro) values(1,2,1, '22l')
insert into abasteciimentos(Operador_Fk, Veiculo_Fk, Bomba_Fk, Litro) values(2,2,1, '30l')

--select

select * from abasteciimentos;


--join de todas as tabelas
select  
operadores.Primeiro_Nome, 
operadores.Telefone,
veiculos.Matricula, 
veiculos.Modelo,
bombas.Numero,
tipos_combustiveis.Nome
from abasteciimentos 
join operadores
on operadores.ID = abasteciimentos.Operador_Fk
join veiculos
on veiculos.ID = abasteciimentos.Veiculo_Fk
join bombas
on bombas.ID = abasteciimentos.Bomba_Fk
join tipos_combustiveis
on abasteciimentos.Bomba_Fk = tipos_combustiveis.id


create procedure abastecimento_veiculo (@Operador_Fk smallint, @veiulo_Fk smallint, @bomba_Fk smallint, @litro varchar(50))
as
insert into abasteciimentos(Operador_Fk, Veiculo_Fk, Bomba_Fk, Litro) values(@Operador_Fk, @veiulo_Fk,@bomba_Fk, @litro)

exec abastecimento_veiculo @Operador_Fk = 1, @veiulo_Fk = 1, @bomba_Fk = 2, @litro= '30L'

select * from abasteciimentos;