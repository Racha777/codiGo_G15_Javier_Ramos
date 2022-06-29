--Operaciones CRUD
--Read
SELECT * FROM alumno;
SELECT nombre,pais FROM alumno;
select distinct pais from alumno;
select * FROM alumno where pais='Peru';
SELECT * from alumno WHERE id=7;
--Create
INSERT Into alumno(nombre,email,pais) VALUES('Ernesto Chang','753@gmail.com','Chile');
ALTER TABLE alumno add COLUMN Nota int not null default 0;
INSERT into alumno(nombre,email,pais,nota) VALUES('Alvaro Chang','852@gmail.com','Brazil',15);
insert into alumno(nombre) VALUES('Esteban Chang'),('Jenny Chang'),('Jimmy Chang');

--Update
UPDATE alumno set nota=11 where id =1;
update alumno
set email=CONCAT(lower(replace(nombre,' ','_')),'@codigo.edu.pe')
--select nombre,email,CONCAT(lower(replace(nombre,' ','_')),'@codigo.edu.pe')
--FROM alumno
where email IS NULL;

--DElete
DELETE FROM alumno WHERE id=6;
INSERT INTO alumno(id,nombre,email) VALUES (6,'Shriley Chang','784@gmail.com');
truncate TABLE alumno;