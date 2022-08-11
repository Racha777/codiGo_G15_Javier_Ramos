const {MongoClient}=require('mongodb');

const url='mongodb://localhost:27017';
const client=new MongoClient(url);


async function main(){
    await client.connect();
    console.log('conectado a mongodb');
    
    const db=client.db('codigo-g15');
    const collection=db.collection('peliculas');

    const insertar=await collection.insertMany([{nombre:'Star Wars episodio 4'},{nombre:'Avatar 2'}]);
    console.log('documentos insertados:',insertar);
    const mostrar=await collection.find({}).toArray();
    console.log('mostrando peliculas: ',mostrar);
    return 'fin';
}

main()
.then(console.log)
.catch(console.error)
.finally(()=>client.close());