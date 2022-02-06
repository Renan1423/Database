CREATE DATABASE AULA_01 --Criação do banco
USE AULA_01 --Abrir o banco de dados															--comentário em uma linha
--DROP DATABASE AULA_01 /*apaga o banco*/															/*comentário limitado*/  -- =)  =_=  +_+  -_- `_´  \_/  /_\  )_(  
USE master DROP DATABASE AULA_01
CREATE TABLE TBLTipo(Codigo INT NOT NULL PRIMARY KEY, Nome Varchar(30) NOT NULL)
CREATE TABLE TotalFaturado(	Mês INTEGER NOT NULL,Ano INTEGER NOT NULL,Valor DECIMAL (12,2),PRIMARY KEY(Mês, Ano))
--DROP TABLE TBLTipo
CREATE TABLE Secao(Codigo INT NOT NULL PRIMARY KEY,Descricao VARCHAR(20) NOT NULL,CodDepto INT FOREIGN KEY REFERENCES Departamento (CodDepto)) --O "Código Departamento" é chave estrangeira
CREATE TABLE Animal(Codigo INT NOT NULL PRIMARY KEY,Nome VARCHAR(40) NOT NULL,Sexo char(1) check((upper(sexo) = 'M' or upper(sexo) = 'F')))
