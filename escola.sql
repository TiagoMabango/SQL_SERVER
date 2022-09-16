create database escola;
use escola

create table cursos(
	iD smallint primary key identity,
	nome varchar(255) not null,
	requisito varchar(255) not null,
	carga_horaria smallint ,
	preco double precision,
	data_cadastro datetime default current_timestamp,
	data_actualizacao datetime
)