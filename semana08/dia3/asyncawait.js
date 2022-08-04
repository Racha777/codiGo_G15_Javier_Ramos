async function hola(nombre){
    return new Promise(function(resolve,reject){
        setTimeout(function(){
            console.log('hola '+nombre);
            resolve(nombre);
            reject('Hay un error');
        },1000)
    })
}

async function hablar(nombre){
    return new Promise((res,rej)=>{
        setTimeout(function(){
            console.log('como estas '+nombre);
            res(nombre);
            rej('no te escucho');
        },1000)
    })
}

async function adios(nombre){
    console.log('Adios '+nombre);
}

async function main(){
    let nombre=await hola('Javier');
    await hablar(nombre);
    await adios(nombre);
}

main();