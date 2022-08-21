import React from "react";
import NavBar from "../components/NavBar";
import Catalogo from "../components/Catalogo";

const Cursos=()=>{
    return(
        <div id="Wrapper">
            <NavBar/>
            <div class="page-spacer"></div>
            <Catalogo/>
        </div>
    )
}

export default Cursos;