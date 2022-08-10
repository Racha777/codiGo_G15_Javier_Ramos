const {Profesor,ProfesorSchema}=require('./profesor.models');

function setupModels(sequelize){
    Profesor.init(ProfesorSchema,Profesor.config(sequelize))
}

module.exports=setupModels;