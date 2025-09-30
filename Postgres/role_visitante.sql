-- Nos conectamos o cambiamos al rol role_visitante
SET ROLE role_visitante;

-- ==========================================
-- Esto funcionará porque la tabla pertenece al esquema que role_visitante controla
-- role_visitante tiene permisos de SELECT, INSERT, UPDATE, DELETE y CREATE
-- sobre todas las tablas dentro de visitante_schema
-- ==========================================
SELECT * FROM visitante_schema.Persona;
SELECT * FROM visitante_schema.Visitante;
SELECT * FROM visitante_schema.TipoVisitante;
SELECT * FROM visitante_schema.Demostracion;
SELECT * FROM visitante_schema.Registro;

-- ==========================================
-- Esto fallará porque la tabla pertenece a otro esquema: feria_schema
-- role_visitante NO tiene permisos sobre tablas fuera de su esquema
-- PostgreSQL bloqueará el acceso y mostrará:
-- ERROR: permission denied for table Feria
-- ==========================================
SELECT * FROM feria_schema.Feria;

-- ==========================================
-- Esto también fallará porque la tabla pertenece al esquema empresa_schema
-- role_visitante NO tiene permisos sobre tablas de empresa_schema
-- ==========================================
SELECT * FROM empresa_schema.Empresa;
