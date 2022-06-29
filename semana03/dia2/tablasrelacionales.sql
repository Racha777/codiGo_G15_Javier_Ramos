-- Active: 1656462099096@@127.0.0.1@3306@cursos
create table curso(
    id int not NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL
);

CREATE Table nota(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    alumno_id INT NOT NULL,
    curso_id int NOT NULL,
    nota int DEFAULT 0,
    FOREIGN KEY(alumno_id) REFERENCES alumno(id),
    FOREIGN KEY(curso_id) REFERENCES curso(id)
);

insert into curso(nombre) values('HTML y CSS'),('JAVASCRIPT'),('REACT'),('PYTHON'),('FLASK'),('MYSQL');
insert into nota(alumno_id,curso_id,nota)
values
(1,1,11),(1,2,14),(1,3,15),(1,4,17),(1,5,20),(1,6,13),
(2,1,11),(2,2,11),(2,3,15),(2,4,17),(2,5,20),(2,6,13),
(3,1,15),(3,2,14),(3,3,15),(3,5,20),(3,6,13),
(4,1,13),(4,2,14),(4,3,15),(4,4,17),(4,5,20),(4,6,13),
(5,1,17),(5,2,14),(5,3,15),(5,4,17),(5,5,20),(5,6,13),
(6,1,16),(6,2,14),(6,4,17),(6,5,20),(6,6,13),
(7,1,11),(7,2,14),(7,3,15),(7,4,17),(7,5,20),(7,6,13),
(8,1,11),(8,2,14),(8,3,15),(8,4,17),(8,5,20),(8,6,13),
(9,1,16),(9,2,14),(9,3,15),(9,4,17),(9,5,20),
(10,1,15),(10,2,14),(10,3,15),(10,4,17),(10,5,20);

delete from alumno where id >15;