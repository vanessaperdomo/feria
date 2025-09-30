-- Crear la base de datos
CREATE DATABASE Evento_Actualizado;
GO

USE Evento_Actualizado;
GO

-- Tabla Feria
CREATE TABLE Feria(
  idFeria INT IDENTITY(1,1) PRIMARY KEY,
  nom_feria VARCHAR(100),
  ciudad VARCHAR(100),
  fecha_inicio DATE,
  fecha_fin DATE
);

-- Tabla Tematica
CREATE TABLE Tematica(
  idTematica INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100)
);

-- Tabla Pabellon
CREATE TABLE Pabellon(
  idPabellon INT IDENTITY(1,1) PRIMARY KEY,
  idFeria INT,
  idTematica INT,
  nombre VARCHAR(100),
  FOREIGN KEY(idFeria) REFERENCES Feria(idFeria),
  FOREIGN KEY(idTematica) REFERENCES Tematica(idTematica)
);

-- Tabla Empresa
CREATE TABLE Empresa(
  idEmpresa INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100)
);

-- Tabla Stand
CREATE TABLE Stand(
  idStand INT IDENTITY(1,1) PRIMARY KEY,
  idEmpresa INT,
  idPabellon INT,
  nombre VARCHAR(100),
  FOREIGN KEY(idEmpresa) REFERENCES Empresa(idEmpresa),
  FOREIGN KEY(idPabellon) REFERENCES Pabellon(idPabellon)
);

-- Tabla Persona
CREATE TABLE Persona(
  idPersona INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  dni VARCHAR(100),
  email VARCHAR(50),
  telefono VARCHAR(20)
);

-- Tabla Responsable
CREATE TABLE Responsable(
  idResponsable INT IDENTITY(1,1) PRIMARY KEY,
  idPersona INT,
  FOREIGN KEY(idPersona) REFERENCES Persona(idPersona)
);

-- Tabla Producto
CREATE TABLE Producto(
  idProducto INT IDENTITY(1,1) PRIMARY KEY,
  idStand INT,
  idResponsable INT,
  nombre VARCHAR(100),
  descripcion VARCHAR(MAX),
  FOREIGN KEY(idStand) REFERENCES Stand(idStand),
  FOREIGN KEY(idResponsable) REFERENCES Responsable(idResponsable)
);

-- Tabla Ponente
CREATE TABLE Ponente(
  idPonente INT IDENTITY(1,1) PRIMARY KEY,
  idPersona INT,
  FOREIGN KEY(idPersona) REFERENCES Persona(idPersona)
);

-- Tabla Charla
CREATE TABLE Charla(
   idCharla INT IDENTITY(1,1) PRIMARY KEY,
   idPonente INT,
   idEmpresa INT,
   titulo VARCHAR(100),
   descripcion VARCHAR(MAX),
   fecha_hora DATETIME2,
   FOREIGN KEY(idPonente) REFERENCES Ponente(idPonente),
   FOREIGN KEY(idEmpresa) REFERENCES Empresa(idEmpresa)
);

-- Tabla Demostracion
CREATE TABLE Demostracion(
    idDemostracion INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(100),
    descripcion VARCHAR(MAX)
);

-- Tabla TipoVisitante
CREATE TABLE TipoVisitante(
    idTipo INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(50)
);

-- Tabla Visitante
CREATE TABLE Visitante(
    idVisitante INT IDENTITY(1,1) PRIMARY KEY,
    idPersona INT,
    idTipo INT,
    FOREIGN KEY(idPersona) REFERENCES Persona(idPersona),
    FOREIGN KEY(idTipo) REFERENCES TipoVisitante(idTipo)
);

-- Tabla Registro
CREATE TABLE Registro(
    idRegistro INT IDENTITY(1,1) PRIMARY KEY,
    idVisitante INT,
    idCharla INT,
    idDemostracion INT,
    idFeria INT,
    FOREIGN KEY(idVisitante) REFERENCES Visitante(idVisitante),
    FOREIGN KEY(idCharla) REFERENCES Charla(idCharla),
    FOREIGN KEY(idDemostracion) REFERENCES Demostracion(idDemostracion),
    FOREIGN KEY(idFeria) REFERENCES Feria(idFeria)
);
