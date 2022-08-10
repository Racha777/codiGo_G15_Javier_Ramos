import axios from 'axios';

const API_URL='http://localhost:5000'

class UsuarioService{
    create(usuario,password){
        return axios
        .post(API_URL+"/usuario",{
            usuario:usuario,
            password:password
        })
        .then(res=>{
            return res.data.content;
        })
    }
}

export default new UsuarioService();