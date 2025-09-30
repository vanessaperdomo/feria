CREATE USER 'user_tecnologia'@'localhost' IDENTIFIED BY 'clave_tec123';
GRANT ALL PRIVILEGES ON Evento_Tecnologia.* TO 'user_tecnologia'@'localhost';

CREATE USER 'user_cultura'@'localhost' IDENTIFIED BY 'clave_cul123';
GRANT ALL PRIVILEGES ON Evento_Cultura.* TO 'user_cultura'@'localhost';

CREATE USER 'user_turismo'@'localhost' IDENTIFIED BY 'clave_tur123';
GRANT ALL PRIVILEGES ON Evento_Turismo.* TO 'user_turismo'@'localhost';

CREATE USER 'admin_evento'@'localhost' IDENTIFIED BY 'clave_admin123';
GRANT ALL PRIVILEGES ON Evento_Tecnologia.* TO 'admin_evento'@'localhost';
GRANT ALL PRIVILEGES ON Evento_Cultura.* TO 'admin_evento'@'localhost';
GRANT ALL PRIVILEGES ON Evento_Turismo.* TO 'admin_evento'@'localhost';

FLUSH PRIVILEGES;
