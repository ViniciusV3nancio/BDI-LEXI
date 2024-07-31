Create Database FATECBDListaDeExerciciosI
Go

Use FATECBDListaDeExerciciosI
Go

Create Table Filmes
(CodFilme Int Primary Key Identity(1,1),
TituloFilme Varchar (80) Not Null,
CategoriaDoFilme Varchar (80) Not Null)
Go

Alter Table Filmes


Create Table Fitas
(CodFitas Int Primary Key Identity (1,1))
Go

Alter Table Fitas
Add FitaFilme Varchar(80) Null
Go

Create Table Atores 
(CodAtor Int Primary Key Identity (1,1),
NomeAtor Varchar (80) Null,
DataDeNascAtor DateTime Null,
NomePersonagem Varchar Null)
Go

Alter Table Atores
Alter Column DataDeNascAtor Date Null
Go

Alter Table Atores
ALter Column NomePersonagem Varchar (80) Null
Go

Create Table Clientes
(CodCliente Int Primary Key Identity (1,1),
NomeCliente Varchar (80) Not Null,
ContatoTel Varchar (20) Not Null,
ContatoEmail Varchar (80) Not Null,
FitaAlugada Varchar (80) Not Null,
DataAluguel DateTime Not Null,
DataDevolucao DateTime Not Null)
Go

Alter Table Clientes
Alter Column DataAluguel Date Not Null
Go

Alter Table Clientes
Alter Column DataDevolucao Date Not Null
Go

Create Table Dependentes
(CodDependente Int Primary Key Identity (1,1),
NomeDependente Varchar (80))
Go

Alter Table Dependentes
Add IdadeDependente Int
Go

Insert Into Filmes (TituloFilme, CategoriaDoFilme)
Values ( 'Rogue One: A Star Wars Story', 'Action'),
		('Raiders of the Lost Ark', 'Adventure'),
		('The Lord of the Rings: The Fellowship of the Ring', 'Fantasy'),
		('Forrest Gump', 'Romance'),
		('Titanic', 'Drama'),
		('The Matrix', 'Science Fiction'),
		('Scott Pilgrim vs. the World', 'Comedy'),
		('Dark Water', 'Horror')
Go

Insert Into Atores (NomeAtor, DataDeNascAtor, NomePersonagem)
Values ('Felicity Jones', '17-10-1983', 'Jyn Erso'),
		('Harrison Ford', '13-07-1942', 'Indiana Jones'),
		('Elijah Wood', '28-01-1981', 'Frodo'),
		('Tom Hanks', '09-07-1956', 'Forrest Gump'),
		('Leonardo DiCaprio', '11-11-1974', 'Jack Dawson'),
		('Keanu Reeves', '02-09-1964', 'Neo')
Go

Insert Into Atores (NomeAtor, DataDeNascAtor, NomePersonagem)
Values ('Michael Cera', '07-06-1988', 'Scott Pilgrim'),
		('Yoshimi Matsubara', '05/10/1960', 'Hitomi Kuroki')
Go
		

Insert Into Fitas (FitaFilme)
Values ('ROne'),
		('RotLA'),
		('LotR'),
		('FG'),
		('TTC'),
		('MTX'),
		('SPvstW'),
		('DW')
Go

