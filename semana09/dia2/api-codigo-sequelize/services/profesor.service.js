const sequelize=require('../lib/sequelize');
const boom=require('@hapi/boom');
const {models}=require('../lib/sequelize');

class ProfesorService{
    constructor(){

    }

    async getAll(){
        const result=await models.Profesor.findAll();

        return result;
    }

    async create(data){
        const nuevoProfesor=await models.Profesor.create(data);
        return nuevoProfesor;
    }

    async findOne(id){
        const data=await models.Profesor.findByPk(id);
        if(!data){
            throw boom.notFound('data no existe');
        }else{
            return data;
        }
    }

    async update(id,data){
        const profesor=await this.findOne(id);
        const resultado=await profesor.update(data);
        return resultado;
    }

    async delete(id){
        const profesor=await this.findOne(id);
        await profesor.destroy();
        return true;
    }

}

module.exports=ProfesorService;