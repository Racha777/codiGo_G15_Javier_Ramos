const os=require('os');
/*
procesador=os.arch();
sistemaoperativo=os.platform();
cpu=os.cpus().length
memoria=os.totalmem();

console.log("arquitectura del procesador : "+procesador);
console.log("sistema operativo : "+sistemaoperativo);
console.log("CPU : "+cpu);
console.log("Memoria RAM : "+memoria);
memoria=memoria/1024;
console.log("Memoria RAM en KB : "+memoria);
memoria=memoria/1024;
console.log("Memoria RAM en MB : "+memoria);
memoria=memoria/1024;
console.log("Memoria RAM en GB : "+memoria);
*/
//Reto 1. crear una funcion con promesas que retorne la memoria en KB, MB y GB
function calcularMemoria(capacidad,tipo){
    return new Promise((res,rej)=>{
        let memoria_convertida=capacidad/1024;
        console.log("memoria en "+tipo+" : "+memoria_convertida.toFixed(2));
        res(memoria_convertida);
    })
}

calcularMemoria(os.totalmem(),'KB')
    .then((kb)=>calcularMemoria(kb,'MB'))
    .then((mb)=>calcularMemoria(mb,'GB'))

//Otra forma

async function memoria(capacidad){
    capacidad_convertida=capacidad/1024;
    return capacidad_convertida.toFixed(2);
}

async function main(){
    console.log("Memoria RAM usando async await");
    kb=await memoria(os.totalmem());
    mb=await memoria(kb);
    gb=await memoria(mb);

    console.table([
        {
            capacidad: 'KB',tam:kb
        },
        {
            capacidad: 'MB',tam:mb
        },
        {
            capacidad: 'GB',tam:gb
        },
    ])
}

main();