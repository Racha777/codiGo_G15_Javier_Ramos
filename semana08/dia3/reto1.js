const os=require('os');

async function memoria(capacidad,unidad){
    return new Promise(function(resolve,reject){
        console.log("Memoria en "+unidad+": "+capacidad);
        resolve((capacidad/1024).toFixed(2));
        reject('No se pudo obtener la memoria');
    })
}

memoria(os.totalmem(),"bytes")
    .then((kb)=>memoria(kb,"Kb"))
    .then((Mb)=>memoria(Mb,"Mb"))
    .then((Gb)=>memoria(Gb,"Gb"))