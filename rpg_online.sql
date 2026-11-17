/* =========================================================
   Avaliacao 1 - Banco de Dados
   Projeto: Jogo de RPG Online
   Criacao das tabelas utilizando DDL (SQL Server)
   ========================================================= */

-- Criando o banco de dados do projeto
CREATE DATABASE RPG_Online;
GO

-- Selecionando o banco de dados
USE RPG_Online;
GO


-- ---------------------------------------------------------
-- Tabela USUARIOS
-- ---------------------------------------------------------
CREATE TABLE USUARIOS (
    UsuarioId INT IDENTITY(1,1) NOT NULL,
    Email     VARCHAR(100)      NOT NULL,
    Senha     VARCHAR(255)      NOT NULL,
    CONSTRAINT PK_USUARIOS PRIMARY KEY (UsuarioId),
    CONSTRAINT UQ_USUARIOS_Email UNIQUE (Email)
);
GO


-- ---------------------------------------------------------
-- Tabela CLASSES
-- ---------------------------------------------------------
CREATE TABLE CLASSES (
    ClasseId  INT IDENTITY(1,1) NOT NULL,
    Nome      VARCHAR(50)       NOT NULL,
    Descricao VARCHAR(255)      NULL,
    CONSTRAINT PK_CLASSES PRIMARY KEY (ClasseId),
    CONSTRAINT UQ_CLASSES_Nome UNIQUE (Nome)
);
GO


-- ---------------------------------------------------------
-- Tabela HABILIDADES
-- ---------------------------------------------------------
CREATE TABLE HABILIDADES (
    HabilidadeId INT IDENTITY(1,1) NOT NULL,
    Nome         VARCHAR(50)       NOT NULL,
    CONSTRAINT PK_HABILIDADES PRIMARY KEY (HabilidadeId),
    CONSTRAINT UQ_HABILIDADES_Nome UNIQUE (Nome)
);
GO


-- ---------------------------------------------------------
-- Tabela PERSONAGENS
-- USUARIOS 1:N PERSONAGENS
-- CLASSES  1:N PERSONAGENS
-- ---------------------------------------------------------
CREATE TABLE PERSONAGENS (
    PersonagemId   INT IDENTITY(1,1) NOT NULL,
    NomePersonagem VARCHAR(50)       NOT NULL,
    UsuarioId      INT               NOT NULL,
    ClasseId       INT               NOT NULL,
    CONSTRAINT PK_PERSONAGENS PRIMARY KEY (PersonagemId),
    CONSTRAINT UQ_PERSONAGENS_Nome UNIQUE (NomePersonagem),
    CONSTRAINT FK_PERSONAGENS_USUARIOS FOREIGN KEY (UsuarioId)
        REFERENCES USUARIOS (UsuarioId),
    CONSTRAINT FK_PERSONAGENS_CLASSES FOREIGN KEY (ClasseId)
        REFERENCES CLASSES (ClasseId)
);
GO


-- ---------------------------------------------------------
-- Tabela CLASSES_HABILIDADES (tabela associativa)
-- CLASSES N:N HABILIDADES
-- ---------------------------------------------------------
CREATE TABLE CLASSES_HABILIDADES (
    ClasseId     INT NOT NULL,
    HabilidadeId INT NOT NULL,
    CONSTRAINT PK_CLASSES_HABILIDADES PRIMARY KEY (ClasseId, HabilidadeId),
    CONSTRAINT FK_CLASSES_HABILIDADES_CLASSES FOREIGN KEY (ClasseId)
        REFERENCES CLASSES (ClasseId),
    CONSTRAINT FK_CLASSES_HABILIDADES_HABILIDADES FOREIGN KEY (HabilidadeId)
        REFERENCES HABILIDADES (HabilidadeId)
);
GO


-- Conferindo as tabelas criadas
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO
