//const MysqlLib = require('../lib/mysql');

const boom = require('@hapi/boom');

const {models} = require('../lib/sequelize');

class AlumnoService{

    constructor(){
        //this.sql = new MysqlLib();
    }

    async getAll(){
        //const sqlAll = "select alumno_id,alumno_nombre,alumno_email from tbl_alumno";
        //const result = await this.sql.querySql(sqlAll);
        const result = await models.Alumno.findAll();
        return result;
    }

    async create(alumno){
        /*const sqlCreate = `insert into tbl_alumno(alumno_nombre,alumno_email) 
                          values ('${alumno.nombre}','${alumno.email}')`;

        await this.sql.querySql(sqlCreate);
        const sqlAlumnoCreado = "select * from tbl_alumno order by alumno_id desc limit 1";
        const result = await this.sql.querySql(sqlAlumnoCreado);
        return result;*/

        const nuevoAlumno = await models.Alumno.create(alumno);
        return nuevoAlumno
        
    }

    async getById(id){
        /*const sqlGetById = `select * from tbl_alumno where alumno_id = ${id}`;
        const result = await this.sql.querySql(sqlGetById);
        return result;*/
        const data = await models.Alumno.findByPk(id);
        if(!data){
            throw boom.notFound('data no existe');
        }
        return data;
    }

    async update(id,data){
        /*const sqlUpdate = `update tbl_alumno set
                          alumno_nombre = '${data.nombre}'
                          ,alumno_email = '${data.email}' 
                          where alumno_id = '${id}'
                          `;

        await this.sql.querySql(sqlUpdate);
        const sqlAlumnoActualizado = `select * from tbl_alumno where alumno_id = '${id}'`;
        const result = await this.sql.querySql(sqlAlumnoActualizado);
        return result;*/
        console.log(data);
        const alumno = await this.getById(id);
        const resultado = await alumno.update(data);
        return resultado;
    }

    async delete(id){
        /*const sqlDeleteAlumno = `delete from tbl_alumno where alumno_id = '${id}'`;
        await this.sql.querySql(sqlDeleteAlumno);
        return true;*/
        const alumno = await this.getById(id);
        await alumno.destroy();
        return true;
    }


}

module.exports = AlumnoService;