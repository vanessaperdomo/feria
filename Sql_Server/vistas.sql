USE Evento_Actualizado;
GO

-- Vista de ferias y pabellones
CREATE VIEW feria_schema.vw_FeriasPabellones AS
SELECT f.nom_feria, f.ciudad, p.nombre AS Pabellon, t.nombre AS Tematica
FROM Feria f
INNER JOIN Pabellon p ON f.idFeria = p.idFeria
INNER JOIN Tematica t ON p.idTematica = t.idTematica;
GO

-- Vista de empresas y productos
CREATE VIEW empresa_schema.vw_EmpresasProductos AS
SELECT e.nombre AS Empresa, pr.nombre AS Producto, pr.descripcion
FROM Empresa e
INNER JOIN Stand s ON e.idEmpresa = s.idEmpresa
INNER JOIN Producto pr ON s.idStand = pr.idStand;
GO

-- Vista de visitantes y registros
CREATE VIEW visitante_schema.vw_VisitantesRegistro AS
SELECT p.nombre, p.apellido, f.nom_feria, c.titulo AS Charla, d.titulo AS Demostracion
FROM Registro r
INNER JOIN Visitante v ON r.idVisitante = v.idVisitante
INNER JOIN Persona p ON v.idPersona = p.idPersona
INNER JOIN Feria f ON r.idFeria = f.idFeria
INNER JOIN Charla c ON r.idCharla = c.idCharla
INNER JOIN Demostracion d ON r.idDemostracion = d.idDemostracion;
GO
