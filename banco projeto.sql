use master
go

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'Projeto')
	DROP DATABASE Projeto

CREATE DATABASE Projeto
go

use Projeto
go

/* Cria as tabelas do Banco de Dados */

CREATE TABLE Cidade (
       CodCidade            int NOT NULL,
       NomeCidade           varchar(60) NOT NULL,
       PRIMARY KEY (CodCidade)
)
go

CREATE TABLE Departamento (
       CodDepartamento      int NOT NULL,
       NomeDepartamento     varchar(60) NOT NULL,
       DataInicioGer        datetime,
       CodEmpregado         int,
       CodCidade            int,
       PRIMARY KEY (CodDepartamento)
)
go


CREATE TABLE Dependente (
       CodEmpregado         int NOT NULL,
       CodDependente        int NOT NULL,
       NomeDep              varchar(60) NOT NULL,
       SexoDep              char(1),
       DataNascDep          datetime,
       TipoDep              char(1),
       PRIMARY KEY (CodEmpregado, CodDependente)
)
go


CREATE TABLE Empregado (
       CodEmpregado         int NOT NULL,
       NomeInic             varchar(20) NOT NULL,
       NomeInt              char(1),
       NomeFin              varchar(20),
       DataNasc             datetime,
       Endereco             varchar(60),
       Sexo                 char(1),
       Salario              money,
       CodDepartamento      int NOT NULL,
       SupCodEmpregado      int,
       PRIMARY KEY (CodEmpregado)
)
go


CREATE TABLE EmpregadoProjeto (
       CodEmpregado         int NOT NULL,
       CodProjeto           int NOT NULL,
       Horas                int,
       PRIMARY KEY NONCLUSTERED (CodEmpregado, CodProjeto)
)
go


CREATE TABLE Projeto (
       CodProjeto           int NOT NULL,
       NomeProjeto          varchar(60) NOT NULL,
       CodDepartamento      int,
       PRIMARY KEY (CodProjeto)
)
go


ALTER TABLE Departamento
       ADD FOREIGN KEY (CodCidade)
                             REFERENCES Cidade
go

ALTER TABLE Departamento
       ADD FOREIGN KEY (CodEmpregado)
                             REFERENCES Empregado
go

ALTER TABLE Empregado
       ADD FOREIGN KEY (SupCodEmpregado)
                             REFERENCES Empregado
go

ALTER TABLE Empregado
       ADD FOREIGN KEY (CodDepartamento)
                             REFERENCES Departamento
go

ALTER TABLE Projeto
       ADD FOREIGN KEY (CodDepartamento)
                             REFERENCES Departamento
go

ALTER TABLE EmpregadoProjeto
       ADD FOREIGN KEY (CodEmpregado)
                             REFERENCES Empregado
go

ALTER TABLE EmpregadoProjeto
       ADD FOREIGN KEY (CodProjeto)
                             REFERENCES Projeto
go

ALTER TABLE Dependente
       ADD FOREIGN KEY (CodEmpregado)
                             REFERENCES Empregado
go

/* Insere registros nas tabelas */

/*** CIDADE ***/
INSERT INTO CIDADE (CODCIDADE,NOMECIDADE)
     VALUES (1,'Campo Grande')
INSERT INTO CIDADE (CODCIDADE,NOMECIDADE)
     VALUES (2,'Dourados')
INSERT INTO CIDADE (CODCIDADE,NOMECIDADE)
     VALUES (3,'Corumbá')
INSERT INTO CIDADE (CODCIDADE,NOMECIDADE)
     VALUES (4,'Três Lagoas')
INSERT INTO CIDADE (CODCIDADE,NOMECIDADE)
     VALUES (5,'Ponta Porã')
INSERT INTO CIDADE (CODCIDADE,NOMECIDADE)
     VALUES (6,'Rio Verde')
INSERT INTO CIDADE (CODCIDADE,NOMECIDADE)
     VALUES (7,'Porto Murtinho')
INSERT INTO CIDADE (CODCIDADE,NOMECIDADE)
     VALUES (8,'Bonito')
INSERT INTO CIDADE (CODCIDADE,NOMECIDADE)
     VALUES (9,'Paranaíba')
INSERT INTO CIDADE (CODCIDADE,NOMECIDADE)
     VALUES (10,'Cassilândia')
go

/*** DEPARTAMENTO ***/
INSERT INTO DEPARTAMENTO (CODDEPARTAMENTO,NOMEDEPARTAMENTO,CODCIDADE)
     VALUES (1,'Administrativo',1)
INSERT INTO DEPARTAMENTO (CODDEPARTAMENTO,NOMEDEPARTAMENTO,CODCIDADE)
     VALUES (2,'Financeiro',1)
INSERT INTO DEPARTAMENTO (CODDEPARTAMENTO,NOMEDEPARTAMENTO,CODCIDADE)
     VALUES (3,'Pesquisa',2)
INSERT INTO DEPARTAMENTO (CODDEPARTAMENTO,NOMEDEPARTAMENTO,CODCIDADE)
     VALUES (4,'Informática',2)
INSERT INTO DEPARTAMENTO (CODDEPARTAMENTO,NOMEDEPARTAMENTO,CODCIDADE)
     VALUES (5,'Gerência de projetos',1)
go

/*** PROJETO ***/
INSERT INTO PROJETO (CODPROJETO,NOMEPROJETO,CODDEPARTAMENTO)
     VALUES (1,'Informatização',4)
INSERT INTO PROJETO (CODPROJETO,NOMEPROJETO,CODDEPARTAMENTO)
     VALUES (2,'Reengenharia',1)
INSERT INTO PROJETO (CODPROJETO,NOMEPROJETO,CODDEPARTAMENTO)
     VALUES (3,'ProdutoX',2)
INSERT INTO PROJETO (CODPROJETO,NOMEPROJETO,CODDEPARTAMENTO)
     VALUES (4,'ProdutoY',3)
INSERT INTO PROJETO (CODPROJETO,NOMEPROJETO,CODDEPARTAMENTO)
     VALUES (5,'ProdutoZ',2)
INSERT INTO PROJETO (CODPROJETO,NOMEPROJETO,CODDEPARTAMENTO)
     VALUES (6,'Novidades',4)
go

/*** EMPREGADO ***/
INSERT INTO EMPREGADO (CODEMPREGADO,NOMEINIC,NOMEINT,NOMEFIN,DATANASC,ENDERECO,SEXO,SALARIO,CODDEPARTAMENTO)
     VALUES (1,'João','B','Silva','09/05/1967','Carmo, 33','M',3000,3)
INSERT INTO EMPREGADO (CODEMPREGADO,NOMEINIC,NOMEINT,NOMEFIN,DATANASC,ENDERECO,SEXO,SALARIO,CODDEPARTAMENTO)
     VALUES (2,'Alice','J','Zeus','04/01/1970','Flores, 78','F',2500,3)
INSERT INTO EMPREGADO (CODEMPREGADO,NOMEINIC,NOMEINT,NOMEFIN,DATANASC,ENDERECO,SEXO,SALARIO,CODDEPARTAMENTO)
     VALUES (3,'Franco','L','Rocha','02/05/1960','Rios, 98','M',4000,1)
INSERT INTO EMPREGADO (CODEMPREGADO,NOMEINIC,NOMEINT,NOMEFIN,DATANASC,ENDERECO,SEXO,SALARIO,CODDEPARTAMENTO)
     VALUES (4,'Mario','P','Costa','07/12/1975','Ipe, 123','M',3800,1)
INSERT INTO EMPREGADO (CODEMPREGADO,NOMEINIC,NOMEINT,NOMEFIN,DATANASC,ENDERECO,SEXO,SALARIO,CODDEPARTAMENTO)
     VALUES (5,'Jorge','A','Ferreira','01/08/1965','Largo, 45','M',2500,2)
INSERT INTO EMPREGADO (CODEMPREGADO,NOMEINIC,NOMEINT,NOMEFIN,DATANASC,ENDERECO,SEXO,SALARIO,CODDEPARTAMENTO)
     VALUES (6,'Ana','M','Santos','01/01/1990','Arcos, 23','F',5500,5)
INSERT INTO EMPREGADO (CODEMPREGADO,NOMEINIC,NOMEINT,NOMEFIN,DATANASC,ENDERECO,SEXO,SALARIO,CODDEPARTAMENTO)
     VALUES (7,'Joice','V','Neves','03/04/1978','Flora, 12','F',4300,4)
INSERT INTO EMPREGADO (CODEMPREGADO,NOMEINIC,NOMEINT,NOMEFIN,DATANASC,ENDERECO,SEXO,SALARIO,CODDEPARTAMENTO)
     VALUES (8,'Luiz','R','Ribeiro','09/07/1985','Madeira, 234','M',4800,1)
INSERT INTO EMPREGADO (CODEMPREGADO,NOMEINIC,NOMEINT,NOMEFIN,DATANASC,ENDERECO,SEXO,SALARIO,CODDEPARTAMENTO)
     VALUES (9,'Rose','L','Martinho','09/08/1981','15 de novembro, 7234','F',3000,3)
INSERT INTO EMPREGADO (CODEMPREGADO,NOMEINIC,NOMEINT,NOMEFIN,DATANASC,ENDERECO,SEXO,SALARIO,CODDEPARTAMENTO)
     VALUES (10,'Mauricio','J','Penteado','04/05/1970','Vinte de dois de maio, 172','M',1500,4)
go

/*** DEFINE OS SUPERVISORES DE CADA EMPREGADO ***/

UPDATE EMPREGADO SET SUPCODEMPREGADO = 3 WHERE CODEMPREGADO IN (1,2,7,10)
UPDATE EMPREGADO SET SUPCODEMPREGADO = 5 WHERE CODEMPREGADO IN (3,4,8)
UPDATE EMPREGADO SET SUPCODEMPREGADO = 8 WHERE CODEMPREGADO IN (6,9)
go

/*** DEFINE OS GERENTES DE CADA DEPARTAMENTO ***/

