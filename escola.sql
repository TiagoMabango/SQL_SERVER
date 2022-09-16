create database escola;
use escola

drop table alunos;

create table cursos(
	id smallint primary key identity,
	nome varchar(255) not null,
	requisito varchar(255) not null,
	carga_horaria smallint ,
	preco double precision,
	data_cadastro datetime default current_timestamp,
	data_actualizacao datetime
)

insert into cursos(nome, requisito, carga_horaria, preco) values('CSS','Básico de HTML', 3, 30000)
insert into cursos(nome, requisito, carga_horaria, preco) values('HTML','Conhecimento sobre internet', 1, 10000)
insert into cursos(nome, requisito, carga_horaria, preco) values('SQL','Básico de HTML e CSS', 2, 30000)
insert into cursos(nome, requisito, carga_horaria, preco) values('PHP','Básico de HTML', 3, 30000)
insert into cursos(nome, requisito, carga_horaria, preco) values('C#','Básico de HTML', 3, 30000)
insert into cursos(nome, requisito, carga_horaria, preco) values('JS','Básico de HTML', 3, 30000)
insert into cursos(nome, requisito, carga_horaria, preco) values('SQL SEVRER','Básico de HTML', 3, 30000)
insert into cursos(nome, requisito, carga_horaria, preco) values('ASP.NET MVC','Básico de HTML', 3, 30000)
insert into cursos(nome, requisito, carga_horaria, preco) values('CSS','Básico de HTML', 3, 30000)


select * from cursos;

create table instrutores(
	id smallint primary key identity,
	nome varchar(255) not null,
	email varchar(255) not null,
	valor_hora integer not null,
	certificados varchar(255) not null,
	data_cadastro datetime default current_timestamp,
	data_actualizacao datetime
)

insert into instrutores(nome, email, valor_hora, certificados) values('Mabango', 'mabango@gmail.com', 1000, 'Udemy')
insert into instrutores(nome, email, valor_hora, certificados) values('Bruno', 'bruno@gmail.com', 1000, 'Udemy')
insert into instrutores(nome, email, valor_hora, certificados) values('Peludonio', 'peludonio@gmail.com', 1000, 'Udemy')
insert into instrutores(nome, email, valor_hora, certificados) values('Manuel', 'manuel@gmail.com', 1000, 'Udemy')
insert into instrutores(nome, email, valor_hora, certificados) values('Mário', 'mario@gmail.com', 1000, 'Udemy')

create table alunos(
	id smallint primary key identity,
	nome varchar(50) not null,
	cpf varchar(50) not null,
	email varchar(50) not null,
	telefone varchar(14) not null,
	data_nascimento date not null,
	data_cadastro datetime default current_timestamp,
	data_actualizacao datetime
)


insert into alunos(nome, cpf, email, telefone, data_nascimento) values('Tiago','98734Hl98','tiago@gmail.com','945454545','07/02/2001')
insert into alunos(nome, cpf, email, telefone, data_nascimento) values('Tiago','98734Hl98','tiago@gmail.com','945454545','07/02/2001')
insert into alunos(nome, cpf, email, telefone, data_nascimento) values('Tiago','98734Hl98','tiago@gmail.com','945454545','07/02/2001')
insert into alunos(nome, cpf, email, telefone, data_nascimento) values('Tiago','98734Hl98','tiago@gmail.com','945454545','07/02/2001')
insert into alunos(nome, cpf, email, telefone, data_nascimento) values('Tiago','98734Hl98','tiago@gmail.com','945454545','07/02/2001')
insert into alunos(nome, cpf, email, telefone, data_nascimento) values('Tiago','98734Hl98','tiago@gmail.com','945454545','07/02/2001')
insert into alunos(nome, cpf, email, telefone, data_nascimento) values('Tiago','98734Hl98','tiago@gmail.com','945454545','07/02/2001')


create table turmas(
	id smallint primary key identity,
	instrutores_fk  smallint,
	constraint instrutores_fk foreign key(instrutores_fk)
	references instrutores (id) on delete cascade,
	cursos_fk  smallint,
	constraint cursos_fk foreign key(cursos_fk)
	references cursos (id) on delete cascade,
	carga_horaria smallint,
	data_cadastro datetime default current_timestamp,
	data_actualizacao datetime
)

insert into turmas(instrutores_fk, cursos_fk, carga_horaria) values(1,3,20)
insert into turmas(instrutores_fk, cursos_fk, carga_horaria) values(2,3,20)
insert into turmas(instrutores_fk, cursos_fk, carga_horaria) values(4,3,20)
insert into turmas(instrutores_fk, cursos_fk, carga_horaria) values(5,3,20)

create table matriculas(
	id smallint primary key identity,
	aluno_fk  smallint,
	constraint aluno_fk foreign key(aluno_fk)
	references alunos (id) on delete cascade,
	turma_fk  smallint,
	constraint turma_fk foreign key(turma_fk)
	references turmas (id) on delete cascade,
	data_matricula date not null, 
	data_cadastro datetime default current_timestamp,
	data_actualizacao datetime
)


insert into matriculas(aluno_fk, turma_fk, data_matricula) values(1,3, '10/8/2022')
insert into matriculas(aluno_fk, turma_fk, data_matricula) values(1,3, '10/8/2022')
insert into matriculas(aluno_fk, turma_fk, data_matricula) values(1,3, '10/8/2022')
insert into matriculas(aluno_fk, turma_fk, data_matricula) values(1,3, '10/8/2022')
insert into matriculas(aluno_fk, turma_fk, data_matricula) values(1,3, '10/8/2022')
insert into matriculas(aluno_fk, turma_fk, data_matricula) values(1,3, '10/8/2022')