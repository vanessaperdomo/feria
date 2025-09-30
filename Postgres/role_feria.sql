-- Nos conectamos o cambiamos al rol role_feria
SET ROLE role_feria;

-- ==========================================
-- Esto funcionará porque la tabla pertenece al esquema que role_feria controla
-- role_feria tiene permisos de SELECT, INSERT, UPDATE, DELETE y CREATE
-- sobre todas las tablas dentro de feria_schema
-- ==========================================
SELECT * FROM feria_schema.Feria;
SELECT * FROM feria_schema.Pabellon;

-- ==========================================
-- Esto fallará porque la tabla pertenece a otro esquema: empresa_schema
-- role_feria NO tiene permisos sobre tablas fuera de su esquema
-- PostgreSQL bloqueará el acceso y mostrará:
-- ERROR: permission denied for table Empresa
-- ==========================================
SELECT * FROM empresa_schema.Empresa;

-- ==========================================
-- Esto también fallará porque la tabla pertenece al esquema visitante_schema
-- role_feria NO tiene permisos sobre tablas de visitante_schema
-- ==========================================
SELECT * FROM visitante_schema.Persona;
