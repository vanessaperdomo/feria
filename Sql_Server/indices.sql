USE Evento_Actualizado;
GO

-- Índice en feria
CREATE INDEX IX_Feria_Ciudad ON Feria(ciudad);

-- Índice en visitante
CREATE INDEX IX_Visitante_Tipo ON Visitante(idTipo);

-- Índice en producto
CREATE INDEX IX_Producto_Nombre ON Producto(nombre);
GO
