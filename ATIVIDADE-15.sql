/*CRIAR UM BANCO DE DADOS PARA UMA EMPRESA 
PROJETO PARA TERMINO DE CURSO*/
CREATE DATABASE LOJA_ROUPA;

USE LOJA_ROUPA;

CREATE TABLE CLIENTE(
    id_cliente INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(20)  NOT NULL,
    genero VARCHAR(9) NOT NULL,
    dataNascimento DATE NOT NULL
	
);

CREATE TABLE FISICO(
    id_fisico INT PRIMARY KEY UNIQUE  AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    cliente_id INT UNIQUE
);

CREATE TABLE JURIDICO(
    id_juridico INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    razaoSocial VARCHAR(150) NOT NULL,
    cliente_id INT NOT NULL
);

CREATE TABLE TELEFONE(
    id_telefone INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
	tipoTelefone varchar(10),
    telefone1 VARCHAR(20),
    cliente_id INT
);


CREATE TABLE ENDERECO(
    id_endereco INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    cep VARCHAR(9) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT(4) NOT NULL,
    complemento VARCHAR(50),
    pontoReferencia VARCHAR(50) NOT NULL,
    cliente_id INT UNIQUE
);

CREATE TABLE DESCONTO(
    id_desconto INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    valor FLOAT(5) NOT NULL,
    nome VARCHAR(50)
);

CREATE TABLE PEDIDO(
    id_pedido INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    cor VARCHAR(15) NOT NULL,
    tamanho VARCHAR(4) NOT NULL,
	quantidade int NOT NULL,
    valor FLOAT(5) NOT NULL,
    dataPedido DATE NOT NULL,
    horaPedido TIME NOT NULL,
    cliente_id INT,
    desconto_id INT
);

CREATE TABLE PAGAMENTO(
	id_pagamento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	formaPagamento VARCHAR(50),
	pedido_id INT
);



CREATE TABLE PRODUTO(
	id_produto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	quantidade INT NOT NULL,
	tamanho VARCHAR(3),
	cor VARCHAR(10),
	pedido_id int
	
);


CREATE TABLE GENERO(
	id_genero INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(45),
	produto_id INT
);

CREATE TABLE CONTROLE_ESTOQUE(
	id_controleEstoque INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	controleEstoque_id INT,
	controleProduto_id INT
);

CREATE TABLE ESTOQUE(
	id_estoque INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	quantidade INT
);

CREATE TABLE CONTROLE_FORNECEDOR(
	id_controleFornecedor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	controleFornecedor_id int,
	controleProduto_id int
);

CREATE TABLE FORNECEDOR(
	id_fornecedor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomeFornecedor VARCHAR(120),
	emailFornecedor VARCHAR(100),
	telefoneFornecedor VARCHAR(100)
);

ALTER TABLE JURIDICO ADD CONSTRAINT FK_JURIDICO FOREIGN KEY(cliente_id)
REFERENCES CLIENTE(id_cliente);

ALTER TABLE FISICO ADD CONSTRAINT FK_FISICO FOREIGN KEY(cliente_id)
REFERENCES CLIENTE(id_cliente);

ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO FOREIGN KEY(cliente_id)
REFERENCES CLIENTE(id_cliente);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_TELEFONE FOREIGN KEY(cliente_id)
REFERENCES CLIENTE(id_cliente);

ALTER TABLE PEDIDO ADD CONSTRAINT FK_PEDIDO FOREIGN KEY(cliente_id)
REFERENCES CLIENTE(id_cliente);

ALTER TABLE PEDIDO ADD CONSTRAINT FK_PEDIDODESCONTO FOREIGN KEY(desconto_id)
REFERENCES DESCONTO(id_desconto);

ALTER TABLE PAGAMENTO ADD CONSTRAINT FK_PAGAMENTO FOREIGN KEY(pedido_id)
REFERENCES PEDIDO(id_pedido);

ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO FOREIGN KEY(pedido_id)
REFERENCES PEDIDO(id_pedido);

ALTER TABLE GENERO ADD CONSTRAINT FK_GENERO FOREIGN KEY(produto_id)
REFERENCES PRODUTO(id_produto);

ALTER TABLE CONTROLE_ESTOQUE ADD CONSTRAINT FK_CONTROLE_ESTOQUE FOREIGN KEY(controleEstoque_id)
REFERENCES ESTOQUE(id_estoque);

ALTER TABLE CONTROLE_ESTOQUE ADD CONSTRAINT FK_CONTROLE_PRODUTO FOREIGN KEY(controleProduto_id)
REFERENCES PRODUTO(id_produto);

ALTER TABLE CONTROLE_FORNECEDOR ADD CONSTRAINT FK_CONTROLE_FORNECEDOR FOREIGN KEY(controleFornecedor_id)
REFERENCES FORNECEDOR(id_fornecedor);

ALTER TABLE CONTROLE_FORNECEDOR ADD CONSTRAINT FK_CONTROLE_FORNECEDOR_PRODUTO FOREIGN KEY(controleProduto_id)
REFERENCES PEDIDO(id_pedido);

