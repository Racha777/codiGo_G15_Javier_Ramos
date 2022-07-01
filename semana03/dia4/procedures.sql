-- Active: 1656462099096@@127.0.0.1@3306@db_codigo
--Ejemplo de procedimiento almacenado
DELIMITER $$
CREATE PROCEDURE listar_alumnos()
BEGIN
    SELECT * FROM tbl_alumno;
END
$$

DELIMITER ;

CALL listar_alumnos();

--Trabajo con bucles y condicionales
DELIMITER $$

CREATE PROCEDURE ejemplo_bucle(IN tope INT, OUT suma INT UNSIGNED)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    SET suma = 0;

    bucle: LOOP
        IF contador>tope THEN
            LEAVE bucle;
        END IF;

        SET suma=suma+contador;
        SET contador=contador+1;
    END LOOP;
END
$$

DELIMITER ;

CALL ejemplo_bucle(10,@resultado);
SELECT @resultado;

--Procedimientos tipo
DELIMITER $$

DROP PROCEDURE IF EXISTS sp_matricular_alumno $$
CREATE PROCEDURE sp_matricular_alumno(IN alu_id INT, IN niv_id INT, IN mod_id INT)
BEGIN
    --variables
    DECLARE matriculaId INT;
    DECLARE cursoId INT;
    DECLARE totalCursos INT;
    SET matriculaId=0;
    SET cursoId=1;
    SET totalCursos=0;

    --Insertar datos
    insert INTO tbl_matricula(alumno_id,nivel_id,modulo_id)
    values(alu_id,niv_id,mod_id);

    SELECT max(matricula_id) INTO matriculaId from tbl_matricula;

    SELECT count(*) into totalCursos from tbl_curso;

    WHILE cursoId<=totalCursos DO
        INSERT INTO tbl_matricula_curso(matricula_id,curso_id)
        values (matriculaId,cursoId);

        SET cursoId = cursoId + 1;
    END WHILE;
END
$$

DELIMITER ;
CALL sp_matricular_alumno(1,1,1);

select * from tbl_matricula;
select * from tbl_matricula_curso;