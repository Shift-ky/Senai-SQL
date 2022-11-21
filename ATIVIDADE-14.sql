/*Construa um banco de dados para um sistema de controle e gerenciamento de  empréstimos de livros de uma biblioteca acadêmica 
conforme as características  abaixo: 
∙ A biblioteca dispõe de livros, também denominados títulos. Estes possuem  nome, autores e editoras. Cada título pertence a uma
	área de conhecimento  e possui um código único de identificação. 
∙ Cada título possui vários exemplares. Cada exemplar possue um código  único de identificação. 
∙ Cada título pode ter vários autores e um mesmo autor pode ter escrito vários títulos. Um autor possue código, nome, telefone e endereço. 
∙ As editoras possuem código, nome, telefone e endereço. 
∙ As áreas de conhecimento possuem código e uma descrição. 
∙ Usuários, que podem ser alunos, professores ou funcionários, tomam livros  emprestados por uma semana. A data de empréstimo 
	é importante no  processo. Cada usuário possui um código, nome, telefone e endereço. 
∙ Cada título possui várias palavras-chave e uma palavra-chave pode estar  ligada a vários títulos. Uma palavra-chave possui código e descrição.*/

/*CRIANDO O BANCO DE DADOS*/
CREATE DATABASE biblioteca;


/*CRIANDO AS TABELAS*/


CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	codigo INT(11) UNIQUE NOT NULL,
	nomeUsuario VARCHAR(255) NOT NULL,
	telefoneUsuario VARCHAR(20) NOT NULL,
	endereco VARCHAR(150) NOT NULL
);

CREATE TABLE emprestimo(
	idEmprestimo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	dataEmprestimo TIMESTAMP NOT NULL,
	dataDevolucao TIMESTAMP NOT NULL,
	id_usuario INT,
	id_exemplar INT
);

CREATE TABLE exemplares(
	idExemplar INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	codigo INT UNIQUE
);

CREATE TABLE titulos(
	idTitulo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	codigo INT UNIQUE NOT NULL,
	nome VARCHAR(255) NOT NULL,
	id_exemplares INT,
	id_area_conhecimento INT,
	id_editora INT
);

CREATE TABLE area_conhecimento(
	idAreaConhecimento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	codigo INT UNIQUE NOT NULL
);

CREATE TABLE titulo_palavra_chave(
	idTituloPalavraChave INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	id_titulo INT,
	id_palavra_chave INT
	
);

CREATE TABLE palavra_chave(
	idPalavraChave INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	codigo INT NOT NULL,
	descricao VARCHAR(300)
);

CREATE TABLE titulos_autores(
	idTituloAutores INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	id_titulo INT,
	id_autores INT
);

CREATE TABLE editora(
	idEditora INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	codigoEditora INT UNIQUE NOT NULL,
	nomeEditora VARCHAR(150) NOT NULL,
	telefoneEditora VARCHAR(150) NOT NULL,
	enderecoEditora VARCHAR(150) NOT NULL
);

CREATE TABLE autores(
	idAutor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	codigo INT UNIQUE NOT NULL,
	nomeAutor VARCHAR(100) NOT NULL,
	telefoneAutor VARCHAR(20) NOT NULL,
	endereco VARCHAR(155)
);

/*ADICIONANDO AS FOREIGN KEY*/

/*EMPRESTIMO*/
ALTER TABLE emprestimo ADD FOREIGN KEY(id_usuario)
REFERENCES usuario(idUsuario);


ALTER TABLE emprestimo ADD FOREIGN KEY(id_exemplar)
REFERENCES exemplares(idExemplar);

/*titulos*/

ALTER TABLE titulos ADD FOREIGN KEY(id_exemplares)
REFERENCES exemplares(idExemplar);


ALTER TABLE titulos ADD FOREIGN KEY(id_area_conhecimento)
REFERENCES area_conhecimento(idAreaConhecimento);


ALTER TABLE titulos ADD FOREIGN KEY(id_editora)
REFERENCES editora(idEditora);

/*titulo_palavra_chave*/

ALTER TABLE titulo_palavra_chave ADD FOREIGN KEY(id_titulo)
REFERENCES titulos(idTitulo);


ALTER TABLE titulo_palavra_chave ADD FOREIGN KEY(id_palavra_chave)
REFERENCES palavra_chave(idPalavraChave);

/*titulo_autores*/

ALTER TABLE titulos_autores ADD FOREIGN KEY(id_titulo)
REFERENCES titulos(idTitulo);


ALTER TABLE titulos_autores ADD FOREIGN KEY(id_autores)
REFERENCES autores(idAutor);



