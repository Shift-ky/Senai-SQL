CREATE DATABASE atividade;

USE atividade;

/*1° Construa um script DDL para criar uma tabela clientes e adicionar 
as colunas: id_cliente, nome, idade, dt_nascimento, telefone.*/

CREATE TABLE clientes(
    id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(55) NOT NULL,
	idade INT NOT NULL,
	dt_nascimento INT NOT NULL,
	telefone VARCHAR(20)

);

/*2° Construa um script DDL para criar uma tabela produtos e adicionar 
as colunas: idProduto, nome, preco, dtFabricacao, dtValidade.*/

CREATE TABLE produtos(
	idProdutos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR (55) NOT NULL,
	preco FLOAT NOT NULL,
	dtFabricacao DATE NOT NULL,
	dtValidade DATE NOT NULL
	
);

/*3° Construa um script DDL para alterar o nome das tabelas clientes e produtos para cliente e produto respectivamente.*/

RENAME TABLE clientes TO cliente;

RENAME TABLE produtos TO produto;

/*Crie um script para excluir a coluna dtFabricacao da tabela produto.*/
ALTER TABLE produto
DROP  dtFabricacao;

/*5° Crie um script para alterar o tipo de dados da coluna preco para decimal.*/

ALTER TABLE produto
MODIFY preco DECIMAL;

/*6° Crie um script para adicionar uma coluna cep na tabela cliente.*/
ALTER TABLE cliente
ADD cep VARCHAR(10) NOT NULL;

/*7° Crie um script para alterar o nome da coluna id_cliente para idCliente na tabela cliente.*/
ALTER TABLE cliente
CHANGE id_cliente idCliente INT NOT NULL;

/*8° Crie um script para alterar o nome da coluna dt_nascimento para dtNascimento na tabela cliente.*/
ALTER TABLE cliente
CHANGE dt_nascimento dtNascimento DATE NOT NULL;

/*9°  Crie um script para visualizar todos os databases de um servidor mysql.*/
SHOW DATABASES;