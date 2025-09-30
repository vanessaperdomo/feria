-- ==========================================
-- 0. Conectarse a la base de datos
-- ==========================================

-- ==========================================
-- 1. Crear esquemas
-- ==========================================
CREATE SCHEMA IF NOT EXISTS feria_schema;
CREATE SCHEMA IF NOT EXISTS empresa_schema;
CREATE SCHEMA IF NOT EXISTS visitante_schema;

-- ==========================================
-- 2. Crear roles
-- ==========================================
CREATE ROLE role_general WITH LOGIN PASSWORD 'PasswordGeneral123';
CREATE ROLE role_feria WITH LOGIN PASSWORD 'PasswordFeria123';
CREATE ROLE role_empresa WITH LOGIN PASSWORD 'PasswordEmpresa123';
CREATE ROLE role_visitante WITH LOGIN PASSWORD 'PasswordVisitante123';

-- ==========================================
-- 3. Mover tablas existentes a sus esquemas
-- ==========================================
-- Tablas de Feria
ALTER TABLE IF EXISTS Feria SET SCHEMA feria_schema;
ALTER TABLE IF EXISTS Pabellon SET SCHEMA feria_schema;

-- Tablas de Empresa
ALTER TABLE IF EXISTS Empresa SET SCHEMA empresa_schema;
ALTER TABLE IF EXISTS Stand SET SCHEMA empresa_schema;
ALTER TABLE IF EXISTS Producto SET SCHEMA empresa_schema;
ALTER TABLE IF EXISTS Ponente SET SCHEMA empresa_schema;
ALTER TABLE IF EXISTS Charla SET SCHEMA empresa_schema;
ALTER TABLE IF EXISTS Responsable SET SCHEMA empresa_schema;

-- Tablas de Visitante
ALTER TABLE IF EXISTS Persona SET SCHEMA visitante_schema;
ALTER TABLE IF EXISTS Visitante SET SCHEMA visitante_schema;
ALTER TABLE IF EXISTS TipoVisitante SET SCHEMA visitante_schema;
ALTER TABLE IF EXISTS Demostracion SET SCHEMA visitante_schema;
ALTER TABLE IF EXISTS Registro SET SCHEMA visitante_schema;

-- ==========================================
-- 4. Asignar permisos por esquema
-- ==========================================
-- Feria
GRANT USAGE, CREATE ON SCHEMA feria_schema TO role_feria;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA feria_schema TO role_feria;
ALTER DEFAULT PRIVILEGES IN SCHEMA feria_schema GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_feria;

-- Empresa
GRANT USAGE, CREATE ON SCHEMA empresa_schema TO role_empresa;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA empresa_schema TO role_empresa;
ALTER DEFAULT PRIVILEGES IN SCHEMA empresa_schema GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_empresa;

-- Visitante
GRANT USAGE, CREATE ON SCHEMA visitante_schema TO role_visitante;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA visitante_schema TO role_visitante;
ALTER DEFAULT PRIVILEGES IN SCHEMA visitante_schema GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_visitante;

-- ==========================================
-- 5. Asignar permisos al rol general
-- ==========================================
GRANT role_feria, role_empresa, role_visitante TO role_general;
GRANT CONNECT ON DATABASE "Evento_Actualizado" TO role_general;

-- ==========================================
-- 6. Cambiar propietario de los esquemas
-- ==========================================
ALTER SCHEMA feria_schema OWNER TO role_feria;
ALTER SCHEMA empresa_schema OWNER TO role_empresa;
ALTER SCHEMA visitante_schema OWNER TO role_visitante;
