-- Asegura que el DNI no se repita y acelera búsquedas por documento
CREATE UNIQUE INDEX indice_persona_dni ON Persona(dni); 

-- Sirve para buscar rapido los pabellones de una feria
CREATE INDEX indice_pabellon_feria ON Pabellon(idFeria); 

-- Sirve para buscar rapido los pabellones de una tematica
CREATE INDEX indice_pabellon_tematica ON Pabellon(idTematica); 

-- Acelera las consultas de stands por empresa
CREATE INDEX indice_stand_empresa ON Stand(idEmpresa); 

-- Acelera las consultas de stands por pabellon
CREATE INDEX indice_stand_pabellon ON Stand(idPabellon); 

-- Acelera la relacion entre responsable y persona
CREATE INDEX indice_responsable_persona ON Responsable(idPersona); 

-- Acelera consultas de productos por stand
CREATE INDEX indice_producto_stand ON Producto(idStand); 

-- Acelera consultas de productos por responsable
CREATE INDEX indice_producto_responsable ON Producto(idResponsable); 

-- Acelera la relacion entre ponente y persona
CREATE INDEX indice_ponente_persona ON Ponente(idPersona); 

-- Acelera consultas de charlas por ponente
CREATE INDEX indice_charla_ponente ON Charla(idPonente); 

-- Acelera consultas de charlas por empresa
CREATE INDEX indice_charla_empresa ON Charla(idEmpresa); 

-- Acelera consultas de visitante por persona
CREATE INDEX indice_visitante_persona ON Visitante(idPersona); 

-- Acelera consultas de visitantes por tipo
CREATE INDEX indice_visitante_tipo ON Visitante(idTipo); 

-- Acelera consultas de registros por visitante.
CREATE INDEX indice_registro_visitante ON Registro(idVisitante); 

-- Acelera consultas de registros por charla
CREATE INDEX indice_registro_charla ON Registro(idCharla); 

-- Acelera consultas de registros por demostracion
CREATE INDEX indice_registro_demostracion ON Registro(idDemostracion); 

-- Acelera consultas de registros por feria
CREATE INDEX indice_registro_feria ON Registro(idFeria); 

