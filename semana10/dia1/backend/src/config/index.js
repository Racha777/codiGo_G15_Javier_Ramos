require('dotenv').config();

const config={
    port:process.env.PORT||5000,
    mongoUri:process.env.MONGOURI||'mongodb://localhost:27017/db-modadevs'
}

module.exports={config};