USE Evento_Actualizado;

DELIMITER //

DROP PROCEDURE IF EXISTS sp_ListarFeriasPorCiudad;
DROP PROCEDURE IF EXISTS sp_BuscarPersonaPorDNI;
DROP PROCEDURE IF EXISTS sp_ListarProductosPorEmpresa;

-- Crear procedimiento: Listar ferias por ciudad
CREATE PROCEDURE sp_ListarFeriasPorCiudad(IN Ciudad VARCHAR(100))
BEGIN
    SELECT idFeria, nom_feria, fecha_inicio, fecha_fin
    FROM Feria
    WHERE ciudad = Ciudad;
END;
//

-- Crear procedimiento: Buscar persona por DNI
CREATE PROCEDURE sp_BuscarPersonaPorDNI(IN DNI VARCHAR(100))
BEGIN
    SELECT idPersona, nombre, apellido, email, telefono
    FROM Persona
    WHERE dni = DNI;
END;
//

-- Crear procedimiento: Listar productos por empresa
CREATE PROCEDURE sp_ListarProductosPorEmpresa(IN Empresa VARCHAR(100))
BEGIN
    SELECT p.nombre AS Producto, p.descripcion, e.nombre AS Empresa
    FROM Producto p
    JOIN Stand s ON p.idStand = s.idStand
    JOIN Empresa e ON s.idEmpresa = e.idEmpresa
    WHERE e.nombre = Empresa;
END;
//

DELIMITER ;

-- Ejecutar procedimientos
CALL sp_ListarFeriasPorCiudad('Bogota');
CALL sp_BuscarPersonaPorDNI('12345678');
CALL sp_ListarProductosPorEmpresa('TechCorp');
