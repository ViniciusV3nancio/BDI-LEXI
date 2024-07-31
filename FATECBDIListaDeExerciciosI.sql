create database FATECBDIListaDeExerciciosI
go

use FATECBDIListaDeExerciciosI
go

create table Cliente(
    ClienteID int Identity(1,1) Primary Key,
    ClienteNome varchar(255) not null,
    EmailCliente varchar(255) Unique,
    DataNascimento Date,
	DependentesID int
	
)

create table Dependentes(
    DependentesID int identity(1,1) primary key,
    ClienteID int,
)

alter table Cliente
Add constraint FK_Dependentes_Cliente
Foreign KEy (DependentesID) references Dependentes(DependentesID)

alter table Dependentes
Add Constraint FK_Cliente_Dependentes
Foreign Key (ClienteID) references CLiente(ClienteID)

create table Fitas(
    FitasID int identity(1,1) primary key,
	CLienteID int,
	FilmesID int
)

Alter table Fitas
Add constraint FK_Cliente_Fitas
Foreign Key (ClienteID) references Cliente(ClienteID)

create table Filmes(
    FilmesID int identity(1,1) primary key,
    NomeFilme varchar(255) not null,
    Genero varchar(50),
	AtorID int
)

Alter Table Fitas
Add constraint FK_Filmes_Fitas
Foreign key (FilmesID) references Filmes(FilmesID)

create table Atores(
    AtorID int identity(1,1) primary key,
    NomeAtor varchar(255) not null,
    Nacionalidade varchar (30),
    Sexo char(1),
	FilmesID int
)

alter table Filmes
Add Constraint FK_Atores_Filmes
Foreign Key (AtorID) references Atores(AtorID)

alter table Atores
add constraint FK_Filmes_Atores
foreign key (FilmesID) references Filmes(FilmesID)

--Constraint para  fazer com que os filmes não possam ter nomes iguais
alter table Filmes
add constraint UNQ_NomeFilme UNIQUE (NomeFilme)
go

Insert Into Cliente (ClienteNome, EmailCliente, DataNascimento) VALUES
    ('Cliente1', 'cliente1@email.com', '1990-01-06'),
    ('Cliente2', 'cliente2@email.com', '1994-02-12'),
    ('Cliente3', 'cliente3@email.com', '1997-05-28'),
    ('Cliente4', 'cliente4@email.com', '1988-08-17'),
    ('Cliente5', 'cliente5@email.com', '1998-12-05'),
    ('Cliente6', 'cliente6@email.com', '1985-04-25'),
    ('Cliente7', 'cliente7@email.com', '1991-07-12'),
    ('Cliente8', 'cliente8@email.com', '1989-11-16')

Insert into Dependentes (ClienteID) VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8)

insert into Filmes (NomeFilme, Genero) VALUES
    ('Filme1', 'Ação'),
    ('Filme2', 'Comédia'),
    ('Filme3', 'Drama'),
    ('Filme4', 'Ficção Científica'),
    ('Filme5', 'Aventura'),
    ('Filme6', 'Romance'),
    ('Filme7', 'Terror'),
    ('Filme8', 'Animação')

Insert into Atores (NomeAtor, Nacionalidade, Sexo) VALUES
    ('Montenegro', 'Brasileira', 'M'),
    ('Kardashian', 'Americana', 'M'),
    ('Dumplatier', 'Francesa', 'F'),
    ('Wattson', 'Britânica', 'M'),
    ('Hamsworth', 'Australiana', 'F'),
    ('Davies', 'Canadense', 'M'),
    ('Zapata', 'Mexicana', 'F'),
    ('Cassilas', 'Espanhola', 'M');

INSERT INTO Fitas (ClienteID, FilmesID) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6),
    (6, 7),
    (7, 8);

Update Atores
set NomeAtor = 'Fox'
where AtorID = 2

Update Atores
set NomeAtor = 'De La Rocha'
where AtorID = 7

delete from Atores
Where AtorID in (8,6,5,3)

