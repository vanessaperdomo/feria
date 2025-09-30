
CREATE TABLE IF NOT EXISTS LogEventos (
    idLog SERIAL PRIMARY KEY,
    tabla VARCHAR(50),
    accion VARCHAR(50),
    usuario_actual VARCHAR(100),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger para INSERT en Persona
CREATE OR REPLACE FUNCTION fn_trg_insert_persona()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO LogEventos(tabla, accion, usuario_actual)
    VALUES('Persona', 'INSERT', current_user);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_insert_persona
AFTER INSERT ON Persona
FOR EACH ROW
EXECUTE FUNCTION fn_trg_insert_persona();


-- Trigger para UPDATE en Feria
CREATE OR REPLACE FUNCTION fn_trg_update_feria()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO LogEventos(tabla, accion, usuario_actual)
    VALUES('Feria', 'UPDATE', current_user);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_feria
AFTER UPDATE ON Feria
FOR EACH ROW
EXECUTE FUNCTION fn_trg_update_feria();


-- Trigger para DELETE en Empresa
CREATE OR REPLACE FUNCTION fn_trg_delete_empresa()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO LogEventos(tabla, accion, usuario_actual)
    VALUES('Empresa', 'DELETE', current_user);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_delete_empresa
AFTER DELETE ON Empresa
FOR EACH ROW
EXECUTE FUNCTION fn_trg_delete_empresa();

