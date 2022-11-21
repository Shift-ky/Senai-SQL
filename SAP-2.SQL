/*Considere a seguinte informação sobre a base de dados de uma universidade: 
 • Os professores têm um número de contribuinte, um nome, uma idade, um posto,
    e uma especialidade de investigação. 
 • Existem projetos que têm um número, um organismo financiador, uma data de início,
    uma data de final,e um orçamento. 
 • Os estudantes de pós-graduação têm um número de contribuinte, um nome, uma idade, 
    e um curso (ex. mestrado, doutoramento). 
 • Cada projeto é gerido por um professor (pesquisador principal do projeto).
 • Cada projeto tem a participação de um ou mais professores.
 • Os professores podem gerir e/ou trabalhar em vários projetos. 
 • Cada projeto tem um ou mais estudantes de pós-graduação (conhecidos como os assistentes 
    de pesquisa). 
 • Os estudantes podem trabalhar em vários projetos com supervisores eventualmente diferentes. 
 • Sempre que um estudante de pós-graduação trabalha num projeto, terá que existir um professor a
    supervisionar esse trabalho. 
 • Os departamentos têm um número, um nome, e um escritório principal. 
 • Os departamentos são liderados por um professor. 
 • Os professores podem trabalhar num ou mais departamentos. Associada a cada uma destas funções está
uma percentagem do seu tempo. 
 • Os estudantes de pós-graduação estão associados a um departamento no qual fazem o seu curso. 
 • Cada estudante de pós-graduação tem outro estudante mais velho que é o seu aconselhador.*/

 CREATE DATABASE FACUDADE;

 USE FACUDADE;

 CREATE TABLE PROJETO(
    ID_PROJETO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NUMERO_PROJETO INT,
    FINANCIADOR_PROJETO VARCHAR(100),
    DATA_INICIO_PROJETO DATE,
    DATA_FIM_PROJETO DATE,
    ORCAMENTO FLOAT
 );

 CREATE TABLE PROFESSOR_PROJETO(
    ID_PROFESSOR_PROJETO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    PROFESSOR_ID INT,
    PROJETO_ID INT
 );

 CREATE TABLE PROFESSOR_PESQUISADOR(
    ID_PROFESSOR_PESQUISADOR INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(100),
    PROJETO_ID INT
 );

 CREATE TABLE PROFESSOR(
    ID_PROFESSOR INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NUMERO_CONTRIBUINTE INT,
    NOME VARCHAR(100),
    IDADE INT,
    POSTO VARCHAR(20),
    ESPECIALIDADE VARCHAR(30),
    ESTUDANTE_ID INT
 );

 CREATE TABLE ESTUDANTE(
    ID_ESTUDANTE INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NUMERO_CONTRIBUINTE INT,
    NOME_ESTUDANTE VARCHAR(100),
    IDADE_ESTUDANTE INT,
    CURSO VARCHAR(100),
    ALUNO_ID INT,
    CURSO_ID INT
 );

 CREATE TABLE PROJETO_ESTUDANTE(
    ID_PROJETO_ESTUDANTE INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    PROJETO_ID INT,
    ESTUDANTE_ID INT
    );

    
 CREATE TABLE DEPARTAMENTO(
    ID_DEPARTAMENTO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NUMERO INT,
    NOME VARCHAR(100),
    ESCRITORIO_PRINCIPAL VARCHAR(50),
    PROFESSOR_ID INT
 );
 CREATE TABLE CURSO(
    ID_CURSO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NOME_CURSO VARCHAR(50),
    DEPARTAMENTO_ID INT
 );
 CREATE TABLE ALUNO(
    ID_ALUNO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(50)
 );

 ALTER TABLE PROFESSOR_PESQUISADOR ADD FOREIGN KEY(PROJETO_ID)
 REFERENCES PROJETO(ID_PROJETO);

 ALTER TABLE PROFESSOR ADD FOREIGN KEY(ESTUDANTE_ID)
 REFERENCES ESTUDANTE(ID_ESTUDANTE);

 ALTER TABLE PROFESSOR_PROJETO ADD FOREIGN KEY(PROJETO_ID)
 REFERENCES PROJETO(ID_PROJETO);

 ALTER TABLE PROFESSOR_PROJETO ADD FOREIGN KEY(PROFESSOR_ID)
 REFERENCES PROFESSOR(ID_PROFESSOR);

 ALTER TABLE PROJETO_ESTUDANTE ADD FOREIGN KEY(PROJETO_ID)
 REFERENCES PROFESSOR(ID_PROFESSOR);

 ALTER TABLE PROJETO_ESTUDANTE ADD FOREIGN KEY (ESTUDANTE_ID)
 REFERENCES ESTUDANTE(ID_ESTUDANTE);

 ALTER TABLE ESTUDANTE ADD FOREIGN KEY(ALUNO_ID)
 REFERENCES ALUNO(ID_ALUNO);

 ALTER TABLE ESTUDANTE ADD FOREIGN KEY(CURSO_ID)
 REFERENCES CURSO(ID_CURSO);

 ALTER TABLE CURSO ADD FOREIGN KEY(DEPARTAMENTO_ID)
 REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO);

 ALTER TABLE DEPARTAMENTO ADD FOREIGN KEY(PROFESSOR_ID)
 REFERENCES PROFESSOR(ID_PROFESSOR);