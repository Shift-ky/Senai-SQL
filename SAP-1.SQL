/*A companhia discográfica decidiu criar uma base de dados com informação sobre os seus músicos bem como
outra informação da companhia.
 A informação dada ao projetista a seguinte: 
• Cada músico tem um número, um nome, uma morada e um número de telefone. Os músicos em início de
carreira muitas vezes partilham um endereço e, além disso, assume-se que cada endereço só tem um
telefone. 
 • Cada instrumento usado nos estúdios tem um nome (ex. guitarra, bateria, etc.) e um código interno.
 • Cada disco gravado na companhia tem um título, uma data, um formato (ex. CD, MC, K7), e um identificador
do disco.
 • Cada música gravada na companhia tem um título e um autor.
 • Cada músico pode tocar vários instrumentos, e cada instrumento pode ser tocado por vários músicos. 
 • Cada disco tem certo número de músicas, mas cada música só pode aparecer num disco.
 • Cada música pode ter a participação de vários músicos, e cada músico pode participar em várias músicas. 
 • Cada disco tem um músico que é o seu produtor. Os músicos podem produzir vários discos
*/
CREATE DATABASE DISCOGRAFIA;

USE DISCOGRAFIA;

CREATE TABLE MUSICO(
    ID_MUSICO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NUMERO_MUSICO INT UNIQUE,
    NOME VARCHAR(50),
    TELEFONE VARCHAR(20)
);

CREATE TABLE INSTRUMENTO(
    ID_INSTRUMENTO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NOME_INTRUMENTO VARCHAR(50),
    GODIGO_INTERNO VARCHAR(30)
);

CREATE TABLE MUSICA(
    ID_MUSICA INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    TITULO VARCHAR(50),
    AUTOR VARCHAR(50),
    DISCO_ID INT UNIQUE
);

CREATE TABLE DISCO(
    ID_DISCO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    TITULO VARCHAR(50),
    DATA_GRAVACAO DATE,
    FORMATO VARCHAR(10),
    IDENTIFICADOR VARCHAR(10),
    MUSICO_ID INT
);
CREATE TABLE ENDERECO(
    ID_ENDERECO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ENDERECO VARCHAR(100),
    TELEFONE VARCHAR(20) UNIQUE
);
CREATE TABLE MUSICO_MUSICA(
    MUSICO_ID INT,
    MUSICA_ID INT
);
CREATE TABLE MUSICO_INSTRUMENTO(
    MUSICO_ID INT,
    INSTRUMENTO_ID INT
);
CREATE TABLE ENDERECO_MUSICO(
    MUSICO_ID INT,
    ENDERECO_ID INT
);

ALTER TABLE MUSICO_MUSICA ADD FOREIGN KEY(MUSICO_ID)
REFERENCES MUSICO(ID_MUSICO);

ALTER TABLE MUSICO_MUSICA ADD FOREIGN KEY(MUSICA_ID)
REFERENCES MUSICA(ID_MUSICA);

ALTER TABLE ENDERECO_MUSICO ADD FOREIGN KEY(ENDERECO_ID)
REFERENCES ENDERECO(ID_ENDERECO);

ALTER TABLE ENDERECO_MUSICO ADD FOREIGN KEY(MUSICO_ID)
REFERENCES MUSICO(ID_MUSICO);

ALTER TABLE MUSICO_INSTRUMENTO ADD FOREIGN KEY(MUSICO_ID)
REFERENCES MUSICO(ID_MUSICO);

ALTER TABLE MUSICO_INSTRUMENTO ADD FOREIGN KEY(INSTRUMENTO_ID)
REFERENCES INSTRUMENTO(ID_INSTRUMENTO);

ALTER TABLE MUSICA ADD FOREIGN KEY(DISCO_ID)
REFERENCES DISCO(ID_DISCO);

ALTER TABLE DISCO ADD FOREIGN KEY(MUSICO_ID)
REFERENCES MUSICO(ID_MUSICO);