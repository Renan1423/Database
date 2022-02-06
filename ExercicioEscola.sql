CREATE DATABASE Escola
USE Escola
create Table Curso (cod_curso numeric(6) PRIMARY KEY, nome_curso char(50), carga_charria numeric(3), maximo_alunos numeric(2), minimo_alunos numeric(2), preco_turma money, preco_aluno money, equip_necessario char(80))
create Table Professor (cod_professor numeric(6) PRIMARY KEY, nome_professor char(30), area char(4), ramal numeric(4), email_professor char(50))
create Table Turma (cod_turma numeric(6) PRIMARY KEY, cod_curso numeric(6) FOREIGN KEY REFERENCES Curso(cod_curso), cod_professor numeric(6) FOREIGN KEY REFERENCES Professor(cod_professor), termino_inscricoes date, inicio_aulas date, fim_aulas date, inscritos numeric(3), tipo_turma char(1), valor_faturado money, valor_turma_fechada money, carga_horaria_ministrada numeric(3))
create Table Alocacao (cod_turma numeric(6) FOREIGN KEY REFERENCES Turma(cod_turma), nome_sala char(10), dia date, inicio date, fim date)
create Table Aluno (cod_aluno numeric(6) PRIMARY KEY, nome_aluno char(30), endereco char(50), bairro char(20), cidade char(20), cep numeric(8), telefone char(20), email_aluno char(50))
create Table Contrato (cod_contrato numeric(6) PRIMARY KEY, nome_firma char(50), contato char(30), telefone_firma char(20), fax_firma char(20))
create Table Inscricao (conceito char(4), cod_turma numeric(6) FOREIGN KEY REFERENCES Turma(cod_turma), cod_aluno numeric(6) FOREIGN KEY REFERENCES Aluno(cod_aluno), valor_cobrado money, cod_contrato numeric(6) FOREIGN KEY REFERENCES Contrato(cod_contrato))
create Table Laboratorio (nome_sala char(10) PRIMARY KEY, capacidade numeric (3), equip_disponivel char(80))
create Table Ministra (cod_professor numeric(6) FOREIGN KEY REFERENCES Professor(cod_professor), cod_curso numeric(6) FOREIGN KEY REFERENCES Curso(cod_curso))
insert into Curso (cod_curso, nome_curso, carga_charria, maximo_alunos, minimo_alunos, preco_turma, preco_aluno, equip_necessario) VALUES ('1','Informática','212', '40', '20', '10','10', 'PC e Café')
insert into Professor(cod_professor, nome_professor, area, ramal, email_professor) VALUES ('1','Ricardo Luiz', 'Info', '1', 'algumacoisa@gmail.com')
insert into Professor(cod_professor, nome_professor, area, ramal) VALUES ('6','Renan Nunes','EXTN','0000')
insert into Turma(cod_turma,termino_inscricoes,inicio_aulas,fim_aulas,inscritos,tipo_turma,valor_faturado, valor_turma_fechada,carga_horaria_ministrada) VALUES('1','01/02/20','04/02/20','01/25/20','40','B','10','20','212')
insert into Alocacao(nome_sala, dia, inicio, fim) VALUES('2Info','06/09/19','30/12/19')
insert into Aluno(cod_aluno, nome_aluno, endereco, bairro, cidade, cep, telefone, email_aluno)Values('1','Rerezin das Galáxias','Rua das Galáxias','Bairro','cidade','495734','rerezin@gmailcom')
insert into Contrato(cod_contrato, contato, telefone_firma, fax_firma)VALUES('1','82345738','253458','92359347')
insert into Inscricao (conceito,valor_cobrado) VALUES('aaaa','10')
insert into Laboratorio (nome_sala, equip_disponivel) VALUES('21T','PC')
select nome_curso, preco_aluno from Curso
select cod_professor, nome_professor, area, ramal, email_professor from Professor Where (cod_professor = 1 or cod_professor = 6)
/*select cod_turma,termino_inscricoes,inicio_aulas,fim_aulas,inscritos,tipo_turma,valor_faturado, valor_turma_fechada,carga_horaria_ministrada from Turma Where(cod_turma = 1)
select nome_sala, dia, inicio, fim from Alocacao
select cod_aluno, nome_aluno, endereco, bairro, cidade, cep, telefone, email_aluno from Aluno Where (cod_aluno = 1)
select cod_contrato, contato, telefone_firma, fax_firma from Contrato Where (cod_contrato = 1)
select conceito,valor_cobrado from Inscricao
select nome_sala, equip_disponivel from Laboratorio*/
select nome_curso, (preco_turma/minimo_alunos) from Curso 
select valor_cobrado from inscricao
select nome_aluno, bairro, cidade from Aluno order by bairro
select nome_aluno, bairro, cidade from Aluno order by cidade,bairro
select nome_aluno, bairro from Aluno where bairro ='Tijuca' order by nome_aluno
select nome_curso, preco_turma from Curso order by preco_turma
