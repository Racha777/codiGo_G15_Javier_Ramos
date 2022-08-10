-- Active: 1659660533868@@127.0.0.1@3306@db_codigo_g15
DROP table tbl_usuario;
CREATE TABLE tbl_usuario(  
    usuario_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario_nombre VARCHAR(200) NOT NULL UNIQUE,
    usuario_password VARCHAR(200) NOT NULL
);

insert into tbl_usuario(usuario_nombre,usuario_password) values ('admin','admin');