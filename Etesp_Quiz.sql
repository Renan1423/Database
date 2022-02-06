/*USE MASTER 
GO

IF EXISTS(SELECT 1 FROM SYSDATABASES WHERE NAME = 'ETESP_QUIZ')
	DROP DATABASE ETESP_QUIZ
	*/
CREATE DATABASE ETESP_QUIZ
go
USE ETESP_QUIZ
go
/*CREATE TABLE tblUsuario(
	id_Usuario INT IDENTITY (1,1) PRIMARY KEY,
	Nome_Usuario VARCHAR (80),
	Cargo_Usuario VARCHAR (25),
	Email_Usuario CHAR (50),
	Senha CHAR (20),
	Confirmacao_Senha CHAR (20)
)*/

CREATE TABLE tblPergunta(
	id_Pergunta INT IDENTITY (1,1) PRIMARY KEY,
	Pergunta varchar(100),
	Resposta varchar(100),
	Categoria varchar(15),
	Imagem varchar(max) not null
)
go

CREATE TABLE tblEquipe(
	id_Equipe INT IDENTITY (1,1) PRIMARY KEY,
	Nome_Equipe VARCHAR (30),
	Cor VARCHAR(30),
	Pontuacao INT default 0,
	Nome_Membro1 VARCHAR(80),
	Nome_Membro2 VARCHAR(80),
	Nome_Membro3 VARCHAR(80),
	Nome_Membro4 VARCHAR(80),
	Nome_Membro5 VARCHAR(80),
)

/*CREATE TABLE tblMembro(
	id_Membro INT IDENTITY (1,1) PRIMARY KEY,
	id_Equipe INT IDENTITY (1,1) FOREIGN KEY REFERENCES tblEquipe (id_Equipe),
	Nome_Membro VARCHAR (80)
)*/
go
insert into tblEquipe(Nome_Equipe) VALUES ('BatatõesX')
insert into tblEquipe(Nome_Equipe) VALUES ('BananõesZ')
insert into tblEquipe(Nome_Equipe) VALUES ('Pudimébom!!!')
insert into tblEquipe(Nome_Equipe) VALUES ('Melão>Melancia')
insert into tblEquipe(Nome_Equipe) VALUES ('Izão')
insert into tblEquipe(Nome_Equipe) VALUES ('GeoMB')
insert into tblEquipe(Nome_Equipe) VALUES ('GeoAlunos')
insert into tblEquipe(Nome_Equipe) VALUES ('Fernandiz')
insert into tblEquipe(Nome_Equipe) VALUES ('GalaxyTeam')
insert into tblEquipe(Nome_Equipe) VALUES ('GeoAlunos')
insert into tblEquipe(Nome_Equipe) VALUES ('Fernandiz')
insert into tblEquipe(Nome_Equipe) VALUES ('GalaxyTeam')
insert into tblEquipe(Nome_Equipe) VALUES ('GeoAlunos')	
insert into tblEquipe(Nome_Equipe) VALUES ('GalaxyTeam')
insert into tblEquipe(Nome_Equipe) VALUES ('GeoAlunos')

select * from tblEquipe
select * from tblPergunta
select top 3 Nome_Equipe from tblEquipe order by Nome_Equipe
select Nome_Equipe from tblEquipe
select Nome_Equipe from tblEquipe where id_Equipe = 2
select Nome_Equipe from tblEquipe where id_Equipe = 1