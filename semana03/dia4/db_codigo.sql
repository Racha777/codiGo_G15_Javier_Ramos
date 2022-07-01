--poblado de datos
--ALUMNO
insert into tbl_alumno(alumno_nombre,alumno_email)
VALUES
('César Mayta','cesarmayta@gmail.com'),
('Susana Perez','susanaperez@hotmail.com'),
('Claudia Loza','claudialoza@yahoo.com'),
('Anibal Ruiz','anibalruiz@gmail.com'),
('Jorge Contreras','jorgecontreras@gmail.com');

-- CURSO
insert into tbl_curso(curso_nombre)
VALUES
('HTML Y CSS'),('JAVASCRIPT'),('REACT.JS'),('PYTHON'),('MYSQL'),('FLASK');

--EVALUACIONES
insert into tbl_evaluacion(evaluacion_nombre)
VALUES
('PROYECTO CURSO');

--MODULO
insert into tbl_modulo(modulo_nombre)
VALUES
('FRONT END'),('BACKEND');

--NIVEL
insert into tbl_nivel(nivel_nombre)
VALUES
('BASICO'),('AVANZADO');