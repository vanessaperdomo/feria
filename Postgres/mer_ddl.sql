CREATE TABLE Feria(
  idFeria SERIAL PRIMARY KEY,
  nom_feria VARCHAR(100),
  ciudad VARCHAR(100),
  fecha_inicio DATE,
  fecha_fin DATE
);

CREATE TABLE Tematica(
  idTematica SERIAL PRIMARY KEY,
  nombre VARCHAR(100)
);

CREATE TABLE Pabellon(
  idPabellon SERIAL PRIMARY KEY,
  idFeria INT,
  idTematica INT,
  nombre VARCHAR(100),
  FOREIGN KEY(idFeria) REFERENCES Feria(idFeria),
  FOREIGN KEY(idTematica) REFERENCES Tematica(idTematica)
);

CREATE TABLE Empresa(
  idEmpresa SERIAL PRIMARY KEY,
  nombre VARCHAR(100)
);

CREATE TABLE Stand(
  idStand SERIAL PRIMARY KEY,
  idEmpresa INT,
  idPabellon INT,
  nombre VARCHAR(100),
  FOREIGN KEY(idEmpresa) REFERENCES Empresa(idEmpresa),
  FOREIGN KEY(idPabellon) REFERENCES Pabellon(idPabellon)
);

CREATE TABLE Persona(
  idPersona SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  dni VARCHAR(100),
  email VARCHAR(50),
  telefono VARCHAR(20)
);

CREATE TABLE Responsable(
  idResponsable SERIAL PRIMARY KEY,
  idPersona INT,
  FOREIGN KEY(idPersona) REFERENCES Persona(idPersona)
);

CREATE TABLE Producto(
  idProducto SERIAL PRIMARY KEY,
  idStand INT,
  idResponsable INT,
  nombre VARCHAR(100),
  descripcion TEXT,
  FOREIGN KEY(idStand) REFERENCES Stand(idStand),
  FOREIGN KEY(idResponsable) REFERENCES Responsable(idResponsable)
);

CREATE TABLE Ponente(
  idPonente SERIAL PRIMARY KEY,
  idPersona INT,
  FOREIGN KEY(idPersona) REFERENCES Persona(idPersona)
);

CREATE TABLE Charla(
   idCharla SERIAL PRIMARY KEY,
   idPonente INT,
   idEmpresa INT,
   titulo VARCHAR(100),
   descripcion TEXT,
   fecha_hora TIMESTAMP,
   FOREIGN KEY(idPonente) REFERENCES Ponente(idPonente),
   FOREIGN KEY(idEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Demostracion(
    idDemostracion SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE TipoVisitante(
    idTipo SERIAL PRIMARY KEY,
    descripcion VARCHAR(50)
);

CREATE TABLE Visitante(
    idVisitante SERIAL PRIMARY KEY,
    idPersona INT,
    idTipo INT,
    FOREIGN KEY(idPersona) REFERENCES Persona(idPersona),
    FOREIGN KEY(idTipo) REFERENCES TipoVisitante(idTipo)
);

CREATE TABLE Registro(
    idRegistro SERIAL PRIMARY KEY,
    idVisitante INT,
    idCharla INT,
    idDemostracion INT,
    idFeria INT,
    FOREIGN KEY(idVisitante) REFERENCES Visitante(idVisitante),
    FOREIGN KEY(idCharla) REFERENCES Charla(idCharla),
    FOREIGN KEY(idDemostracion) REFERENCES Demostracion(idDemostracion),
    FOREIGN KEY(idFeria) REFERENCES Feria(idFeria)
);

