/*Considere a descrição de um sistema de venda de passagens aéreas dadaabaixo e desenhe um diagrama ER de acordo com as seguintes informações:
* Para um passageiro são registrados o número do documento de identidade e
o seu nome.
* Um avião é caracterizado por um número de série único e por um modelo.
* Um assento é uma posição única em um avião, identificada por um código.
Um assento é da classe econômica ou executiva.
* Um avião possui vários assentos e pode ser usado em vários vôos.
* Um vôo é identificado por um número e utiliza: um avião, um piloto, um
aeroporto de partida e outro de chegada.
* Um passageiro pode reservar um assento em um vôo
*/
/*CRIANDO O BANCO DE DADOS*/
CREATE DATABASE passagens;
/*CONECTANDO NO BANCO DE DADOS*/
USE passagens;
/*CRIANDO AS TABELAS*/
CREATE TABLE PASSAGEIRO(
    idPassageiro INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cpf VARCHAR(15) NOT NULL UNIQUE,
    nome VARCHAR(100)
);

CREATE TABLE PASSAGEIROS_VOOS(
    idPassageirosVoos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_passageiro int,
    id_voos int
);

CREATE TABLE VOOS(
    idVoo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    aviao VARCHAR(255),
    piloto VARCHAR(100),
    id_aviao INT,
    id_piloto INT,
    id_aeroporto_partida INT,
    id_aeroporto_chegada INT
);

CREATE TABLE PILOTO(
    idPiloto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomePiloto VARCHAR(100)
);

CREATE TABLE ASSENTO(
    idAcento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    codigoAcento INT NOT NULL UNIQUE,
    id_classe INT,
    id_voo INT
);

CREATE TABLE AVIAO(
    idAviao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    numeroSerie INT UNIQUE,
    modelo VARCHAR(100),
    id_modelo INT
);

CREATE TABLE AEROPORTO(
    idAeroporto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeAeroporto VARCHAR(100),
    enderecoAeroporto VARCHAR(100),
    telefoneAeroporto VARCHAR(20)
);

CREATE TABLE CLASSE(
    idClasse INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeClasse VARCHAR(55),
    descClasse VARCHAR(55)
);

CREATE TABLE MODELO(
    idModelo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    modelO VARCHAR(55)
);

/*ADICIONANDO AS CHAVES ESTRANGEIRAS*/
ALTER TABLE PASSAGEIROS_VOOS ADD FOREIGN KEY(id_passageiro)
REFERENCES PASSAGEIRO(idPassageiro);

ALTER TABLE PASSAGEIROS_VOOS ADD FOREIGN KEY(id_voos)
REFERENCES VOOS(idVoo);

ALTER TABLE VOOS ADD FOREIGN KEY(id_aviao)
REFERENCES AVIAO(idAviao);

ALTER TABLE VOOS ADD FOREIGN KEY(id_piloto)
REFERENCES PILOTO(idPiloto);

ALTER TABLE VOOS ADD FOREIGN KEY(id_aeroporto_partida)
REFERENCES AEROPORTO(idAeroporto);

ALTER TABLE VOOS ADD FOREIGN KEY(id_aeroporto_chegada)
REFERENCES AEROPORTO(idAeroporto);

ALTER TABLE ASSENTO ADD FOREIGN KEY(id_classe)
REFERENCES CLASSE(idClasse);

ALTER TABLE ASSENTO ADD FOREIGN KEY(id_voo)
REFERENCES VOOS(idVoo);


