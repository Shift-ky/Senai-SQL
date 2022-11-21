create database sap;

use sap;

create table candidates (
  id            int primary key not null,
  nome          varchar(50),
  email         varchar(50),
  created_at    time,
  updated_at    time
);

insert into candidates values
  (1,   'John Snow','john@snow',now()+'1 seconds', now()+'1 seconds'),
  (2,   'Bob Ross','bob@ross',now()+'2 seconds', now()+'2 seconds'),
  (3,   'Kim Possible','kim@possible', now()+'3 seconds', now()+'3 seconds'),
  (4,   'Ash Ketchum','ash@ketchum',  now()+'4 seconds', now()+'4 seconds'),
  (5,   'Goku Son','goku@son',now()+'5 seconds', now()+'5 seconds'),
  (6,   'Mortimer Smith','morty@smh',now()+'6 seconds', now()+'6 seconds');

create table jobs (
  id            int primary key not null,
  title         varchar(50),
  positions     int,
  created_at    time,
  updated_at    time
);

insert into jobs values
  (1,   'Night Watch Commander',    1,      now()+'11 seconds',    now()+'11 seconds'),
  (2,   'Pokemon Master',           8,      now()+'12 seconds',    now()+'12 seconds'),
  (3,   'Blessed Painter',          100,    now()+'13 seconds',    now()+'13 seconds');

create table applications (
  id            int primary key not null,
  candidate_id  int not null,
  job_id        int not null,
  score         decimal,
  created_at    time,
  updated_at    time
 
);
 
alter table applications add foreign key(candidate_id)
references candidates(id);

alter table applications add foreign key(job_id)
references jobs(id);

insert into applications values
  (1,   1,  1,  90,  now()+'21 seconds', now()+'21 seconds'),
  (2,   1,  3,  80,  now()+'22 seconds', now()+'22 seconds'),
  (3,   2,  1,  10,  now()+'23 seconds', now()+'23 seconds'),
  (4,   2,  2,  10,  now()+'24 seconds', now()+'24 seconds'),
  (5,   2,  3,  99,  now()+'25 seconds', now()+'25 seconds'),
  (6,   3,  1,  60,  now()+'26 seconds', now()+'26 seconds'),
  (7,   3,  2,  70,  now()+'27 seconds', now()+'27 seconds'),
  (8,   3,  3,  50,  now()+'28 seconds', now()+'28 seconds'),
  (9,   4,  2,  90,  now()+'29 seconds', now()+'29 seconds'),
  (10,  5,  1,  9000,now()+'30 seconds', now()+'30 seconds');


    select  nome, j.title, score from jobs as j
    inner join applications
    on job_id = j.id
    inner join candidates as c
    on c.id = candidate_id
    group by 1
    having max(scores);


/*correção da sap*/

atividade - 1

select nome, count(nome) as "count" from candidates as c
left join applications
on candidate_id = c.id
group by nome
having count < 3
order by count desc;


atividade - 3
select title, count(case when score > 25 then 1 else null end) as over25,
              count(case when score > 50 then 1 else null end) as over50,
              count(case when score > 75 then 1 else null end) as over75
from applications inner join jobs on jobs.id = applications.job_id
group by title order by jobs.positions DESC;

/*===================================================================================================================================*/

create database db_procedure;

USE db_procedure;

CREATE TABLE FACULDADE(
    ID INT AUTO_INCREMENT,
    NOME varchar(45),
    EMAIL VARCHAR(50),
    LOCALIZACAO VARCHAR(45),
    primary KEY(ID)

);



/*===================================================================================================================================*/

/*CRIAR*/
CREATE PROCEDURE CAD_FACUDADE(NOME VARCHAR(45),EMAIL VARCHAR(45),LOCALIZACAO VARCHAR(45))
BEGIN
    INSERT INTO FACULDADE(NOME,EMAIL,LOCALIZACAO) VALUES(NOME,EMAIL,LOCALIZACAO); 
END
#

/*SELEÇÃO*/

CREATE PROCEDURE CAD_SELECT()
BEGIN
    SELECT * FROM FACULDADE; 
END
#

/*DELETAR*/
CREATE PROCEDURE CAD_DELETE(IDS INT)
BEGIN
    DELETE FROM FACULDADE
    WHERE ID = IDS;
END
#

/*update*/
CREATE PROCEDURE CAD_update(ids int, nome varchar(50), email varchar(50), LOCALIZACAO varchar(50))
BEGIN
    UPDATE faculdade 
    set nome = nome, email = email , LOCALIZACAO = LOCALIZACAO where id = ids;
END
#

/*===================================================================================================================================*/
select * from
UPDATE faculdade 
set nome ='gabi'
where id = 10;



CALL CAD_SELECT();

CALL CAD_FACUDADE('GABI','GABI@GMAIL.COM','CAUCAIA');
CALL CAD_FACUDADE('ICARO','ICARO@GMAIL.COM','CAUCAIA');
CALL CAD_FACUDADE('FELINA','FELINA@GMAIL.COM','CAUCAIA');
CALL CAD_FACUDADE('JARED','JARED@GMAIL.COM','CAUCAIA');

DROP PROCEDURE CAD_FACUDADE;

delete from faculdade
where id = 10;




CALL CAD_DELETE(7);


SELECT * FROM FACULDADE
WHERE ID = 2;


DROP PROCEDURE CAD_DELETE();





CALL CAD_update(10,'narcos','narcos@gmail.com','fortaleza');

call CAD_DELETE(12);
CALL CAD_SELECT();

create table aluno(
    id int primary key  AUTO_INCREMENT,
    nome  varchar(30),
    cidade varchar(45),
    faculdade_id int,

    foreign key(faculdade_id)
    references faculdade(id)


);

/*CRIAR*/
CREATE PROCEDURE CAD_FACUDADE(NOME VARCHAR(45),EMAIL VARCHAR(45),LOCALIZACAO VARCHAR(45))
BEGIN
    INSERT INTO aluno(NOME,cidade,) VALUES(NOME,EMAIL,LOCALIZACAO); 
END
#

/*SELEÇÃO*/

CREATE PROCEDURE SELECT_aluno()
BEGIN
    SELECT * FROM FACULDADE; 
END
#

/*DELETAR*/
CREATE PROCEDURE DELETE_aluno(IDS INT)
BEGIN
    DELETE FROM FACULDADE
    WHERE ID = IDS;
END
#

/*update*/
CREATE PROCEDURE update_aluno(ids int, nome varchar(50), email varchar(50), LOCALIZACAO varchar(50))
BEGIN
    UPDATE faculdade 
    set nome = nome, email = email , LOCALIZACAO = LOCALIZACAO where id = ids;
END
#
