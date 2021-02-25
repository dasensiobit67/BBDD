CREATE SCHEMA IF NOT EXISTS spotify;
USE spotify;

CREATE TABLE IF NOT EXISTS usuario (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(128) NOT NULL,
  email VARCHAR(50) NOT NULL,
  pais VARCHAR(50) NOT NULL,
  codigo_postal VARCHAR(15) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  sexo ENUM('H', 'M') NOT NULL,
  tipo_usuario ENUM('Free', 'Premium') NOT NULL DEFAULT 'Free',
  PRIMARY KEY (id),
  UNIQUE INDEX (username ASC),
  UNIQUE INDEX (email ASC));

CREATE TABLE IF NOT EXISTS premium (
  id INT UNSIGNED NOT NULL,
  fecha_renovacion DATE NOT NULL,
  tipo_pago ENUM('TC', 'PayPal') NOT NULL,
  numero_tarjeta VARCHAR(16) NOT NULL,
  mes_caducidad TINYINT(2) UNSIGNED ZEROFILL NOT NULL,
  anyo_caducidad YEAR NOT NULL,
  codigo_seguridad SMALLINT(3) UNSIGNED ZEROFILL NOT NULL,
  username_paypal VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX (numero_tarjeta ASC),
  CONSTRAINT 
    FOREIGN KEY (id)
    REFERENCES usuario (id));

CREATE TABLE IF NOT EXISTS pago (
  numero_orden INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_usuario INT UNSIGNED NOT NULL,
  fecha DATE NOT NULL,
  total FLOAT NOT NULL,
  PRIMARY KEY (numero_orden),
  INDEX (id_usuario ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES premium (id));

CREATE TABLE IF NOT EXISTS playlist (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_usuario INT UNSIGNED NOT NULL,
  titulo VARCHAR(128) NOT NULL,
  numero_canciones SMALLINT UNSIGNED NOT NULL,
  fecha_creacion DATE NOT NULL,
  tipo_playlist ENUM('Eliminada', 'Activada') NOT NULL,
  fecha_eliminacion DATE NOT NULL,
  es_compartida TINYINT NOT NULL,
  PRIMARY KEY (id),
  INDEX (id_usuario ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id));

CREATE TABLE IF NOT EXISTS artista (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(128) NOT NULL,
  imagen VARCHAR(255) NOT NULL,
  PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS relacionado (
  id_artista INT UNSIGNED NOT NULL,
  id_artista_relacionado INT UNSIGNED NOT NULL,
  PRIMARY KEY (id_artista, id_artista_relacionado),
  INDEX (id_artista_relacionado ASC),
  CONSTRAINT 
    FOREIGN KEY (id_artista)
    REFERENCES artista (id),
  CONSTRAINT 
    FOREIGN KEY (id_artista_relacionado)
    REFERENCES artista (id));

CREATE TABLE IF NOT EXISTS album (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_artista INT UNSIGNED NOT NULL,
  anyo YEAR NOT NULL,
  titulo VARCHAR(128) NOT NULL,
  imagen VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  INDEX (id_artista ASC),
  CONSTRAINT 
    FOREIGN KEY (id_artista)
    REFERENCES artista (id));

CREATE TABLE IF NOT EXISTS cancion (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_album INT UNSIGNED NOT NULL,
  titulo VARCHAR(128) NOT NULL,
  duracion TIME NOT NULL,
  numero_reproducciones INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  INDEX (id_album ASC),
  CONSTRAINT 
    FOREIGN KEY (id_album)
    REFERENCES album (id));

CREATE TABLE IF NOT EXISTS anade (
  id_usuario INT UNSIGNED NOT NULL,
  id_playlist INT UNSIGNED NOT NULL,
  id_cancion INT UNSIGNED NOT NULL,
  fecha DATE NOT NULL,
  PRIMARY KEY (id_usuario, id_playlist, id_cancion),
  INDEX (id_playlist ASC),
  INDEX (id_cancion ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id),
  CONSTRAINT 
    FOREIGN KEY (id_playlist)
    REFERENCES playlist (id),
  CONSTRAINT 
    FOREIGN KEY (id_cancion)
    REFERENCES cancion (id));

CREATE TABLE IF NOT EXISTS sigue_artista (
  id_usuario INT UNSIGNED NOT NULL,
  id_artista INT UNSIGNED NOT NULL,
  PRIMARY KEY (id_usuario, id_artista),
  INDEX (id_artista ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id),
  CONSTRAINT 
    FOREIGN KEY (id_artista)
    REFERENCES artista (id));

CREATE TABLE IF NOT EXISTS guarda_album (
  id_usuario INT UNSIGNED NOT NULL,
  id_album INT UNSIGNED NOT NULL,
  PRIMARY KEY (id_usuario, id_album),
  INDEX (id_album ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id),
  CONSTRAINT 
    FOREIGN KEY (id_album)
    REFERENCES album (id));

CREATE TABLE IF NOT EXISTS guarda_cancion (
  id_usuario INT UNSIGNED NOT NULL,
  id_cancion INT UNSIGNED NOT NULL,
  PRIMARY KEY (id_usuario, id_cancion),
  INDEX (id_cancion ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id),
  CONSTRAINT 
    FOREIGN KEY (id_cancion)
    REFERENCES cancion (id));