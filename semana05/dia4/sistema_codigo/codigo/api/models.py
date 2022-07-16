# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Alumno(models.Model):
    alumno_id = models.AutoField(primary_key=True)
    alumno_nombre = models.CharField(max_length=100)
    alumno_email = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_alumno'


class Curso(models.Model):
    curso_id = models.AutoField(primary_key=True)
    curso_nombre = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'tbl_curso'


class Evaluacion(models.Model):
    evaluacion_id = models.AutoField(primary_key=True)
    evaluacion_nombre = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'tbl_evaluacion'


class Matricula(models.Model):
    matricula_id = models.AutoField(primary_key=True)
    alumno = models.ForeignKey(Alumno, models.DO_NOTHING)
    nivel = models.ForeignKey('Nivel', models.DO_NOTHING)
    modulo = models.ForeignKey('Modulo', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'tbl_matricula'


class MatriculaCurso(models.Model):
    matricula_curso_id = models.AutoField(primary_key=True)
    matricula = models.ForeignKey(Matricula, models.DO_NOTHING)
    curso = models.ForeignKey(Curso, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'tbl_matricula_curso'


class MatriculaNota(models.Model):
    matricula_nota_id = models.AutoField(primary_key=True)
    matricula = models.ForeignKey(Matricula, models.DO_NOTHING)
    evaluacion = models.ForeignKey(Evaluacion, models.DO_NOTHING)
    matricula_nota_valor = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_matricula_nota'


class Modulo(models.Model):
    modulo_id = models.AutoField(primary_key=True)
    modulo_nombre = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'tbl_modulo'


class Nivel(models.Model):
    nivel_id = models.AutoField(primary_key=True)
    nivel_nombre = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'tbl_nivel'
