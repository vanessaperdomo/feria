USE Evento_Actualizado;

DROP TRIGGER IF EXISTS trg_Insert_Persona;
DROP TRIGGER IF EXISTS trg_Update_Feria;
DROP TRIGGER IF EXISTS trg_Delete_Empresa;

DELIMITER //

-- INSERT en Persona
CREATE TRIGGER trg_Insert_Persona
AFTER INSERT ON Persona
FOR EACH ROW
BEGIN
    INSERT INTO LogEventos(tabla, accion, usuario)
    VALUES('Persona', 'INSERT', USER());
END;
//

-- UPDATE en Feria
CREATE TRIGGER trg_Update_Feria
AFTER UPDATE ON Feria
FOR EACH ROW
BEGIN
    INSERT INTO LogEventos(tabla, accion, usuario)
    VALUES('Feria', 'UPDATE', USER());
END;
//

-- DELETE en Empresa
CREATE TRIGGER trg_Delete_Empresa
AFTER DELETE ON Empresa
FOR EACH ROW
BEGIN
    INSERT INTO LogEventos(tabla, accion, usuario)
    VALUES('Empresa', 'DELETE', USER());
END;
//

DELIMITER ;
