function logRequest(req,res,next){
    console.log('ruta: '+req.originalUrl);
    console.log('tipo: '+req.method);
    next();
}

module.exports={logRequest};