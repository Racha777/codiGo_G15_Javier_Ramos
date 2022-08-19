require('dotenv').config();

const config = {
    port : process.env.PORT || 5000,
    mongoUri : process.env.MONGOURI || 'mongodb://localhost:27017/db-modadevs',
    cloudinary :{
        cloud_name: process.env.CLOUDINARY_CLOUD_NAME, 
        api_key: process.env.CLOUDINARY_API_KEY, 
        api_secret: process.env.CLOUDINARY_API_SECRET 
    },
    mysql:{
        host: process.env.MYSQL_HOST || 'localhost',
        user: process.env.MYSQL_USER || 'root',
        pwd: process.env.MYSQL_PWD || '',
        db: process.env.MYSQL_DB || 'db_modadevs'
    },
    google :{
        clientId : process.env.GOOGLE_CLIENT_ID,
        clientSecret :  process.env.GOOGLE_CLIENT_SECRET
    }
}

module.exports = {config}