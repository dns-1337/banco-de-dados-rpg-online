# Banco de Dados - Jogo de RPG Online

Avaliação 1 da disciplina de Banco de Dados: criação das tabelas do projeto de um jogo de RPG online usando DDL no SQL Server.

## Tabelas

- **USUARIOS** - UsuarioId (PK), Email, Senha
- **CLASSES** - ClasseId (PK), Nome, Descricao
- **HABILIDADES** - HabilidadeId (PK), Nome
- **PERSONAGENS** - PersonagemId (PK), NomePersonagem, UsuarioId (FK), ClasseId (FK)
- **CLASSES_HABILIDADES** - ClasseId (PK, FK), HabilidadeId (PK, FK)

## Relacionamentos

- USUARIOS 1:N PERSONAGENS
- CLASSES 1:N PERSONAGENS
- CLASSES N:N HABILIDADES (resolvido pela tabela CLASSES_HABILIDADES)

## Como executar

Abrir o arquivo `rpg_online.sql` no SQL Server Management Studio (SSMS), conectado ao servidor, e executar o script.