UPDATE DEPARTAMENTO SET CODEMPREGADO = 4, DATAINICIOGER = '04/05/2001' WHERE CODDEPARTAMENTO = 1;
UPDATE DEPARTAMENTO SET CODEMPREGADO = 5, DATAINICIOGER = '07/01/2002' WHERE CODDEPARTAMENTO = 2;
UPDATE DEPARTAMENTO SET CODEMPREGADO = 2, DATAINICIOGER = '06/04/1999' WHERE CODDEPARTAMENTO = 3;
UPDATE DEPARTAMENTO SET CODEMPREGADO = 10, DATAINICIOGER = '06/06/2000' WHERE CODDEPARTAMENTO = 4;
UPDATE DEPARTAMENTO SET CODEMPREGADO = 6, DATAINICIOGER = '09/03/1998'  WHERE CODDEPARTAMENTO = 5;
go

/*** DEPENDENTE ***/
INSERT INTO DEPENDENTE (CODEMPREGADO,CODDEPENDENTE,NOMEDEP,SEXODEP,DATANASCDEP,TIPODEP)
     VALUES (1,1,'Alice','F','05/04/1995','E')
INSERT INTO DEPENDENTE (CODEMPREGADO,CODDEPENDENTE,NOMEDEP,SEXODEP,DATANASCDEP,TIPODEP)
     VALUES (1,2,'Telmo','M','05/04/1998','F')
INSERT INTO DEPENDENTE (CODEMPREGADO,CODDEPENDENTE,NOMEDEP,SEXODEP,DATANASCDEP,TIPODEP)
     VALUES (1,3,'Jane','F','06/06/1979','F')
INSERT INTO DEPENDENTE (CODEMPREGADO,CODDEPENDENTE,NOMEDEP,SEXODEP,DATANASCDEP,TIPODEP)
     VALUES (3,1,'Franco','M','05/04/1995','F')
INSERT INTO DEPENDENTE (CODEMPREGADO,CODDEPENDENTE,NOMEDEP,SEXODEP,DATANASCDEP,TIPODEP)
     VALUES (3,2,'Francisca','F','05/04/1998','E')
INSERT INTO DEPENDENTE (CODEMPREGADO,CODDEPENDENTE,NOMEDEP,SEXODEP,DATANASCDEP,TIPODEP)
     VALUES (8,1,'Renata','F','06/01/1986','E')
INSERT INTO DEPENDENTE (CODEMPREGADO,CODDEPENDENTE,NOMEDEP,SEXODEP,DATANASCDEP,TIPODEP)
     VALUES (8,2,'Junior','M','06/06/1979','F')
go

/*** EMPREGADOPROJETO ***/
INSERT INTO EMPREGADOPROJETO (CODEMPREGADO,CODPROJETO,HORAS)
     VALUES (1,5,10)
INSERT INTO EMPREGADOPROJETO (CODEMPREGADO,CODPROJETO,HORAS)
     VALUES (2,1,32)
INSERT INTO EMPREGADOPROJETO (CODEMPREGADO,CODPROJETO,HORAS)
     VALUES (2,3,10)
INSERT INTO EMPREGADOPROJETO (CODEMPREGADO,CODPROJETO,HORAS)
     VALUES (3,1,10)
INSERT INTO EMPREGADOPROJETO (CODEMPREGADO,CODPROJETO,HORAS)
     VALUES (5,1,7)
INSERT INTO EMPREGADOPROJETO (CODEMPREGADO,CODPROJETO,HORAS)
     VALUES (5,4,15)
INSERT INTO EMPREGADOPROJETO (CODEMPREGADO,CODPROJETO,HORAS)
     VALUES (6,2,26)
INSERT INTO EMPREGADOPROJETO (CODEMPREGADO,CODPROJETO,HORAS)
     VALUES (7,2,10)
INSERT INTO EMPREGADOPROJETO (CODEMPREGADO,CODPROJETO,HORAS)
     VALUES (8,4,19)

Select * from Departamento where CodEmpregado in (select CodEmpregado from Dependente)/*Selecione, da tabela departamento, os empregados que possuem dependente*/
Select * from Departamento where CodDepartamento not in (select CodDepartamento from Projeto)/*Selecione os departamentos que não possuem projetos*/
Select * from Empregado where CodEmpregado not in (select CodEmpregado from Dependente where CodEmpregado not in (select CodEmpregado from Departamento))/*Selecione os empregados que não possuem dependente e departamento*/
Select * from Empregado where Sexo like 'F' and Salario = (select min(Salario) from Empregado where CodEmpregado in (select CodEmpregado from Dependente where CodEmpregado in (select CodEmpregado from Departamento where CodEmpregado not in (select CodEmpregado from Projeto)))) /*Selecione os empregados do sexo feminino que possuem: um salário equivalente ao menor salário, possuem dependente e departamento, mas não tenham um projeto */
Update Empregado set Salario = Salario * (1.10) where Salario = (select min(Salario) from Empregado where CodEmpregado not in (select CodEmpregado from Dependente)) /*Aumente os salarios em 10% dos empregados que possuem o salário igual ao menor salário e que não possuem dependentes*/