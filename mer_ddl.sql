CREATE DATABASE Evento_Actualizado;
USE Evento_Actualizado;

CREATE TABLE Feria(
  idFeria INT AUTO_INCREMENT PRIMARY KEY,
  nom_feria VARCHAR(100),
  ciudad VARCHAR(100),
  fecha_inicio DATE,
  fecha_fin DATE
);

CREATE TABLE Tematica(
  idTematica INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100)
);

CREATE TABLE Pabellon(
  idPabellon INT AUTO_INCREMENT PRIMARY KEY,
  idFeria INT,
  idTematica INT,
  nombre VARCHAR(100),
  FOREIGN KEY(idFeria) REFERENCES Feria(idFeria),
  FOREIGN KEY(idTematica) REFERENCES Tematica(idTematica)
);

CREATE TABLE Empresa(
  idEmpresa INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100)
);

CREATE TABLE Stand(
  idStand INT AUTO_INCREMENT PRIMARY KEY,
  idEmpresa INT,
  idPabellon INT,
  nombre VARCHAR(100),
  FOREIGN KEY(idEmpresa) REFERENCES Empresa(idEmpresa),
  FOREIGN KEY(idPabellon) REFERENCES Pabellon(idPabellon)
);

CREATE TABLE Persona(
  idPersona INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  dni VARCHAR(100),
  email VARCHAR(50),
  telefono VARCHAR(20)
);

CREATE TABLE Responsable(
  idResponsable INT AUTO_INCREMENT PRIMARY KEY,
  idPersona INT,
  FOREIGN KEY(idPersona) REFERENCES Persona(idPersona)
);

-- ✅ Ahora sí creamos Producto después de Responsable
CREATE TABLE Producto(
  idProducto INT AUTO_INCREMENT PRIMARY KEY,
  idStand INT,
  idResponsable INT,
  nombre VARCHAR(100),
  descripcion TEXT,
  FOREIGN KEY(idStand) REFERENCES Stand(idStand),
  FOREIGN KEY(idResponsable) REFERENCES Responsable(idResponsable)
);

CREATE TABLE Ponente(
  idPonente INT AUTO_INCREMENT PRIMARY KEY,
  idPersona INT,
  FOREIGN KEY(idPersona) REFERENCES Persona(idPersona)
);

CREATE TABLE Charla(
   idCharla INT AUTO_INCREMENT PRIMARY KEY,
   idPonente INT,
   idEmpresa INT,
   titulo VARCHAR(100),
   descripcion TEXT,
   fecha_hora DATETIME,
   FOREIGN KEY(idPonente) REFERENCES Ponente(idPonente),
   FOREIGN KEY(idEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Demostracion(
    idDemostracion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE TipoVisitante(
    idTipo INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50)
);

CREATE TABLE Visitante(
    idVisitante INT AUTO_INCREMENT PRIMARY KEY,
    idPersona INT,
    idTipo INT,
    FOREIGN KEY(idPersona) REFERENCES Persona(idPersona),
    FOREIGN KEY(idTipo) REFERENCES TipoVisitante(idTipo)
);

CREATE TABLE Registro(
    idRegistro INT AUTO_INCREMENT PRIMARY KEY,
    idVisitante INT,
    idCharla INT,
    idDemostracion INT,
    idFeria INT,
    FOREIGN KEY(idVisitante) REFERENCES Visitante(idVisitante),
    FOREIGN KEY(idCharla) REFERENCES Charla(idCharla),
    FOREIGN KEY(idDemostracion) REFERENCES Demostracion(idDemostracion),
    FOREIGN KEY(idFeria) REFERENCES Feria(idFeria)
);