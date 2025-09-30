-- Nos conectamos o cambiamos al rol role_general
SET ROLE role_general;

-- ==========================================
-- Esto funcionará porque role_general hereda todos los roles específicos:
-- role_feria, role_empresa y role_visitante
-- Por lo tanto, puede acceder a todos los esquemas y tablas
-- ==========================================
SELECT * FROM feria_schema.Feria;
SELECT * FROM feria_schema.Pabellon;

SELECT * FROM empresa_schema.Empresa;
SELECT * FROM empresa_schema.Stand;
SELECT * FROM empresa_schema.Producto;
SELECT * FROM empresa_schema.Ponente;
SELECT * FROM empresa_schema.Charla;
SELECT * FROM empresa_schema.Responsable;

SELECT * FROM visitante_schema.Persona;
SELECT * FROM visitante_schema.Visitante;
SELECT * FROM visitante_schema.TipoVisitante;
SELECT * FROM visitante_schema.Demostracion;
SELECT * FROM visitante_schema.Registro;

-- ==========================================
-- En este caso NINGUNA consulta fallará
-- role_general tiene acceso completo a los tres esquemas
-- ==========================================
