
-- Listar ferias por ciudad
CREATE OR REPLACE FUNCTION sp_listarferiasporciudad(ciudad_param VARCHAR(100))
RETURNS TABLE(
    idFeria INT,
    nom_feria VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE
) AS $$
BEGIN
    RETURN QUERY
    SELECT f.idFeria, f.nom_feria, f.fecha_inicio, f.fecha_fin
    FROM Feria f
    WHERE f.ciudad = ciudad_param;
END;
$$ LANGUAGE plpgsql;


-- Buscar persona por DNI
CREATE OR REPLACE FUNCTION sp_buscarpersonapordni(dni_param VARCHAR(100))
RETURNS TABLE(
    idPersona INT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(50),
    telefono VARCHAR(20)
) AS $$
BEGIN
    RETURN QUERY
    SELECT p.idPersona, p.nombre, p.apellido, p.email, p.telefono
    FROM Persona p
    WHERE p.dni = dni_param;
END;
$$ LANGUAGE plpgsql;


-- Listar productos por empresa
CREATE OR REPLACE FUNCTION sp_listarproductosporempresa(empresa_param VARCHAR(100))
RETURNS TABLE(
    producto VARCHAR(100),
    descripcion TEXT,
    empresa VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY
    SELECT p.nombre AS producto, p.descripcion, e.nombre AS empresa
    FROM Producto p
    JOIN Stand s ON p.idStand = s.idStand
    JOIN Empresa e ON s.idEmpresa = e.idEmpresa
    WHERE e.nombre = empresa_param;
END;
$$ LANGUAGE plpgsql;


-- Ejemplos de ejecución
SELECT * FROM sp_listarferiasporciudad('Bogota');
SELECT * FROM sp_buscarpersonapordni('12345678');
SELECT * FROM sp_listarproductosporempresa('TechCorp');

