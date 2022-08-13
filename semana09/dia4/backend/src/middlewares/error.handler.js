function errorHandler(err,req,res,next){
    res.status(500).json({
        status:false,
        content:err.message,
        stack:err.stack
    })
}

module.exports={errorHandler};