Insert Into Clientes (NomeCliente, ContatoTel, ContatoEmail, FitaAlugada, DataAluguel, DataDevolucao)
Values ('Irineu', '11 9 8526-3174', 'irineutunaosabe@enemeu.com', 'Rone', '20-10-2023', '27-10-2023'),
		('Jubileu', '11 9 7514-4513', 'jubileutunaosabe@enemeu.com', 'RotLA', '20-10-2023', '27-10-2023'),
		('Isabela', '11 9 4518-3210', 'isabelanaosabe@enemela.com', 'LotR', '20-10-2023', '27-10-2023'),
		('Vaudiscleia', '11 9 9874-0540', 'vaudiscleianaosabe@enemeu.com', 'FG', '20-10-2023', '27-10-2023'),
		('Nakama Shota', '11 9 7777-2222', 'shotanakama@eforadela.com', 'TTC', '20-10-2023', '27-10-2023'),
		('Berta Rachou', '11 9 9620-2028', 'bertinharachadora@gmail.com', 'MTX', '20-10-2023', '27-10-2023'),
		('Jabesmar', '11 9 2583-8945', 'jabesmarenaterra@sky.com', 'SPvstW', '20-10-2023', '27-10-2023'),
		('Beiçola', '11 9 9453-7412', 'paltelzindobeicola@padaria.com', 'DW', '20-10-2023', '27-10-2023')
Go

Insert Into Dependentes (NomeDependente)
Values ('Evódia'),
		('Drágica Broko'), 
		('Eraldonclóbes'),
		('Graciosa Rodela'),
		('Jacinto Leite aqui no Rego'),
		('Danúbio Tarada Duarte'),
		('Dolores de Mandioca Assada'),
		('Indigesto Ereto')
Go

Insert Into Dependentes (IdadeDependente)
Values (18),
		(19),
		(28),
		(23),
		(58),
		(75),
		(100),
		(83)
Go



Select TituloFilme, CategoriaDoFIlme from Filmes
Go


Select NomeAtor, DataDeNascAtor, NomePersonagem From Atores
Go

Select CodFitas, FitaFilme From Fitas
Go

Select NomeCliente, ContatoTel, ContatoEmail, FitaAlugada, DataAluguel, DataDevolucao From Clientes
Go

Select NomeDependente, IdadeDependente From Dependentes
Go

-- Estou Com Problemas de Fazer a Relação, diz que o Alter Table Conflita com a Foreign Key --
Alter Table Atores
Add Constraint [FK_Cod_Filme_CodAtor] Foreign Key (CodAtor)
References Filmes(CodFilme)
Go

Alter Table Fitas
Add Constraint [FK_Cod_Filme_CodFitas] Foreign Key (CodFitas)
References Filmes(CodFilme)
Go

Alter Table Clientes
Add Constraint [FK_Cod_Fitas_CodCliente] Foreign Key (CodCliente)
References Fitas(CodFitas)
Go

Alter Table Clientes
Add Constraint [FK_Cod_Dependente_CodCliente] Foreign Key (CodCliente)
References Dependentes(CodDependente)
Go

Update Dependentes
Set NomeDependente = 'Evódika'
Where CodDependente = 1
Go

Update Clientes
Set NomeCliente = 'Shota Nakama'
Where CodCliente = 5
Go

Delete From Dependentes
Where CodDependente in (9,12,11,16)
Go

Alter Table Fitas
Add FitaVazia Int Null
Go

Alter Table Clientes
Drop Constraint [FK_Cod_Dependente_CodCliente]
Go

Truncate Table Dependentes
Go

Drop Table Dependentes
Go

-- Fim do Exercício 1 -- 

-- Professor, sei que já é meio tarde de falar isso, tive bastante dificuldade em fazer o MER antes do Código e fazer ele ser parecido, na hora de fazer as relações de Foreign Keys entre as tabelas antes de inserir os Dados eu consegui tranquilamente, mas não consegui após inserir os dados, marquei com comentário a parte que não consegui ligar a tabela filmes a atores, se o sr quiser invalidar minha primeira questão eu compreendo, mas gostaria de achar qual o problema com o meu código, e o sr me ajudasse a melhorar o meu MER, Obrigado --

-- Começo do Exercício 2 -- 
Use FATECBDListaDeExerciciosI
Go

-- Criando a Tabela Fornecedores --
Create Table Fornecedores
(Codigo Int  Not Null Primary Key  Identity (1,1),
RazaoSocial Varchar (80) Not Null,
Apelido Varchar (30) Null,
CNPJ BigInt Not Null,
CPF BigInt Not Null,
DataCadastro DateTime Null Default GetDate(),
Email Varchar (100) Not Null)
Go

