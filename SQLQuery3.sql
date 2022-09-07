--use db_Biblioteca;


--create
create table tbl_livros(
	Id_livro smallint primary key identity(1000,1),
	Nome  varchar(50) not null,
	ISBN varchar(30) not null unique,
	ID_Autor smallint not null,
	Data_Pub datetime not null,
	Preco_Livro money not null
)

create table tbl_autores(
	ID_autor smallint primary key,
	Nome_Autor varchar(50),
	SobreNome_Autor varchar(60)
)

create table tbl_editoras
(
	ID_Editora  smallint primary key identity,
	Nome_Editora varchar(50) not null
)


create table tbl_teste_identidade
(
	Id_Teste smallint primary key identity,
	valor smallint not null
)



--insert
insert into tbl_teste_identidade (valor) values (10)
insert into tbl_teste_identidade (valor) values (20)
insert into tbl_teste_identidade (valor) values (30)
insert into tbl_teste_identidade (valor) values (40)


--alter table
alter table tbl_livros	
drop column ID_Autor

alter table tbl_livros	
add  ID_Autor smallint not null
constraint fk_ID_Autor foreign key(Id_Autor)
references tbl_autores

alter table tbl_livros	
add  ID_editora smallint not null
constraint fk_id_editora foreign key(ID_Editora)
references tbl_editoras


--select e insert
select * from tbl_autores
select * from tbl_livros
select * from tbl_editoras
	

insert into tbl_autores (ID_autor,Nome_Autor, SobreNome_Autor) 
select (ID_autor,Nome_Autor, SobreNome_Autor) 
values ( 1 ,'Tiago', 'Mabango')
insert into tbl_editoras(Nome_Editora) values ('Tudo Em dia')

--join 

select * from tbl_livros 
inner join tbl_autores
on  tbl_livros.ID_Autor =  tbl_autores.ID_autor

--view
create view tb_view	
as select tbl_editoras.ID_Editora as Editora from tbl_editoras

select * from tb_view;

--procedure

create procedure teste 
as  select 'Aprendendo stored procedure' as Nome