alter table Atores
add OscarsGanhos VARCHAR(255) NULL;

truncate table Atores -- não consegui remover tudo com truncste pq não pode dar truncate em tabela com foreign key

--parei por aqui, na D da 3 (remover os dados da tabela sem usar delete)

--voltando no dia seguinte, con orientações do prof, primeiro remover os relacionamentos das tabelas para depois dazer o truncate e relaciona-las novamente

alter table Atores
drop Constraint FK_Filmes_Atores

alter table Filmes
drop constraint FK_Atores_Filmes

truncate table Atores

-- Funcionou, agora apenas excluir de forma fisica a tabela atores

Drop table Atores

--reparei que declarei as foreign keys como nulas, vou alterar para not null
alter table Cliente alter column DependentesID int not null

alter table Fitas alter column FilmesID int not null


--ATIVIDADE 4 E 5 ADIANTE

--Criando tabela fornecedores
Create table Fornecedores(
	Codigo int identity (1,1) not null primary key,
	RazaoSocial varchar(80) not null,
	Apelido varchar(30) null,
	CNPJ bigint not null,
	CPF bigint not null,
	DataCadastro datetime null default getdate(),
	Email varchar(100) not null
)
go

--criando tabela produtos
Create table Produtos(
	Codigo int identity (1,1) not null primary key,
	Descricao varchar(80) not null,
	DataCadastro datetime null default getdate(),
	Quantidade smallint default(0) not null,
	ValorUnitario float(8) not null,
	CodFornecedor int not null
)
go

-- criando a relação entre elas (FK_Produtos_Fornecedores)
Alter table Produtos
Add constraint FK_Produtos_Fornecedores 
Foreign key (CodFornecedor) references Fornecedores(Codigo)
go

-- Inserir 15 registros aleatórios na tabela "Fornecedores"
insert into Fornecedores (RazaoSocial, Apelido, CNPJ, CPF, Email)
values
    ('Fornecedor1', 'Forn1', 12345678901234, 98765432101234, 'forn1@email.com'),
    ('Fornecedor2', 'Forn2', 23456789012345, 87654321012345, 'forn2@email.com'),
    ('Fornecedor3', 'Forn3', 34567890123456, 76543210123456, 'forn3@email.com'),
    ('Fornecedor4', 'Forn4', 45678901234567, 65432101234567, 'forn4@email.com'),
    ('Fornecedor5', 'Forn5', 56789012345678, 54321012345678, 'forn5@email.com'),
    ('Fornecedor6', 'Forn6', 67890123456789, 43210123456789, 'forn6@email.com'),
    ('Fornecedor7', 'Forn7', 78901234567890, 32101234567890, 'forn7@email.com'),
    ('Fornecedor8', 'Forn8', 89012345678901, 21012345678901, 'forn8@email.com'),
    ('Fornecedor9', 'Forn9', 90123456789012, 10123456789012, 'forn9@email.com'),
    ('Fornecedor10', 'Forn10', 10123456789023, 12345678901223, 'forn10@email.com'),
    ('Fornecedor11', 'Forn11', 11234567890234, 23456789012334, 'forn11@email.com'),
    ('Fornecedor12', 'Forn12', 12345678901345, 34567890123445, 'forn12@email.com'),
    ('Fornecedor13', 'Forn13', 23456789012456, 45678901234556, 'forn13@email.com'),
    ('Fornecedor14', 'Forn14', 34567890123567, 56789012345667, 'forn14@email.com'),
    ('Fornecedor15', 'Forn15', 45678901234678, 67890123456778, 'forn15@email.com')
go

