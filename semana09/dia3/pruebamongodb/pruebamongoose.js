const mongoose=require('mongoose');
//const Schema=mongoose.Schema;

async function main(){
    //conexion a mongodb
    await mongoose.connect('mongodb://localhost:27017/db-mongoose');

    //crear Schema (equivalente a una tabla)
    const PeliculaSchema=new mongoose.Schema({
        nombre:String,
        fecha:{type:Date,default:Date.now},
        rating:{type:Number,required:[true,'necesita un rating']}
    });

    const Pelicula=mongoose.model('col_pelicula',PeliculaSchema);

    const drama=new Pelicula({nombre:'Los Chotanos',rating:10});
    await drama.save();
    //const pelicula2=new Pelicula({nombre:'Rapidos y furiosos 5'});
    //await pelicula2.save();

    const listadoPeliculas=await Pelicula.find();
    console.log(listadoPeliculas)
}

main().catch(error=>console.log(error));