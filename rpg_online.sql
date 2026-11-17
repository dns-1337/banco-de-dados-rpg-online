-- Avaliacao 1 - Banco de Dados
-- Projeto: Jogo de RPG Online

-- criacao do banco de dados
CREATE DATABASE RPG_Online
GO

-- selecionando o banco de dados
USE RPG_Online
GO

-- criacao da tabela de usuarios
CREATE TABLE Usuarios
(
	UsuarioId INT PRIMARY KEY IDENTITY
	,Email VARCHAR(120) NOT NULL UNIQUE
	,Senha VARCHAR(120) NOT NULL
)

-- criacao da tabela de classes
CREATE TABLE Classes
(
	ClasseId INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(60) NOT NULL UNIQUE
	,Descricao VARCHAR(255)
)

-- criacao da tabela de habilidades
CREATE TABLE Habilidades
(
	HabilidadeId INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(60) NOT NULL UNIQUE
)

-- criacao da tabela de personagens
-- um usuario possui varios personagens (1:N)
-- uma classe possui varios personagens (1:N)
CREATE TABLE Personagens
(
	PersonagemId INT PRIMARY KEY IDENTITY
	,NomePersonagem VARCHAR(60) NOT NULL
	,UsuarioId INT NOT NULL FOREIGN KEY REFERENCES Usuarios(UsuarioId)
	,ClasseId INT NOT NULL FOREIGN KEY REFERENCES Classes(ClasseId)
)

-- criacao da tabela classes_habilidades
-- resolve o relacionamento N:N entre classes e habilidades
CREATE TABLE Classes_Habilidades
(
	ClasseId INT NOT NULL FOREIGN KEY REFERENCES Classes(ClasseId)
	,HabilidadeId INT NOT NULL FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
	,PRIMARY KEY (ClasseId, HabilidadeId)
)
