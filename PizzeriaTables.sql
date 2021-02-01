CREATE TABLE client (
  idclient integer,
  nom varchar(255),
  cognon varchar(255),
  adreca varchar(255),
  codipostal varchar(255),
  telefon varchar(255),
  idlocalitat integer
);

CREATE TABLE producte (
  idproducte integer,
  nom varchar(255),
  descripcio varchar(255),
  imatge varchar(255),
  preu integer,
  idcategoria integer
);

CREATE TABLE categoria (
  idcategoria integer,
  nom varchar(255)
);

CREATE TABLE empleat (
  idempleat integer,
  nom varchar(255),
  cognom varchar(255),
  nif varchar(255),
  telefon varchar(255),
  cuinorep boolean,
  idbotiga integer
);

CREATE TABLE comanda (
  idcomanda integer,
  datahoracomanda datetime,
  domoboti boolean,
  datahoraentrega datetime,
  cant integer,
  total integer,
  idbotiga integer,
  idclient integer,
  idproducte integer
);

CREATE TABLE botiga (
  idbotiga integer,
  nom varchar(255),
  adreca varchar(255),
  codipostal varchar(255),
  idlocalitat integer
);

CREATE TABLE provincia (
  idprovincia integer,
  nom varchar(255)
);

CREATE TABLE localitat (
  idlocalitat integer,
  nom varchar(255),
  idprovincia integer
);

ALTER TABLE provincia ADD FOREIGN KEY (idprovincia) REFERENCES localitat (idprovincia);

ALTER TABLE localitat ADD FOREIGN KEY (idlocalitat) REFERENCES botiga (idlocalitat);

ALTER TABLE comanda ADD FOREIGN KEY (idclient) REFERENCES client (idclient);

ALTER TABLE comanda ADD FOREIGN KEY (idproducte) REFERENCES producte (idproducte);

ALTER TABLE botiga ADD FOREIGN KEY (idbotiga) REFERENCES comanda (idbotiga);

ALTER TABLE producte ADD FOREIGN KEY (idcategoria) REFERENCES categoria (idcategoria);

ALTER TABLE botiga ADD FOREIGN KEY (idbotiga) REFERENCES empleat (idbotiga);
