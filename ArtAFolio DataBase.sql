-- -----------------------------------------------------
-- Table Persona
-- -----------------------------------------------------
CREATE TABLE ArtAFolio.Persona (
  idPersona INT NOT NULL, 
  Pnombre VARCHAR(45) NOT NULL, 
  Snombre VARCHAR(45) NULL, 
  Papellido VARCHAR(45) NOT NULL, 
  Sapellido VARCHAR(45) NULL, 
  email VARCHAR(45) NOT NULL, 
  telefono INT NULL, 
  fechaNacimiento DATE NOT NULL, 
  PRIMARY KEY (idPersona)
); -- -----------------------------------------------------
-- Table Usuarios
-- -----------------------------------------------------
CREATE TABLE ArtAFolio. Usuarios (
  idUsuario VARCHAR(15) NOT NULL, 
  idPersona INT NOT NULL, 
  perfiPhotoRuta VARCHAR(200) NULL, 
  Bibliografia VARCHAR(245) NULL, 
  Artist VARCHAR(1) NOT NULL, 
  PRIMARY KEY (idUsuario), 
  FOREIGN KEY (idPersona) REFERENCES ArtAFolio.Persona (idPersona)
); -- -----------------------------------------------------
-- Table Artes
-- -----------------------------------------------------
CREATE TABLE  ArtAFolio.Artes (
  idArte INT NOT NULL, 
  idUsuario VARCHAR(15) NOT NULL, 
  imgNombre VARCHAR(45) NOT NULL, 
  imgRuta VARCHAR(200) NOT NULL, 
  descripcion VARCHAR(100) NULL, 
  fecha DATE NOT NULL, 
  downloadPermision VARCHAR(1) NOT NULL, 
  IsAnimation VARCHAR(1) NULL, 
  PRIMARY KEY (idArte), 
  FOREIGN KEY (idUsuario) REFERENCES ArtAFolio.Usuarios (idUsuario)
); -- -----------------------------------------------------
-- Table Hashtags
-- -----------------------------------------------------
CREATE TABLE  ArtAFolio.Hashtags (
  idHashtag INT NOT NULL, 
  nombreHashtag VARCHAR(45) NOT NULL, 
  fechaCreacion DATE NOT NULL, 
  PRIMARY KEY (idHashtag)
); -- -----------------------------------------------------
-- Table Galerias
-- -----------------------------------------------------
CREATE TABLE  ArtAFolio.Galerias (
  idGaleria INT NOT NULL, 
  idUsuario VARCHAR(15) NOT NULL, 
  GaleriaNom VARCHAR(45) NOT NULL, 
  PRIMARY KEY (idGaleria), 
  FOREIGN KEY (idUsuario) REFERENCES ArtAFolio.Usuarios (idUsuario)
); -- -----------------------------------------------------
-- Table Usuarios_Seguidores
-- -----------------------------------------------------
CREATE TABLE  ArtAFolio.Usuarios_Seguidores (
  idUsuario VARCHAR(15) NOT NULL, 
  idSeguidor VARCHAR(15) NOT NULL, 
  fechaSeguimiento DATE NOT NULL, 
  Activo VARCHAR(1) NOT NULL, 
  PRIMARY KEY (idUsuario, idSeguidor), 
   FOREIGN KEY (idUsuario) REFERENCES ArtAFolio.Usuarios (idUsuario), 
 FOREIGN KEY (idSeguidor) REFERENCES ArtAFolio.Usuarios (idUsuario)
); -- -----------------------------------------------------
-- Table Redes
-- -----------------------------------------------------
CREATE TABLE  ArtAFolio.Redes (
  idRedes INT NOT NULL, 
  redSocialNombre VARCHAR(45) NOT NULL, 
  PRIMARY KEY (idRedes)
); -- -----------------------------------------------------
-- Table Likes
-- -----------------------------------------------------
CREATE TABLE  ArtAFolio.Likes (
  idArte INT NOT NULL, 
  idUsuario VARCHAR(15) NOT NULL, 
  fecha DATE NOT NULL, 
  PRIMARY KEY (idArte, idUsuario), 
   FOREIGN KEY (idArte) REFERENCES ArtAFolio.Artes (idArte), 
   FOREIGN KEY (idUsuario) REFERENCES ArtAFolio.Usuarios (idUsuario)
); -- -----------------------------------------------------
-- Table Comentarios
-- -----------------------------------------------------
CREATE TABLE  ArtAFolio.Comentarios (
  idComentario INT NOT NULL, 
  idUsuario VARCHAR(15) NOT NULL, 
  idArte INT NOT NULL, 
  textoComentario VARCHAR(245) NOT NULL, 
  Fecha DATE NOT NULL, 
  PRIMARY KEY (idComentario), 
  FOREIGN KEY (idUsuario) REFERENCES ArtAFolio.Usuarios (idUsuario), 
   FOREIGN KEY (idArte) REFERENCES ArtAFolio.Artes (idArte)
); -- -----------------------------------------------------
-- Table Galerias_Artes
-- -----------------------------------------------------
CREATE TABLE  ArtAFolio.Galerias_Artes (
  idGaleria INT NOT NULL, 
  idArte INT NOT NULL, 
  PRIMARY KEY (idGaleria, idArte), 
   FOREIGN KEY (idGaleria) REFERENCES ArtAFolio.Galerias (idGaleria), 
   FOREIGN KEY (idArte) REFERENCES ArtAFolio.Artes (idArte)
); -- -----------------------------------------------------
-- Table Usuarios_Redes
-- -----------------------------------------------------
CREATE TABLE  ArtAFolio.Usuarios_Redes (
  idUsuario VARCHAR(15) NOT NULL, 
  idRedes INT NOT NULL, 
  URL_Red VARCHAR(200) NOT NULL, 
  PRIMARY KEY (idUsuario, idRedes),  
  FOREIGN KEY (idUsuario) REFERENCES ArtAFolio.Usuarios (idUsuario), 
  FOREIGN KEY (idRedes) REFERENCES ArtAFolio.Redes (idRedes)
); -- -----------------------------------------------------
-- Table Hashtags_Artes
-- -----------------------------------------------------
CREATE TABLE  ArtAFolio.Hashtags_Artes (
  idHashtag INT NOT NULL, 
  idArte INT NOT NULL, 
  PRIMARY KEY (idHashtag, idArte), 
  FOREIGN KEY (idHashtag) REFERENCES ArtAFolio.Hashtags (idHashtag), 
  FOREIGN KEY (idArte) REFERENCES ArtAFolio.Artes (idArte)
);
