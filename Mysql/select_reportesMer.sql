USE Evento_Actualizado;

SELECT 
    p.nombre AS Producto,
    e.nombre AS Empresa,
    per.nombre AS Responsable,
    per.apellido AS Apellido
FROM Producto p
JOIN Stand s ON p.idStand = s.idStand
JOIN Empresa e ON s.idEmpresa = e.idEmpresa
JOIN Responsable r ON p.idResponsable = r.idResponsable
JOIN Persona per ON r.idPersona = per.idPersona;

SELECT 
    c.titulo AS Charla,
    c.descripcion AS Descripcion,
    per.nombre AS Ponente,
    per.apellido AS Apellido,
    f.nom_feria AS Feria
FROM Charla c
JOIN Ponente po ON c.idPonente = po.idPonente
JOIN Persona per ON po.idPersona = per.idPersona
JOIN Empresa e ON c.idEmpresa = e.idEmpresa
JOIN Pabellon pa ON e.idEmpresa = pa.idTematica 
JOIN Feria f ON pa.idFeria = f.idFeria;

SELECT 
    v.idVisitante AS ID,
    per.nombre AS Nombre,
    per.apellido AS Apellido,
    tv.descripcion AS TipoVisitante,
    f.nom_feria AS Feria,
    c.titulo AS Charla,
    d.titulo AS Demostracion
FROM Registro r
JOIN Visitante v ON r.idVisitante = v.idVisitante
JOIN Persona per ON v.idPersona = per.idPersona
JOIN TipoVisitante tv ON v.idTipo = tv.idTipo
JOIN Feria f ON r.idFeria = f.idFeria
JOIN Charla c ON r.idCharla = c.idCharla
JOIN Demostracion d ON r.idDemostracion = d.idDemostracion;