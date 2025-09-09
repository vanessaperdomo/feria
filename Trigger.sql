USE Evento_Actualizado;

CREATE TRIGGER trg_Insert_Persona
AFTER INSERT ON Persona
FOR EACH ROW
INSERT INTO LogEventos(tabla, accion, usuario)
VALUES('Persona', 'INSERT', USER());

CREATE TRIGGER trg_Update_Feria
AFTER UPDATE ON Feria
FOR EACH ROW
INSERT INTO LogEventos(tabla, accion, usuario)
VALUES('Feria', 'UPDATE', USER());

CREATE TRIGGER trg_Delete_Empresa
AFTER DELETE ON Empresa
FOR EACH ROW
INSERT INTO LogEventos(tabla, accion, usuario)
VALUES('Empresa', 'DELETE', USER());
