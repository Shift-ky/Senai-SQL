/*1. Construa um banco de dados para uma clínica. Nesta clínica,
	deverão ser cadastrados todos os médicos, além de suas especialidades.
	Mesmo que o médico possua mais de uma especialidade, ele deverá escolher apenas uma delas para trabalhar na clínica. Todos os pacientes
	também deverão ser cadastrados com todos os seus dados. Os dados das
	consultas deverão ser armazenados também no banco de dados: a data
	em que a consulta aconteceu, o médico que atendeu o paciente, bem
	como o diagnóstico feito pelo médico.

2. 

	A partir do banco de dados da questão anterior e utilizando a linguagem
	SQL, responda as questões:
	
	-> Altere a tabela médico, adicionando a coluna “nome_conjuge”.
	-> Insira, pelo menos, dois registros em cada uma das tabelas. 
	-> Delete um registro da tabela especialidade. Obs.: mantenha a integridade referencial.*/
	

/*CREANDO O BANCO DE DADOS*/	
CREATE DATABASE CLINICA;

/*CONECTANDO COM O BANCO DE DADOS*/
use clinica;

/*CRIANDO AS TABELAS DO BANCO*/
CREATE TABLE medicos(
	idMedico INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	especialidade VARCHAR(100) NOT NULL,
	dtAdmisao DATE
);
CREATE TABLE paciente(
	idPaciente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(15) UNIQUE NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	endereco VARCHAR(150) NOT NULL
);

CREATE TABLE CONSULTA(
	idConsulta INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	dataConsulta TIMESTAMP NOT NULL,
	diagnostico VARCHAR(250),
	id_medico INT
	
);
CREATE TABLE especialidade(
	idEspecialidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

/*COLOCANDO AS CHAVES ESTRANGEIRAS*/
ALTER TABLE consulta ADD FOREIGN KEY(id_medico)
REFERENCES medicos(idMedico);

ALTER TABLE consulta ADD FOREIGN KEY(id_paciente)
REFERENCES paciente(idPaciente);

/*ADICIONANDO A TABELA CONJUGE*/
ALTER TABLE medicos ADD nome_conjuge VARCHAR(50);

/*ADICIONANDO DOIS REGISTROS EM CADA TABELA*/
/* MEDICOS */
INSERT INTO medicos VALUES(NULL,"Manoel Bezerra","Clinico Geral",25-12-2001,"Maria Joaquina"),
(NULL,"Marcos Bezerra","Neuro Cirurgião",20-12-2000,"Fernanda Bezerra");

/*PACIENTE*/
INSERT INTO paciente VALUES(NULL,"Silvaniele Paiva","123.456.789.11","(85) 9 0909-4132","RUA 220, 300, METROPOLE, CAUCAIA, 61765-080");

INSERT INTO paciente VALUES(NULL,"ROBSON PAIVA","321.456.789.11","(85) 9 9090-4132","RUA 220, 300, METROPOLE, CAUCAIA, 61765-080");

/*CONSULTA*/

INSERT INTO consulta VALUES(NULL,25-12-2020,"PACIENTE COM DOR DE CABEÇA",1,2),
(NULL,25-12-2020,"PACIENTE COM DOR DE CABEÇA",2,1);

/*ESPECIALIDADE*/
INSERT INTO especialidade(nome) VALUES('Pediatria');
INSERT INTO especialidade(nome) VALUES('Clinico Geral');

DELETE FROM especialidade WHERE idEspecialidade =2; 