-- Criando a Tabela Produtos --
Create Table Produtos
(Codigo Int Not Null Primary Key Identity (1,1),
Descricao Varchar (80) Not Null,
DataCadastro DateTime Null Default GetDate(),
Quantidade SmallInt Not Null Default (0),
ValorUnitario Float (8) Not Null,
CodFornecedores Int Not Null)
Go

-- Adicionando o Relacionamento Físico Entre a Tabela de Produtos e a Tabela de Fornecedores --
Alter Table Produtos
Add Constraint [FK_Produtos_Fornecedores] Foreign Key (CodFornecedores)
References Fornecedores (Codigo)
Go

-- Inserindo Quinze Linhas de Registros em Cada Tabela começando pela tabela de "Fornecedores" --

Insert Into Fornecedores (RazaoSocial, Apelido, CNPJ, CPF, Email)
Values ('Churrasic Park', 'Galinha Frita', 15974268, 95126840, 'dinossauroassado@gmail.com'),
		('Sakana Japanese Restaurant', 'Menino Sushi', 78945031, 03214585, 'sakanatuacama@gmail.com'),
		('Paul Molé', 'Broxinha', 62481357, 48910239, 'embuscadoviagra@gmail.com'),
		('Necrotério Bar', 'Seu Omar', 04173982, 93817250, 'vembuscarsuacova@gmail.com'),
		('Fio Terra Lan House & Jogos', 'Urologista', 96374180, 04283951, 'dedogrosso@hotmail.com'),
		('BomBARdeio', 'Marinheiro', 12347890, 65742040, 'obardoestouro@outlook.com'),
		('Toletão', 'Bom de Bosta', 44342354, 54856444, 'essabosta@gmail.com'),
		('Bar do Suvaco', 'CC', 86254274, 75637333, 'ocheiroedematar@yahoo.com'),
		('Fudeus', 'Pobre', 83528583, 72483854, 'essaedefude@gmail.com'),
		('Mastigada da Jumenta', 'Jumentinho', 38663684, 38663684, 'bemdigerido@terra.com'),
		('Paulo Fusos', 'Paulão', 69542588, 85463233, 'chamaopaulao@hotmail'),
		('Bigolin', 'Bigolinho', 98899882, 44648342, 'epequenomasderespeito@gmail.com'),
		('Kudossi', 'Muie do Paulão', 48573275, 95483544, 'bemacucarado@outlook.com'),
		('O Senhor dos Pastéis', 'Gandalf', 42783436, 65588244, 'pastelariadogandalf@terramedia.com'),
		('Bendito Pão', 'Benedito', 72936925, 96846658, 'paoabencoado@paraiso.com')
Go

-- Inserindo Quinze Linhas de Registros em Cada Tabela "Produtos" --

Insert Into Produtos (Descricao, Quantidade, ValorUnitario, CodFornecedores)
Values ('Carninha de Frango', 2, 10.00, 1),
		('Sushi', 10, 7.99, 2),
		('Gudang', 7, 29.99, 3),
		('Caixão', 1, 99.99, 4),
		('Coquinha', 6, 4.99, 5),
		('Barreirão', 4, 12.99, 6),
		('Chocolate', 2, 8.99, 7),
		('Desodorante', 3, 2.99, 8),
		('Viagra', 5, 18.99, 9),
		('Grama Sintética', 8, 23.99, 10),
		('Parafuso', 11, 1.99,11),
		('Creme', 17, 6.99, 12),
		('Calcinha', 69, 13.99, 13),
		('Pastel de Frango', 15, 7.99, 14),
		('Pão Francês', 100, 6.99, 15)
Go
		
-- Consultando os Registros na Tabela Fornecedores --
	
Select RazaoSocial, Apelido, CNPJ, CPF, Email From Fornecedores
Go

