USE Evento_Actualizado;
GO

CREATE PROCEDURE sp_ListarFeriasPorCiudad
    @Ciudad VARCHAR(100)
AS
BEGIN
    SELECT idFeria, nom_feria, fecha_inicio, fecha_fin
    FROM Feria
    WHERE ciudad = @Ciudad;
END;
GO

EXEC sp_ListarFeriasPorCiudad @Ciudad = 'Bogota';

CREATE PROCEDURE sp_BuscarPersonaPorDNI
    @DNI VARCHAR(100)
AS
BEGIN
    SELECT idPersona, nombre, apellido, email, telefono
    FROM Persona
    WHERE dni = @DNI;
END;
GO

EXEC sp_BuscarPersonaPorDNI @DNI = '12345678';

CREATE PROCEDURE sp_ListarProductosPorEmpresa
    @Empresa VARCHAR(100)
AS
BEGIN
    SELECT p.nombre AS Producto, p.descripcion, e.nombre AS Empresa
    FROM Producto p
    JOIN Stand s ON p.idStand = s.idStand
    JOIN Empresa e ON s.idEmpresa = e.idEmpresa
    WHERE e.nombre = @Empresa;
END;
GO

EXEC sp_ListarProductosPorEmpresa @Empresa = 'TechCorp';
