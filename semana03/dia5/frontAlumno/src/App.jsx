import React,{Component, component}from 'react';
import axios from 'axios';

class App extends Component{
  constructor(props){
    super(props);
    this.state=({
      alumnos:[]
    })
  }

  componentDidMount(){
    axios.get('http://localhost:5000/alumno')
    .then(res=>{
      console.log(res.data.content);
      this.setState({
        alumnos:res.data.content
      })
    })
  }

  render(){
    return(
      <div>
        <h1>Relacion de alumnos</h1>
        <table border="1">
          <tr>
            <th>nombre</th>
            <th>email</th>
          </tr>
        {this.state.alumnos.map((alu)=>{
          return(
              <tr key={alu.id}>
                <td>{alu.nombre}</td>
                <td>{alu.email}</td>
              </tr>
            )
          })}
        </table>
      </div>
    )
  }
}

export default App;