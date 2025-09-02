USE Evento_Actualizado;

INSERT INTO Feria (nom_feria, ciudad, fecha_inicio, fecha_fin) VALUES
('Expo Tecnologia 2025', 'Bogota', '2025-09-01', '2025-09-05'),
('Feria del Libro', 'Medellin', '2025-10-10', '2025-10-20'),
('Agroexpo', 'Cali', '2025-11-15', '2025-11-22'),
('Feria Automotriz', 'Bogota', '2025-12-01', '2025-12-05'),
('Expo Salud', 'Medellin', '2025-07-01', '2025-07-05'),
('Feria Educacion', 'Cali', '2025-08-10', '2025-08-15'),
('Expo Moda', 'Bogota', '2025-06-01', '2025-06-04'),
('Feria Gastronomia', 'Cartagena', '2025-05-10', '2025-05-14'),
('Feria Turismo', 'Santa Marta', '2025-04-01', '2025-04-05'),
('Feria Energia', 'Medellin', '2025-03-01', '2025-03-04');

INSERT INTO Tematica (nombre) VALUES
('Tecnologia'),
('Literatura'),
('Agricultura'),
('Automotriz'),
('Salud'),
('Educacion'),
('Moda'),
('Gastronomia'),
('Turismo'),
('Energia');

INSERT INTO Pabellon (idFeria, idTematica, nombre) VALUES
(1, 1, 'Pabellon Innovacion'),
(2, 2, 'Pabellon Editorial'),
(3, 3, 'Pabellon Agroindustrial'),
(4, 4, 'Pabellon Vehiculos'),
(5, 5, 'Pabellon Salud'),
(6, 6, 'Pabellon Educativo'),
(7, 7, 'Pabellon Moda'),
(8, 8, 'Pabellon Gastronomico'),
(9, 9, 'Pabellon Turismo'),
(10, 10, 'Pabellon Energia');

INSERT INTO Empresa (nombre) VALUES
('TechCorp'),
('Editorial Alfa'),
('AgroSolutions'),
('AutoWorld'),
('SaludTotal'),
('EduSmart'),
('FashionLine'),
('GastroDelicias'),
('TravelNow'),
('GreenEnergy');

INSERT INTO Stand (idEmpresa, idPabellon, nombre) VALUES
(1, 1, 'Stand VR'),
(2, 2, 'Stand Libros'),
(3, 3, 'Stand Tractores'),
(4, 4, 'Stand Autos'),
(5, 5, 'Stand Salud'),
(6, 6, 'Stand Educativo'),
(7, 7, 'Stand Ropa'),
(8, 8, 'Stand Gastronomia'),
(9, 9, 'Stand Viajes'),
(10, 10, 'Stand Energia');

INSERT INTO Persona (nombre, apellido, dni, email, telefono) VALUES
('Carlos', 'Ramirez', '12345678', 'carlos@gmail.com', '3001112233'),
('Ana', 'Gomez', '87654321', 'ana@gmail.com', '3104445566'),
('Luis', 'Martinez', '56781234', 'luis@gmail.com', '3207778899'),
('Sofia', 'Torres', '99998888', 'sofia@gmail.com', '3012223344'),
('Pedro', 'Lopez', '22223333', 'pedro@gmail.com', '3113334455'),
('Maria', 'Fernandez', '44445555', 'maria@gmail.com', '3125556677'),
('Jorge', 'Castro', '66667777', 'jorge@gmail.com', '3137778899'),
('Laura', 'Diaz', '88889999', 'laura@gmail.com', '3149991122'),
('Andres', 'Mora', '10101010', 'andres@gmail.com', '3151010101'),
('Paula', 'Reyes', '12121212', 'paula@gmail.com', '3161212121');

INSERT INTO Responsable (idPersona) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

INSERT INTO Producto (idStand, idResponsable, nombre, descripcion) VALUES
(1, 1, 'Gafas VR', 'Dispositivo de realidad virtual'),
(2, 2, 'Libro Digital', 'Lectura en linea'),
(3, 3, 'Tractor Inteligente', 'Maquinaria con sensores'),
(4, 4, 'Auto Electrico', 'Vehiculo de energia limpia'),
(5, 5, 'Kit Salud', 'Herramientas de cuidado personal'),
(6, 6, 'Plataforma Educativa', 'Cursos online'),
(7, 7, 'Camisa Casual', 'Ropa moderna'),
(8, 8, 'Receta Gourmet', 'Comida de autor'),
(9, 9, 'Paquete Viajes', 'Turismo internacional'),
(10, 10, 'Panel Solar', 'Energia renovable');

