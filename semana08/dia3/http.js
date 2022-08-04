const http=require('http');

http.createServer(function(req,res){
    console.log('servidor web iniciado');
    console.log(req.url);

    switch(req.url){
        case '/hola':
            res.write('Estas en la pagina hola');
            res.end();
            break;
        default:
            res.write('<h1><center>Mi primer servidor web con nodeJS</center></h1>');
            res.end();
    }
}).listen(5000);