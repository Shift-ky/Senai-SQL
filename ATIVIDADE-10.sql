/*O objetivo é desenvolver um modelo de dados para um hospital veterinário.
Cada cliente pode possuir um ou vários animais em tratamento. Cada animal 
pode estar sofrendo de uma ou várias enfermidades. Os casos mais simples 
são resolvidos, geralmente, por um único veterinário, entretanto podem 
ocorrer casos em que um animal é atendido por mais de um veterinário.*/

CREATE DATABASE HOSPITAL_VETERINARIO;

USE HOSPITAL_VETERINARIO;

CREATE TABLE CLIENTE(
    idCliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeCliente VARCHAR(100),
    id_endereco int
);

CREATE TABLE TELEFONE(
    idTelefone INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    telefone VARCHAR(20),
    id_cliente INT
);

CREATE TABLE ENDERECO(
    idEndereco INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rua VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    numero int,
    cep VARCHAR(8),
    complemento VARCHAR(100),
    pontoReferencia VARCHAR(100)
);

CREATE TABLE ANIMAL(
    idAnimal INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeAnimal VARCHAR(50),
    pesoAnimal float,
    idadeAnimal int,
    id_cliente int,
    id_tipo_aninmal int,
    id_tipo_raca int
);

CREATE TABLE TIPO_ANIMAL(
    idTipoAnimal INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipoAnimal VARCHAR(50)
);

CREATE TABLE RACA_ANIMAL(
    idRacaAnimal INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    racaAnimal VARCHAR(50)

);

CREATE TABLE ENFERMIDADE(
    idEnfermidade INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeEnfermidade VARCHAR(50),
    descricaoEnfermidade VARCHAR(150)
);

CREATE TABLE VETERINARIO(
    idVeterinario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    crmv VARCHAR(10) NOT NULL UNIQUE,
    nomeVeterinario VARCHAR(50),
    telefoneVeterinario VARCHAR(50)
);

CREATE TABLE ANIMAL_VETERINARIO(
    idAnimalVeterinario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_veterinario int,
    id_animal int
);

CREATE TABLE CONSULTA(
    idConsulta INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data_consulta DATE,
    descricaoConsulta VARCHAR(250),
    id_animal int,
    id_veterinario int,
    id_enfermidade int
);

ALTER TABLE CLIENTE ADD FOREIGN KEY(id_endereco)
REFERENCES ENDERECO(idEndereco);

ALTER TABLE TELEFONE ADD FOREIGN KEY(id_cliente)
REFERENCES CLIENTE(idCliente);

ALTER TABLE ANIMAL ADD FOREIGN KEY(id_cliente)
REFERENCES CLIENTE(idCliente);

ALTER TABLE ANIMAL ADD FOREIGN KEY(id_tipo_aninmal)
REFERENCES TIPO_ANIMAL(idTipoAnimal);

ALTER TABLE ANIMAL ADD FOREIGN KEY(id_tipo_raca)
REFERENCES RACA_ANIMAL(idRacaAnimal);

ALTER TABLE ANIMAL_VETERINARIO ADD FOREIGN KEY(id_veterinario)
REFERENCES VETERINARIO(idVeterinario);

ALTER TABLE ANIMAL_VETERINARIO ADD FOREIGN KEY(id_animal)
REFERENCES ANIMAL(idAnimal);

ALTER TABLE CONSULTA ADD FOREIGN KEY(id_animal)
REFERENCES ANIMAL(idAnimal);

ALTER TABLE CONSULTA ADD FOREIGN KEY(id_veterinario)
REFERENCES VETERINARIO(idVeterinario);

ALTER TABLE CONSULTA ADD FOREIGN KEY(id_enfermidade)
REFERENCES ENFERMIDADE(idEnfermidade);

