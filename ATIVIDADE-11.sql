/*Um petshop especializado apenas em cães deseja informatizar seus
serviços. Inicialmente é preciso armazenar os dados dos clientes, os
dados dos veterinários, as informações sobre as consultas e os dados
dos animais. Dos clientes é importante armazenar o nome, o cpf e o
telefone. Já dos veterinários é importante armazenar o código do seu
registro que é o CRMV, o seu nome, a data de admissão e o salário. De
cada animal é importante guardar o nome, o ano de nascimento e a
raça. Veterinários realizam consultas aos animais e é importante saber o
dia da consulta, a hora da consulta e o motivo, pois é interessante
sempre conseguir obter uma listagem para cada veterinário dos animais
que ele consultou. Por fim, é importante saber qual é o dono de cada
cãozinho, considerando que há alguns clientes que além de compras,
levam os animais para as consultas.*/

/*CRIANDO O BANCO DE DADOS*/
CREATE DATABASE petshop;

/*CONECTANDO NO BANCO DE DADOS*/
USE PETSHOP;

/*CRIANDO AS TABELAS*/
CREATE TABLE veterinario(
	idVeterinario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome varchar(50) not null,
	crmv VARCHAR(8) UNIQUE,
	dtAdmissao DATE,
	salario FLOAT
	);
	
CREATE TABLE cliente(
	idCliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	telefone VARCHAR(9) NOT NULL
	);
	
CREATE TABLE compra(
	idCompra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	clienteID INT,
	produtoID INT
	);
	
CREATE TABLE produto(
	idProduto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	valor FLOAT NOT NULL
);

CREATE TABLE consulta(
	idConsulta INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	animalID INT, 
	veterinarioID INT
);
	
CREATE TABLE animal(
	idAnimal INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL, 
	ano INT,
	RACA VARCHAR(45),
	idCliente INT
	);


/*COLOCANDO OS RELACIONAMENTOS DAS TABELAS*/
ALTER TABLE consulta ADD FOREIGN KEY (animalID) 
REFERENCES animal(idAnimal);

ALTER TABLE consulta ADD FOREIGN KEY (veterinarioID) 
REFERENCES veterinario(idVeterinario);

ALTER TABLE compra ADD FOREIGN KEY (clienteID) 
REFERENCES cliente(idCliente);

ALTER TABLE compra ADD FOREIGN KEY (produtoID) 
REFERENCES produto(idProduto);

ALTER TABLE animal ADD FOREIGN KEY (idCliente) 
REFERENCES cliente(idCliente);

INSERT INTO cliente VALUES(NULL,'EZEQUIEL',11122654562,85987984007);
INSERT INTO cliente VALUES(NULL,'PIRAMBELEIA', 11146465432,12154562155);
INSERT INTO cliente VALUES(NULL,'ZEBEDEU', 89548465684,57454864546);
INSERT INTO cliente VALUES(NULL,'JUBILEU', 11125125131,85987984007);
INSERT INTO cliente VALUES(NULL,'DANIEL', 56132115124,56432156135);

INSERT INTO ANIMAL VALUES(NULL,"REX",2,'PINCHEY',2);
INSERT INTO ANIMAL VALUES(NULL,"PITOLOMBEU",1,'PITBULL',3);
INSERT INTO ANIMAL VALUES(NULL,"SARAPITEU",8,'PUDLLOU',1);
INSERT INTO ANIMAL VALUES(NULL,"PIRUSCO",9,'YORKSHIRE',5);
INSERT INTO ANIMAL VALUES(NULL, "NEVINHA",10,"HUSK",4);

INSERT INTO PRODUTO VALUES(NULL,"RACAO",15.90);
INSERT INTO PRODUTO VALUES(NULL,"RACAO FILHOTES",18.30);
INSERT INTO PRODUTO VALUES(NULL,"CASA DE TRANSPORTE",52.00);
INSERT INTO PRODUTO VALUES(NULL,"VACINA",9.65);
INSERT INTO PRODUTO VALUES(NULL,"REMEDIO PARA DOR",23.00);
INSERT INTO PRODUTO VALUES(NULL,"SHAMPOO",10.00);
INSERT INTO PRODUTO VALUES(NULL,"VASILHAS PARA COMIDA",13.50);
INSERT INTO PRODUTO VALUES(NULL,"VASILHA PARA AGUA",12.50);
INSERT INTO PRODUTO VALUES(NULL,"ESCOLA PARA GATOS",12.50);
INSERT INTO PRODUTO VALUES(NULL,"ESCOVA PARA CACHORROS",12.50);

INSERT INTO veterinario VALUES(NULL, "MANOEL", 251214,2020-10-1,131);
INSERT INTO veterinario VALUES(NULL, "ANDRE", 252214,2020-7-2,1123);
INSERT INTO veterinario VALUES(NULL, "CARLOS", 253314,2020-6-3,1789);
INSERT INTO veterinario VALUES(NULL, "MARCOS", 254414,2020-8-6,1255);
INSERT INTO veterinario VALUES(NULL, "CARLA", 251554,2020-9-8,1231);

INSERT INTO CONSULTA VALUES(NULL,1,5);
INSERT INTO CONSULTA VALUES(NULL,3,1);
INSERT INTO CONSULTA VALUES(NULL,2,2);
INSERT INTO CONSULTA VALUES(NULL,4,4);
INSERT INTO CONSULTA VALUES(NULL,5,3);
