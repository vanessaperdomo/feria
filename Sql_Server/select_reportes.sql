USE Evento_Actualizado;
GO

-- Reporte 1: Total de ferias por ciudad
SELECT ciudad, COUNT(*) AS TotalFerias
FROM Feria
GROUP BY ciudad;

-- Reporte 2: Visitantes por tipo
SELECT t.descripcion, COUNT(*) AS Total
FROM Visitante v
INNER JOIN TipoVisitante t ON v.idTipo = t.idTipo
GROUP BY t.descripcion;

-- Reporte 3: Productos por empresa
SELECT e.nombre AS Empresa, COUNT(pr.idProducto) AS TotalProductos
FROM Empresa e
INNER JOIN Stand s ON e.idEmpresa = s.idEmpresa
INNER JOIN Producto pr ON s.idStand = pr.idStand
GROUP BY e.nombre;
GO
