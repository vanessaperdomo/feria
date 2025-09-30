USE Evento_Actualizado;
GO

-- Insertar feria
CREATE PROCEDURE feria_schema.sp_insertar_feria
 @nombre NVARCHAR(100),
 @ciudad NVARCHAR(100),
 @fecha_inicio DATE,
 @fecha_fin DATE
AS
BEGIN
  INSERT INTO Feria(nom_feria, ciudad, fecha_inicio, fecha_fin)
  VALUES (@nombre, @ciudad, @fecha_inicio, @fecha_fin);
END
GO

-- Actualizar empresa
CREATE PROCEDURE empresa_schema.sp_actualizar_empresa
 @idEmpresa INT,
 @nombre NVARCHAR(100)
AS
BEGIN
  UPDATE Empresa
  SET nombre = @nombre
  WHERE idEmpresa = @idEmpresa;
END
GO

-- Listar visitantes
CREATE PROCEDURE visitante_schema.sp_listar_visitantes
AS
BEGIN
  SELECT v.idVisitante, p.nombre, p.apellido, t.descripcion AS TipoVisitante
  FROM Visitante v
  INNER JOIN Persona p ON v.idPersona = p.idPersona
  INNER JOIN TipoVisitante t ON v.idTipo = t.idTipo;
END
GO
