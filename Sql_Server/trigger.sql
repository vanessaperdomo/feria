USE Evento_Actualizado;
GO

-- Tabla de auditoría
CREATE TABLE visitante_schema.AuditoriaVisitante (
  id INT IDENTITY PRIMARY KEY,
  accion NVARCHAR(50),
  fecha DATETIME DEFAULT GETDATE(),
  idPersona INT
);

-- Trigger auditoría
CREATE TRIGGER visitante_schema.trg_InsertVisitante
ON Visitante
AFTER INSERT
AS
BEGIN
  INSERT INTO visitante_schema.AuditoriaVisitante (accion, idPersona)
  SELECT 'INSERT', idPersona FROM inserted;
END
GO