-- Consultando os Registros na Tabela Produtos -- 

Select Descricao, Quantidade, ValorUnitario, CodFornecedores From Produtos
Go

-- Realizando a Junção Entre as Tabelas Fornecedores e Produtos no Mesmo Comando Select atravéz do Opertador "Inner Join" -- 
Select R.RazaoSocial As 'Nome da Empresa',
		G.Descricao As 'Nome do Produto',
		R.Apelido As 'Nome Informal',
		G.ValorUnitario As 'Valor do Produto'
From Fornecedores As R Inner Join Produtos As G
												On R.Codigo = G.Codigo
												-- Adicionando os Produtos que Possuem Quantidade Maior que 10 --
												Where G.Quantidade >10 And G.DataCadastro Between '01-10-2023' And '30-10-2023' -- Filtando Entre as Datas 01 e 30 de Outubro de 2023 --
												Go

-- Declarando um Bloco de Código atravéz do Comando "Select" Apresentando 10 Linhas de Código Armazenados na Tabela Produtos  -- 
Select Top 10 Codigo, Descricao, Quantidade, ValorUnitario, CodFornecedores
From Produtos

-- Realizando o Comando Union entre o Select Anterior e 10 novos produtos que não foram armazenados previamente e são totalmente novos --
Union
Select 
16 As Codigo, 'Pastel de Carne' As Descricao, 4.99 As ValorUnitario, 20 As Quantidade, 14 As CodFornecedores
Union
Select
17 As Codigo, 'Pastel de Quejo' As Descricao, 6.99 As ValorUnitario, 30 As Quantidade, 14 As CodFornecedores
Union
Select
18 As Codigo, 'Pastel Especial de Carne' As Descricao, 14.99 As ValorUnitario, 10 As Quantidade, 14 As CodFornecedores
Union
Select
19 As Codigo, 'Pastel Especial de Frango' As Descricao, 14.99 As ValorUnitario, 10 As Quantidade, 14 As CodFornecedores
Union
Select
20 As Codigo, 'Pastel de Porguesa' As Descricao, 10.99 As ValorUnitario, 13 As Quantidade, 14 As CodFornecedores
Union 
Select
21 As Codigo, 'Pastel de Calabresa' As Descricao, 11.99 As ValorUnitario, 10 As Quantidade, 14 As CodFornecedores
Union 
Select
22 As Codigo, 'Pastel de Palmito' As Descricao, 8.99 As ValorUnitario, 30 As Quantidade, 14 As CodFornecedores
Union
Select
23 As Codigo, 'Pastel de Paçoca' As Descricao, 9.99 As ValorUnitario, 15 As Quantidade, 14 As CodFornecedores
Union
Select
24 As Codigo, 'Pastel de Romeu e Julieta' As Descricao, 13.99 As ValorUnitario, 19 As Quantidade, 14 As CodFornecedores
Union
Select
25 As Codigo, 'Pastel de Queijo com Doce de Leite' As Descricao, 10.99 As ValorUnitario, 10 As Quantidade, 14 As CodFornecedores
Go

-- Mostrando Todos os Dados em um Select sem Usar Asterístico na Tabela de Fornecedores --
Select Codigo, RazaoSocial, CNPJ, CPF, Apelido, Email, DataCadastro
From Fornecedores 
-- Apresentando os Dados de Forma Decrescente -- 
Order By DataCadastro Desc
Go

-- Apresentando Somente Uma Linha de Registro Utilizando a Claúsula "Where" --
Select Codigo, Descricao, Quantidade, ValorUnitario, CodFornecedores 
From Produtos
Where Quantidade = 10
Go

-- Apresentando As 5 Primeiras Linhas de Registro na Tabela de Produtos --
Select Top 5 Codigo, Descricao, Quantidade, ValorUnitario, CodFornecedores
From Produtos
Go

-- Fim do Exercício 2 -- 


