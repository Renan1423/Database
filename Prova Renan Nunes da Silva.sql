Create Database Prova

Use Prova

create Table Vendedor(
cod_vendedor int not null primary key,
nome_vendedor char(20),
Cidade_Vendedor char(20),
Endereco_Vendedor char(20),
CPF_Vendedor char(11),
Fone_Vendedor char(11))

create Table Imovel(
cod_imovel int not null primary key,
ano_cadastro int, 
Endereco_Imovel char(20), 
Bairro_Imovel char(20), 
Cidade_Imovel char(20), 
Valor_Imovel money)
Alter Table Imovel add cod_vendedor int Foreign Key References vendedor(cod_vendedor) 

select nome_vendedor from Vendedor where nome_vendedor like '_a_l'

Alter Table Imovel add ano_cadastro int

select cod_imovel from Imovel where ano_cadastro = 2009

create Table Comprador(
cod_comprador int Primary Key,
nome_comprador char(20),
CPF_comprador char(11), 
Endereco_comprador char(40), 
Bairro_comprador char(20))

select cod_comprador, nome_comprador from Comprador where cod_comprador > 15 and Bairro_comprador = 'Santana'

select distinct Cidade_Vendedor from Vendedor

select * from Imovel where Bairro_Imovel = null

Update Imovel set Valor_Imovel = (Valor_Imovel * 0.15) where Cidade_Imovel = 'São Paulo' or Cidade_Imovel = 'Rio de Janeiro' or Cidade_Imovel = 'Salvador' or Cidade_Imovel = 'Santos'