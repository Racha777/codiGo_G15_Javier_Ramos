const {Profesor,ProfesorSchema}=require('./profesor.models');
const {Alumno,AlumnoSchema}=require('./alumno.model');
const {Matricula,MatriculaSchema}=require('./matricula.models');

function setupModels(sequelize){
    Profesor.init(ProfesorSchema,Profesor.config(sequelize));
    Alumno.init(AlumnoSchema,Alumno.config(sequelize));
    Matricula.init(MatriculaSchema,Matricula.config(sequelize));

    Alumno.associate(sequelize.models);
    Matricula.associate(sequelize.models);
}

module.exports=setupModels;