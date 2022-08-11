const {Model,DataTypes,Sequelize}=require('sequelize');

const {ALUMNO_TABLE}=require('./alumno.model');

const MATRICULA_TABLE='matricula';

const MatriculaSchema={
    id:{
        allowNull:false,
        autoIncrement:true,
        primaryKey:true,
        type:DataTypes.INTEGER,
        field:'matricula_id'
    },
    alumnoId:{
        field:'alumno_id',
        allowNull:false,
        type:DataTypes.INTEGER,
        references:{
            model:ALUMNO_TABLE,
            key:'alumno_id'
        },
        onUpdate:'CASCADE',
        onDelete:'SET NULL'
    }
}

class Matricula extends Model{
    static associate(models){
        this.belongsTo(models.Alumno,{as:'alumno'});
    }

    static config(sequelize){
        return{
            sequelize,
            tableName:MATRICULA_TABLE,
            modelName:'Matricula',
            timestamps:true
        }
    }
}

module.exports={MATRICULA_TABLE,MatriculaSchema,Matricula};