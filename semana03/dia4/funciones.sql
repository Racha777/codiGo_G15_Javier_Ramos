--Funciones
DROP FUNCTION IF EXISTS fn_contar_cursos;
DELIMITER $$

CREATE FUNCTION fn_contar_cursos(alumnoId INT)
    RETURNS INT UNSIGNED
BEGIN
    DECLARE total INT UNSIGNED;

    SELECT count(*) into total
    from tbl_matricula_curso mc
    INNER JOIN tbl_matricula m on mc.matricula_id=m.matricula_id
    WHERE alumno_id=alumnoId;

    RETURN total;
END
$$

DELIMITER ;

SELECT fn_contar_cursos(1);
select alumno_nombre,fn_contar_cursos(alumno_id)
from tbl_alumno