-- ==============================================
-- 1. LIMPIEZA (borra lo viejo para evitar errores)
-- ==============================================
DROP SCHEMA IF EXISTS feria_schema CASCADE;
DROP SCHEMA IF EXISTS empresa_schema CASCADE;
DROP SCHEMA IF EXISTS visitante_schema CASCADE;

-- Borramos usuarios si existen (sin REASSIGN la primera vez)
DROP USER IF EXISTS user_feria;
DROP USER IF EXISTS user_empresa;
DROP USER IF EXISTS user_visitante;
DROP USER IF EXISTS user_admin;

-- ==============================================
-- 2. CREACIÓN DE USUARIOS
-- ==============================================
CREATE USER user_feria WITH PASSWORD 'feria123';
CREATE USER user_empresa WITH PASSWORD 'empresa123';
CREATE USER user_visitante WITH PASSWORD 'visitante123';
CREATE USER user_admin WITH PASSWORD 'admin123';

-- ==============================================
-- 3. CREACIÓN DE ESQUEMAS
-- ==============================================
CREATE SCHEMA feria_schema AUTHORIZATION user_feria;
CREATE SCHEMA empresa_schema AUTHORIZATION user_empresa;
CREATE SCHEMA visitante_schema AUTHORIZATION user_visitante;

-- ==============================================
-- 4. TABLAS EN CADA ESQUEMA
-- ==============================================

-- ===========================
-- ESQUEMA FERIA
-- ===========================
SET ROLE user_feria;

CREATE TABLE feria_schema.Feria(
   idFeria SERIAL PRIMARY KEY,
   nom_feria VARCHAR(100),
   ciudad VARCHAR(100),
   fecha_inicio DATE,
   fecha_fin DATE
);

CREATE TABLE feria_schema.Tematica(
   idTematica SERIAL PRIMARY KEY,
   nombre VARCHAR(100)
);

CREATE TABLE feria_schema.Pabellon(
   idPabellon SERIAL PRIMARY KEY,
   idFeria INT,
   idTematica INT,
   nombre VARCHAR(100),
   FOREIGN KEY(idFeria) REFERENCES feria_schema.Feria(idFeria),
   FOREIGN KEY(idTematica) REFERENCES feria_schema.Tematica(idTematica)
);

-- ===========================
-- ESQUEMA EMPRESA
-- ===========================
SET ROLE user_empresa;

CREATE TABLE empresa_schema.Empresa(
   idEmpresa SERIAL PRIMARY KEY,
   nombre VARCHAR(100)
);

CREATE TABLE empresa_schema.Stand(
   idStand SERIAL PRIMARY KEY,
   idEmpresa INT,
   idPabellon INT,
   nombre VARCHAR(100)
);

CREATE TABLE empresa_schema.Producto(
   idProducto SERIAL PRIMARY KEY,
   idStand INT,
   nombre VARCHAR(100),
   descripcion TEXT
);

-- ===========================
-- ESQUEMA VISITANTE
-- ===========================
SET ROLE user_visitante;

CREATE TABLE visitante_schema.Persona(
   idPersona SERIAL PRIMARY KEY,
   nombre VARCHAR(100),
   apellido VARCHAR(100),
   dni VARCHAR(100),
   email VARCHAR(50),
   telefono VARCHAR(20)
);

CREATE TABLE visitante_schema.Visitante(
   idVisitante SERIAL PRIMARY KEY,
   idPersona INT,
   tipo VARCHAR(50),
   FOREIGN KEY(idPersona) REFERENCES visitante_schema.Persona(idPersona)
);

CREATE TABLE visitante_schema.Registro(
   idRegistro SERIAL PRIMARY KEY,
   idVisitante INT,
   detalle VARCHAR(200),
   FOREIGN KEY(idVisitante) REFERENCES visitante_schema.Visitante(idVisitante)
);

RESET ROLE;

-- ==============================================
-- 5. PERMISOS
-- ==============================================
GRANT ALL PRIVILEGES ON SCHEMA feria_schema TO user_feria;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA feria_schema TO user_feria;

GRANT ALL PRIVILEGES ON SCHEMA empresa_schema TO user_empresa;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA empresa_schema TO user_empresa;

GRANT ALL PRIVILEGES ON SCHEMA visitante_schema TO user_visitante;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA visitante_schema TO user_visitante;

-- Admin con acceso total
GRANT ALL PRIVILEGES ON SCHEMA feria_schema TO user_admin;
GRANT ALL PRIVILEGES ON SCHEMA empresa_schema TO user_admin;
GRANT ALL PRIVILEGES ON SCHEMA visitante_schema TO user_admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA feria_schema TO user_admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA empresa_schema TO user_admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA visitante_schema TO user_admin;
