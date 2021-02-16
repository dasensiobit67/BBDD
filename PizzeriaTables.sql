CREATE DATABASE DBPizza CHARACTER SET utf8;
USE  DBPizza;

CREATE TABLE provincia (
  idprovincia integer,
  nom varchar(255),
  PRIMARY KEY (idprovincia)
);

CREATE TABLE localitat (
  idlocalitat integer,
  nom varchar(255),
  idprovincia integer,
  PRIMARY KEY (idlocalitat)
);

CREATE TABLE client (
  idclient integer,
  nom varchar(255),
  cognom varchar(255),
  adreca varchar(255),
  codipostal varchar(255),
  telefon varchar(255),
  idlocalitat integer,
  PRIMARY KEY (idclient),
  FOREIGN KEY (idlocalitat) REFERENCES  localitat (idlocalitat)
);

CREATE TABLE botiga (
  idbotiga integer,
  nom varchar(255),
  adreca varchar(255),
  codipostal varchar(255),
  idlocalitat integer,  
  PRIMARY KEY (idbotiga),
  FOREIGN KEY (idlocalitat) REFERENCES  localitat (idlocalitat)
);

CREATE TABLE empleat (
  idempleat integer,
  nom varchar(255),
  cognom varchar(255),
  nif varchar(255),
  telefon varchar(255),
  cuinorep boolean,
  idbotiga integer,
  PRIMARY KEY (idempleat),
  FOREIGN KEY (idbotiga) REFERENCES  botiga (idbotiga)
);

CREATE TABLE categoria (
  idcategoria integer,
  nom varchar(255),
  PRIMARY KEY (idcategoria)
);


CREATE TABLE producte (
  idproducte integer,
  nom varchar(255),
  descripcio varchar(255),
  imatge varchar(255),
  preu integer,
  idcategoria integer,
  PRIMARY KEY (idproducte),
  FOREIGN KEY (idcategoria) REFERENCES  categoria (idcategoria)
);

CREATE TABLE comanda (
  idcomanda integer,
  datahoracomanda datetime,
  domoboti boolean,
  datahoraentrega datetime,
  cant integer,
  total integer,
  idempleat integer,
  idclient integer,
  idproducte integer,
  PRIMARY KEY (idcomanda),
  FOREIGN KEY (idempleat) REFERENCES  empleat (idempleat),
  FOREIGN KEY (idclient) REFERENCES  client (idclient),
  FOREIGN KEY (idproducte) REFERENCES  producte (idproducte)
);