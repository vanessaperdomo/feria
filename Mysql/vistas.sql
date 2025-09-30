USE Evento_Actualizado;

CREATE VIEW vw_VisitantesFeria AS
SELECT 
    v.idVisitante,
    CONCAT(p.nombre, ' ', p.apellido) AS nombre_completo,
    t.descripcion AS tipo_visitante,
    f.nom_feria AS feria,
    f.ciudad,
    f.fecha_inicio,
    f.fecha_fin
FROM Visitante v
JOIN Persona p ON v.idPersona = p.idPersona
JOIN TipoVisitante t ON v.idTipo = t.idTipo
JOIN Registro r ON v.idVisitante = r.idVisitante
JOIN Feria f ON r.idFeria = f.idFeria;

SELECT * FROM vw_VisitantesFeria;
