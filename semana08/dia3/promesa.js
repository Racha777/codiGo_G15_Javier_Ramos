function hola(nombre){
    return new Promise(function(resolve,reject){
        setTimeout(function(){
            console.log('hola '+nombre);
            resolve(nombre);
            reject('Hay un error');
        },1000)
    });
}

function hablar(nombre){
    return new Promise((res,rej)=>{
        console.log('como estas '+nombre);
        res(nombre);
        rej('No te entiendo');
    },1000)
}

let nom='Javier'

hola(nom)
    .then(hablar)
    .then(()=>{
        console.log('adios');
    })