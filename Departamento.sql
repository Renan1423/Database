Create Database Departamento
Use Departamento
create table Cidade(CodCidade INT not null PRIMARY KEY, NomeCidade varchar(60) not null)
create table Departamento (CodDepartamento INT not null, NomeDepartamento varchar(60) not null, DatainicGer date not null, CodCidade int not null FOREIGN KEY REFERENCES Cidade(CodCidade))
create table Empregado(CodEmpregado INT not null PRIMARY KEY, NomeInic varchar(20) not null, NomeFin varchar(20) null, DataNasc datetime null, Endereco varchar(60) null, Sexo char(1) null, Salario money null)
create table Projeto(CodProjeto int not null PRIMARY KEY, NomeProjeto varchar(60) not null, CodDepartamento int not null FOREIGN KEY REFERENCES Departamento(CodDepartamento))
create table Dependente (CodDependente INT not null PRIMARY KEY, CodEmpregado INT not null FOREIGN KEY REFERENCES Empregado(CodEmpregado), NomeDependente varchar(60) not null, SexoDep char(1) not null, DataNascDep datetime, TipoDep char(1) null)
create table EmpregadoProjeto (CodEmpregado int null FOREIGN KEY REFERENCES Empregado(CodEmpregado), CodProjeto INT not null FOREIGN KEY REFERENCES Projeto(CodProjeto))
insert into Cidade(CodCidade,NomeCidade) Values ('1','Campo Grande'),('2','Dourados'),('3','Corumbá'),('4','Três Lagoas'), ('5','Ponta Porã'), ('6','Rio Verde'), ('7','Ponto Murtinho'), ('8','Bonito'), ('9','Paranaíba')
Update Cidade set NomeCidade = 'Cassilândia' where CodCidade = '9';
insert into Departamento(CodDepartamento,NomeDepartamento,DatainicGer) VALUES (1,'Batata','01/01/2019'),(2,'Banana','02/02/2018'),(3,'Pudim','03/03/2017'),(4,'Bolo','04/04/2016')
insert into Projeto(CodProjeto, NomeProjeto, CodDepartamento) Values (1,'Projetin',1),(2,'Projetao',2),(3,'Projeto',3),(4,'Projetos',4)
insert into Empregado(CodEmpregado, NomeInic, NomeFin, DataNasc, Endereco, Sexo, Salario) Values(1,'Batata','Silva','01/01/2019','Rua Batata','F',1000),(2,'Banana','Santos','02/02/2019','Rua Banana','M',2000),(3,'Pudim','Souza','03/03/2019','Rua Pudim','F',3000),(4,'Renan','Silva','21/08/2003','Rua Montes e o resto que todo mundo erra','M',8001)
insert into Dependente(CodDependente, CodEmpregado, NomeDependente) Values (1,'Alfred','Outro'), (2,'Alberto','Alguma coisa'),(3,'Albert','Coisa Alguma'),(4,'Alberta','Coisa Alguma Coisa')
select * from Empregado;
alter table Empregado add supervisor char(20);
select CodEmpregado,NomeInic,NomeFin from Empregado
select NomeInic, NomeFin from Empregado order by NomeFin
select CodDependente, CodEmpregado from Dependente where CodEmpregado = 3;
select CodEmpregado,NomeInic,NomeFin from Empregado where Salario > 3000 and Salario < 5000;/*10*/
select CodEmpregado from Empregado where NomeFin Like '%s';
select DataNasc from Empregado order by DataNasc desc;
select Endereco, DataNasc from Empregado where NomeInic='João' and NomeFin= 'Silva'
select (salario*0.9) from Empregado
