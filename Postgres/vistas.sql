CREATE OR REPLACE VIEW vw_ProductosFeria AS
SELECT 
    f.nom_feria AS feria,
    f.ciudad,
    pa.nombre AS pabellon,
    e.nombre AS empresa,
    s.nombre AS stand,
    pr.nombre AS producto,
    pr.descripcion,
    pe.nombre || ' ' || pe.apellido AS responsable
FROM Producto pr
JOIN Stand s        ON pr.idStand = s.idStand
JOIN Empresa e      ON s.idEmpresa = e.idEmpresa
JOIN Pabellon pa    ON s.idPabellon = pa.idPabellon
JOIN Feria f        ON pa.idFeria = f.idFeria
JOIN Responsable r  ON pr.idResponsable = r.idResponsable
JOIN Persona pe     ON r.idPersona = pe.idPersona;

-- Consultar la vista
SELECT * FROM vw_ProductosFeria;