-- Inserir 15 registros aleatórios na tabela "Produtos"
insert into Produtos (Descricao, Quantidade, ValorUnitario, CodFornecedor)
values
    ('Produto1', 10, 20.50, 1),
    ('Produto2', 5, 15.75, 2),
    ('Produto3', 20, 30.00, 1),
    ('Produto4', 15, 18.90, 3),
    ('Produto5', 30, 25.00, 2),
    ('Produto6', 12, 22.50, 4),
    ('Produto7', 8, 16.00, 1),
    ('Produto8', 25, 28.75, 3),
    ('Produto9', 7, 19.99, 4),
    ('Produto10', 22, 23.75, 2),
    ('Produto11', 14, 21.00, 1),
    ('Produto12', 18, 26.50, 3),
    ('Produto13', 11, 24.90, 4),
    ('Produto14', 6, 17.25, 2),
    ('Produto15', 9, 20.00, 1)
go

--consultando os dados da tabela fornecedores
select * from Fornecedores
go

--consultando os dados da tabela produtos
select * from Produtos
go

--realizando as junções das tabelas no mesmo select com o comando inner join
select
	F.Codigo as CodFornecedor,
	F.RazaoSocial as Fornecedor,
	P.Codigo as CodProduto,
	P.Descricao as Produto
from
	Fornecedores as F
inner join
	Produtos as P
on
	F.Codigo = P.CodFornecedor
where
	P.Quantidade > 10
	and P.DataCadastro between '01-10-2023' and '30-10-2023'
group by
	F.Codigo, F.RazaoSocial, P.Codigo, P.Descricao
having
	COUNT(Distinct P.DataCadastro) = 1
go

-- Consulta para obter 10 linhas de registro da tabela produtos
Select top 10 Codigo, Descricao, Quantidade, ValorUnitario, CodFornecedor
from Produtos;

-- Consulta para selecionar 10 valores não armazenados na tabela produtos
select
    -1 as Codigo, 'Produto Extra 1' as Descricao, 100 as Quantidade, 50.00 as ValorUnitario, 1 as CodFornecedor
union
select
    -2 as Codigo, 'Produto Extra 2' as Descricao, 50 as Quantidade, 30.00 as ValorUnitario, 2 as CodFornecedor
union
select
    -3 as Codigo, 'Produto Extra 3' as Descricao, 75 as Quantidade, 40.00 as ValorUnitario, 3 as CodFornecedor
union
select
    -4 as Codigo, 'Produto Extra 4' as Descricao, 60 as Quantidade, 35.00 as ValorUnitario, 1 as CodFornecedor
UNION
SELECT
    -5 as Codigo, 'Produto Extra 5' as Descricao, 120 as Quantidade, 60.00 as ValorUnitario, 2 as CodFornecedor
union
select
    -6 as Codigo, 'Produto Extra 6' as Descricao, 90 as Quantidade, 45.00 as ValorUnitario, 3 as CodFornecedor
union
select
    -7 as Codigo, 'Produto Extra 7' as Descricao, 85 as Quantidade, 42.50 as ValorUnitario, 1 as CodFornecedor
union
select
    -8 as Codigo, 'Produto Extra 8' as Descricao, 70 as Quantidade, 35.00 as ValorUnitario, 2 as CodFornecedor
union
select
    -9 as Codigo, 'Produto Extra 9' as Descricao, 110 as Quantidade, 55.00 as ValorUnitario, 3 as CodFornecedor
union
select
    -10 as Codigo, 'Produto Extra 10' as Descricao, 95 as Quantidade, 47.50 as ValorUnitario, 1 as CodFornecedor;
go

--mostrar todos os dados sem usar asterisco
select Codigo, Descricao, DataCadastro, Quantidade, ValorUnitario, CodFornecedor
from Produtos
--apresentar com dados ordenados de forma decrescente
order by Quantidade desc --só não ficou muito claro na lista com qual dados deveria ordenar, por duvida utilizei a tabela quantidade
go

--apresentando uma lonha de registro usando a clausula where
select Codigo, Descricao, DataCadastro, Quantidade, ValorUnitario, CodFornecedor
from Produtos
where Quantidade = '9'
go

--mostrando as 5 primeiras linhas
select top 5 Codigo, Descricao, DataCadastro, Quantidade, ValorUnitario, CodFornecedor
from Produtos
go