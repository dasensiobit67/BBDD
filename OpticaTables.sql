CREATE DATABASE mydb CHARACTER SET utf8;
USE  mydb;

CREATE TABLE  Proveedor (
 idProveedor INT NOT NULL AUTO_INCREMENT,
 Nombre VARCHAR(45) NOT NULL,
 Direccion VARCHAR(150) NOT NULL,
 Telefono VARCHAR(12) NOT NULL,
 Fax VARCHAR(20) NOT NULL,
 NIF VARCHAR(10) NOT NULL,
 PRIMARY KEY (idProveedor),
 UNIQUE INDEX  idProveedor_UNIQUE(idProveedor)
 );

CREATE TABLE  Gafas (
 idGafas  INT NOT NULL AUTO_INCREMENT,
 Marca  VARCHAR(45) NOT NULL,
 GraduacionIzq  VARCHAR(5) NOT NULL,
 GraduacionDcha  VARCHAR(5) NOT NULL,
 Montura  VARCHAR(45) NOT NULL,
 ColorMontura  VARCHAR(45) NOT NULL,
 ColorCristal  VARCHAR(45) NOT NULL,
 Precio  INT NOT NULL,
 idProveedor INT NOT NULL,
 PRIMARY KEY ( idGafas ),
 FOREIGN KEY (idProveedor) REFERENCES  Proveedor (idProveedor)
 );


CREATE TABLE  Cliente (
  idCliente  INT NOT NULL AUTO_INCREMENT,
  Nombre  VARCHAR(45) NOT NULL,
  Direccion  VARCHAR(150) NOT NULL,
  Telefono  VARCHAR(15) NULL,
  Email  VARCHAR(45) NULL,
  FechaRegistro  DATE NOT NULL,
  Recomendado  INT NULL,
  PRIMARY KEY ( idCliente ) 
  );
 
CREATE TABLE   Empleado (
  idEmpleado  INT NOT NULL AUTO_INCREMENT,
  Nombre  VARCHAR(45) NOT NULL,
  PRIMARY KEY ( idEmpleado )
  );
 
CREATE TABLE   Venta (
  idVenta  INT NOT NULL AUTO_INCREMENT,
  idCliente int not null,
  idGafas int not null,
  idEmpleado int not null,
  PRIMARY KEY ( idVenta ),
  FOREIGN KEY (idCliente) REFERENCES  Cliente (idCliente),
  FOREIGN KEY (idGafas) REFERENCES  Gafas (idGafas),
  FOREIGN KEY (idEmpleado) REFERENCES  Empleado (idEmpleado)
  );
