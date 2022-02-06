Create Database EXEMPLOsubquery
Use EXEMPLOsubquery
create table Cargo(codCargo int primary key, nome_cargo char(40))
create table Funcionario(codFunc int primary key, cod_cargo int FOREIGN KEY REFERENCES Cargo(cod_cargo), nome_func char(30), sal_func money, rg_func char(10))
create table Dependente(cod_dependente int primary key, cod_func int FOREIGN KEY REFERENCES Funcionario(cod_func), nome_dep char(30))

insert into Cargo values (1,'Diretor Presidente')
insert into Cargo values (2,'Diretor Administrativo')
insert into Cargo values (3,'Supervisor')
insert into Cargo values (4,'Analista de Sistemas')
insert into Cargo values (5,'Analista Comercial')

insert into Funcionario values (1,5,'João Silva',4500,'24.985.858')
insert into Funcionario values (2,5,'Fábio',4500,'45.256.652')
insert into Funcionario values (3,3,'Maria',3700,'14.563.365')
insert into Funcionario values (4,3,'Silvia',5950,'87.745.688')
insert into Funcionario values (5,2,'Lucas',8000,'10.569.823')
insert into Funcionario values (6,1,'Rafael',12000,'10.152.325')

insert into Dependente values (1, 1, 'Rosalina')
insert into Dependente values (2, 1, 'Marcela')
insert into Dependente values (3, 1, 'Francisco')
insert into Dependente values (4, 2, 'Eduardo')
insert into Dependente values (5, 3, 'Felipe')
insert into Dependente values (6, 5, 'Lucas Júnior')
insert into Dependente values (7, 5, 'Fernando')

Select * from Cargo where codCargo in (select codCargo from Funcionario)  //Selecione todas as colunas da tabela Cargo dos funcionários que possuem um cargo.
Select * from Cargo where codCargo in (select codCargo from Funcionario where codFunc in (select codFunc from Dependente)) // Selecione todas as colunas da tabela Cargo dos funcionários que possuem um cargo e um dependente.
Select * from Cargo where codCargo not in (select codCargo from Funcionario) //Selecione todas as colunas da tabela cargo dos funcionários que não possuem cargo.
Select * from Funcionario where sal_func = (select max(sal_func) from Funcionario) //Selecione todas as colunas da tabela funcionario onde o salário do funcionário é igual ao salário máximo
Select * from Funcionario where sal_func = (select min(sal_func) from Funcionario where codFunc in(select codFunc from Dependente)) //Selecione todas as colunas da tabela funcionario onde o salário de um funcionário que possui dependente é igual ao salário mínimo
Select * (select count(*) from Dependente where codFunc = Funcionario.codFunc) as QTDE_DEP from Funcionario //Selecione todas as colunas da tabela usuário contando a quantidade de dependentes dos funcionários.
Select * (select count(*) from Funcionario where codCargo = cargo.codCargo) as QTDE_FUNC from Cargo //Conte a quantidade total de funcionários