INSERT INTO Ponente (idPersona) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

INSERT INTO Charla (idPonente, idEmpresa, titulo, descripcion, fecha_hora) VALUES
(1, 1, 'Realidad Virtual', 'Uso de VR en educacion', '2025-09-02 10:00:00'),
(2, 2, 'Futuro Editorial', 'Digitalizacion de libros', '2025-10-12 14:00:00'),
(3, 3, 'Agro Inteligente', 'Tecnologia en el agro', '2025-11-16 09:30:00'),
(4, 4, 'Autos Electricos', 'Movilidad sostenible', '2025-12-02 11:00:00'),
(5, 5, 'Salud Digital', 'Apps para el cuidado', '2025-07-02 15:00:00'),
(6, 6, 'Educacion Online', 'Plataformas virtuales', '2025-08-11 09:00:00'),
(7, 7, 'Moda y Tecnologia', 'Ropa inteligente', '2025-06-02 12:00:00'),
(8, 8, 'Gastronomia Moderna', 'Cocina fusion', '2025-05-11 13:00:00'),
(9, 9, 'Turismo Verde', 'Viajes sostenibles', '2025-04-02 10:00:00'),
(10, 10, 'Energias Renovables', 'Paneles y turbinas', '2025-03-02 11:30:00');

INSERT INTO Demostracion (titulo, descripcion) VALUES
('Demo VR', 'Prueba gafas VR'),
('Demo Ebook', 'Lectura digital'),
('Demo Tractor', 'Tractor con IoT'),
('Demo Auto', 'Auto electrico'),
('Demo Salud', 'Monitoreo digital'),
('Demo Educacion', 'Clase en linea'),
('Demo Moda', 'Desfile de ropa'),
('Demo Cocina', 'Cocina en vivo'),
('Demo Turismo', 'Tour virtual'),
('Demo Energia', 'Panel solar activo');

INSERT INTO TipoVisitante (descripcion) VALUES
('Estudiante'),
('Profesional'),
('Empresario'),
('Docente'),
('Investigador'),
('Turista'),
('Empleado'),
('Gerente'),
('Inversionista'),
('Publico General');

INSERT INTO Visitante (idPersona, idTipo) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);

INSERT INTO Registro (idVisitante, idCharla, idDemostracion, idFeria) VALUES
(1,1,1,1),
(2,2,2,2),
(3,3,3,3),
(4,4,4,4),
(5,5,5,5),
(6,6,6,6),
(7,7,7,7),
(8,8,8,8),
(9,9,9,9),
(10,10,10,10);

UPDATE Feria SET nom_feria = 'Expo Tecnologia Global' WHERE idFeria = 1;
UPDATE Producto SET nombre = 'Gafas VR Pro' WHERE idProducto = 1;
UPDATE Persona SET email = 'carlos123@gmail.com' WHERE idPersona = 1;
UPDATE Charla SET descripcion = 'Nuevos usos de la realidad virtual en educacion' WHERE idCharla = 1;
UPDATE Persona SET telefono = '3009998888' WHERE idPersona = 2;

DELETE FROM Registro WHERE idVisitante = 5;
DELETE FROM Charla WHERE idPonente = 5;
DELETE FROM Producto WHERE idResponsable = 5;
DELETE FROM Visitante WHERE idVisitante = 5;
DELETE FROM Ponente WHERE idPonente = 5;
DELETE FROM Responsable WHERE idResponsable = 5;
DELETE FROM Stand WHERE idStand = 5;
DELETE FROM Pabellon WHERE idPabellon = 5;
DELETE FROM Feria WHERE idFeria = 5;
DELETE FROM Tematica WHERE idTematica = 5;
DELETE FROM Empresa WHERE idEmpresa = 5;
DELETE FROM Demostracion WHERE idDemostracion = 5;
DELETE FROM TipoVisitante WHERE idTipo = 5;
DELETE FROM Persona WHERE idPersona = 5;
