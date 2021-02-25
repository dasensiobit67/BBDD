CREATE SCHEMA IF NOT EXISTS youtube;
USE youtube;

CREATE TABLE IF NOT EXISTS usuario (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  username VARCHAR(50) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  sexo ENUM('H', 'M') NOT NULL DEFAULT 'M',
  pais VARCHAR(25) NOT NULL,
  codigo_postal VARCHAR(5) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX (email ASC),
  UNIQUE INDEX (username ASC));

CREATE TABLE IF NOT EXISTS video (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_usuario INT UNSIGNED NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  descripcion VARCHAR(1024) NOT NULL,
  tamanyo INT UNSIGNED NOT NULL,
  nombre_archivo VARCHAR(50) NOT NULL,
  duracion TIME NOT NULL,
  thumbnail VARCHAR(512) NOT NULL,
  reproducciones INT UNSIGNED NOT NULL DEFAULT 0,
  likes INT UNSIGNED NOT NULL DEFAULT 0,
  dislikes INT UNSIGNED NOT NULL DEFAULT 0,
  estado ENUM('Publico', 'Privado', 'Oculto') NOT NULL DEFAULT 'Publico',
  fecha_publicacion DATETIME NOT NULL,
  PRIMARY KEY (id),
  INDEX (id_usuario ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id));

CREATE TABLE IF NOT EXISTS etiqueta (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX (nombre ASC));

CREATE TABLE IF NOT EXISTS video_tiene_etiqueta (
  id_video INT UNSIGNED NOT NULL,
  id_etiqueta INT UNSIGNED NOT NULL,
  PRIMARY KEY (id_video, id_etiqueta),
  INDEX (id_etiqueta ASC),
  CONSTRAINT 
    FOREIGN KEY (id_video)
    REFERENCES video (id),
  CONSTRAINT 
    FOREIGN KEY (id_etiqueta)
    REFERENCES etiqueta (id));

CREATE TABLE IF NOT EXISTS canal (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_usuario INT UNSIGNED NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(1024) NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  PRIMARY KEY (id),
  INDEX (id_usuario ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id));

CREATE TABLE IF NOT EXISTS usuario_suscribe_canal (
  id_usuario INT UNSIGNED NOT NULL,
  id_canal INT UNSIGNED NOT NULL,
  PRIMARY KEY (id_usuario, id_canal),
  INDEX (id_canal ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id),
  CONSTRAINT 
    FOREIGN KEY (id_canal)
    REFERENCES canal (id));

CREATE TABLE IF NOT EXISTS usuario_valora_video (
  id_usuario INT UNSIGNED NOT NULL,
  id_video INT UNSIGNED NOT NULL,
  valoracion ENUM('Like', 'Dislike') NOT NULL,
  fecha_hora DATETIME NOT NULL,
  PRIMARY KEY (id_usuario, id_video),
  INDEX (id_video ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id),
  CONSTRAINT 
    FOREIGN KEY (id_video)
    REFERENCES video (id));

CREATE TABLE IF NOT EXISTS playlist (
  id INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  id_usuario INT UNSIGNED NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  fecha_creacion DATE NOT NULL,
  estado ENUM('Publica', 'Privada') NOT NULL DEFAULT 'Publica',
  PRIMARY KEY (id),
  INDEX (id_usuario ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id));

CREATE TABLE IF NOT EXISTS playlist_contiene_video (
  id_playlist INT UNSIGNED  NOT NULL,
  id_video INT UNSIGNED  NOT NULL,
  PRIMARY KEY (id_playlist, id_video),
  INDEX (id_video ASC),
  CONSTRAINT 
    FOREIGN KEY (id_playlist)
    REFERENCES playlist (id),
  CONSTRAINT 
    FOREIGN KEY (id_video)
    REFERENCES video (id));


CREATE TABLE IF NOT EXISTS video_relacionado (
  id_video INT UNSIGNED  NOT NULL,
  id_video_relacionado INT UNSIGNED  NOT NULL,
  PRIMARY KEY (id_video, id_video_relacionado),
  INDEX (id_video_relacionado ASC),
  CONSTRAINT 
    FOREIGN KEY (id_video)
    REFERENCES video (id),
  CONSTRAINT 
    FOREIGN KEY (id_video_relacionado)
    REFERENCES video (id));

CREATE TABLE IF NOT EXISTS comentario (
  id INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  id_usuario INT UNSIGNED  NOT NULL,
  id_video INT UNSIGNED  NOT NULL,
  texto VARCHAR(2048) NOT NULL,
  fecha_hora DATETIME NOT NULL,
  PRIMARY KEY (id),
  INDEX (id_usuario ASC),
  INDEX (id_video ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id),
  CONSTRAINT 
    FOREIGN KEY (id_video)
    REFERENCES video (id));

CREATE TABLE IF NOT EXISTS usuario_valora_comentario (
  id_usuario INT UNSIGNED  NOT NULL,
  id_comentario INT UNSIGNED  NOT NULL,
  valoracion ENUM('Like', 'Dislike') NOT NULL,
  fecha_hora DATETIME NOT NULL,
  PRIMARY KEY (id_usuario, id_comentario),
  INDEX (id_comentario ASC),
  CONSTRAINT 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id),
  CONSTRAINT 
    FOREIGN KEY (id_comentario)
    REFERENCES comentario (id));