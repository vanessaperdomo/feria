
SET ROLE user_feria;

INSERT INTO feria_schema.Feria (nom_feria, ciudad, fecha_inicio, fecha_fin)
VALUES 
('Expo Salud 2025', 'Medellín', '2025-10-01', '2025-10-05'),
('Feria Tecnología 2025', 'Bogotá', '2025-11-10', '2025-11-15');

INSERT INTO feria_schema.Tematica (nombre)
VALUES 
('Salud'),
('Tecnología'),
('Educación');

INSERT INTO feria_schema.Pabellon (idFeria, idTematica, nombre)
VALUES
(1, 1, 'Pabellón Salud Integral'),
(1, 3, 'Pabellón Educación en Salud'),
(2, 2, 'Pabellón Innovación Tech');

RESET ROLE;

-- ===========================
-- ESQUEMA EMPRESA (user_empresa)
-- ===========================
SET ROLE user_empresa;

INSERT INTO empresa_schema.Empresa (nombre)
VALUES 
('Tech Solutions S.A.'),
('BioSalud Ltda.'),
('EducApp SAS');

INSERT INTO empresa_schema.Stand (idEmpresa, idPabellon, nombre)
VALUES
(1, 3, 'Stand Innovación Tech'),
(2, 1, 'Stand Medicina Avanzada'),
(3, 2, 'Stand Educación Digital');

INSERT INTO empresa_schema.Producto (idStand, nombre, descripcion)
VALUES
(1, 'Software IA', 'Plataforma de inteligencia artificial aplicada a negocios'),
(2, 'Equipo de Rayos X', 'Tecnología médica avanzada'),
(3, 'App de Cursos', 'Aplicación móvil para educación online');

RESET ROLE;

-- ===========================
-- ESQUEMA VISITANTE (user_visitante)
-- ===========================
SET ROLE user_visitante;

INSERT INTO visitante_schema.Persona (nombre, apellido, dni, email, telefono)
VALUES
('Carlos', 'López', '123456789', 'carlos@mail.com', '3001234567'),
('María', 'Gómez', '987654321', 'maria@mail.com', '3017654321'),
('Andrés', 'Martínez', '456789123', 'andres@mail.com', '3029876543');

INSERT INTO visitante_schema.Visitante (idPersona, tipo)
VALUES
(1, 'Profesional'),
(2, 'Estudiante'),
(3, 'Inversionista');

INSERT INTO visitante_schema.Registro (idVisitante, detalle)
VALUES
(1, 'Registrado en Feria de Salud'),
(2, 'Registrado en Feria de Tecnología'),
(3, 'Registrado en Feria de Educación');

RESET ROLE;
