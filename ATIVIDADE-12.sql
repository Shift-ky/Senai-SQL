/* -> Uma pequena locadora de vídeos possui cerca de 2.000 DVDs, cujo
    empréstimo deve ser controlado. Cada DVD possui um número. Para
    cada filme, é nescessário saber seu título e sua categoria(comédia,
    drama, aventura,...).
   -> Cada filme recebe um identificador próprio. Para cada DVD é
    controlado que fique ele contém. Para cada filme há pelo menos um
    DVD. Alguns poucos filmes nescessitam de mais de um DVD.
   -> Os clientes podem desejar encontrar os filmes estrelados pelo seu
    ator predileto. Por isso é nescessário manter  informação dos autores
    que atuam em cada filme. Os clientes às vezes, desejam receber
    referências de determinado ator, tais como o nome real a data de 
    nascimento etc.
   -> A locadora possui muitos clientes cadastrados. Somente clientes
    cadastrados podem alugar DVDs. Para cada cliente é nescessário
    saber seu pré-nome e seu sobrenome, seu telefone e seu endereço.
    Além disso, cada cliente recebe um número de associado.
   -> Finalmente, desejamos saber quais DVDs estão locados por um dado
    cliete. Um cliente pode locar vários DVDs ao mesmo tempo. Não
    são mantidos registro Históricos de aluguéis.

 */
CREATE DATABASE LOCADORA;
USE LOCADORA;

CREATE TABLE CLIENTE(
    numero INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    preNome VARCHAR(20),
    sobrenome VARCHAR(20),
    telefone VARCHAR(20),
    endereco VARCHAR(100)
);

CREATE TABLE DVD(
    NUMERO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CLIENTE_ID INT
);

CREATE TABLE FILME(
    ID_FILME INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    TITULO VARCHAR(20),
    CATEGORIA_ID INT,
    ATOR_ID INT
);

CREATE TABLE CATEGORIA(
    CODIGO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(20)
);
CREATE TABLE ATOR(
    CODIGO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NOME_POPULAR VARCHAR(50),
    NOME_ARTISTICO VARCHAR(50),
    DATA_NACIMENTO DATE
);
CREATE TABLE FILMES_ATOR(
    ID_FILMES_ATOR INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ATOR_ID INT,
    FILME_ID INT
);

ALTER TABLE DVD ADD CONSTRAINT FK_DVD FOREIGN KEY(CLIENTE_ID)
REFERENCES CLIENTE(NUMERO);

ALTER TABLE FILME ADD CONSTRAINT FK_FILME_CATEGORIA FOREIGN KEY(CATEGORIA_ID)
REFERENCES CATEGORIA(CODIGO);

ALTER TABLE FILMES_ATOR ADD CONSTRAINT FK_FILMES_ATOR FOREIGN KEY(ATOR_ID)
REFERENCES ATOR(CODIGO);

ALTER TABLE FILMES_ATOR ADD CONSTRAINT FK_FILMES_FILME FOREIGN KEY(FILME_ID)
REFERENCES FILME(ID_FILME);