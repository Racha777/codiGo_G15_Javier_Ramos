--Funciones de agrupacion
select COUNT(*) FROM alumno;
SELECT sum(nota) FROM alumno;
select avg(nota) FROM alumno;
select min(nota),max(nota) FROM alumno;
select min(pais),max(pais) FROM alumno;
select max(id) from alumno;
select pais,count(*) as cantidad from alumno
GROUP BY pais
ORDER BY count(*) DESC;
select pais,AVG(nota) as promedio,min(nota) as notaMinima,MAX(nota) as notaMaxima from alumno
GROUP BY pais
HAVING AVG(nota)<10 --WHERE para group by
ORDER by AVG(nota) DESC;
select pais,AVG(nota) as promedio,min(nota) as notaMinima,MAX(nota) as notaMaxima from alumno
where nota>10 --Filtro por registro
GROUP BY pais
Having AVG(nota)<16 --filtro por group by
ORDER by AVG(nota) DESC;