const {Model,DataTypes,Sequelize}=require('sequelize');

const ALUMNO_TABLE='tbl_alumno';

const AlumnoSchema={
    id:{
        allowNull:false,
        autoIncrement:true,
        primaryKey:true,
        type:DataTypes.INTEGER,
        field:'alumno_id'
    },
    nombre:{
        allowNull:false,
        type:DataTypes.STRING,
        field:'alumno_nombre'
    },
    email:{
        allowNull:false,
        type:DataTypes.STRING,
        field:'alumno_email'
    }
}

class Alumno extends Model{
    static associate(models){
        this.hasMany(models.Matricula,{
            as:'matriculas',
            foreignKey:'alumnoId'
        })
    }

    static config(sequelize){
        return{
            sequelize,
            tableName:ALUMNO_TABLE,
            modelName:'Alumno',
            timestamps:false
        }
    }
}

module.exports={ALUMNO_TABLE,AlumnoSchema,Alumno};