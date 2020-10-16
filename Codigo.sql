CREATE DATABASE IF NOT EXISTS PlaceMyBet;

USE placemybet;

CREATE TABLE IF NOT EXISTS eventos (      
idEvento 	 INT 			 NOT NULL AUTO_INCREMENT,
nomLocal 	 VARCHAR(45) NOT NULL,
nomVisitante VARCHAR(45) NOT NULL,
fecha 		 DATE 	    NOT NULL,
PRIMARY KEY (idEvento));

CREATE TABLE IF NOT EXISTS Mercados (      
idMercado   INT 		  NOT NULL AUTO_INCREMENT,
tipo			INT		  NOT NULL,
cuotaOver   DECIMAL(2) NOT NULL,
cuotaUnder  DECIMAL(2) NOT NULL,
dineroOver  DECIMAL(2) NOT NULL,
dineroUnder DECIMAL(2) NOT NULL,
eventoMer   INT 		  NOT NULL,
PRIMARY KEY (idMercado));

CREATE TABLE IF NOT EXISTS Apuestas (      
idApuesta    INT 		 	 NOT NULL AUTO_INCREMENT,
mercadoApu   INT		    NOT NULL,
cuota		    DECIMAL(2)  NOT NULL,
dinero	    DECIMAL(2)  NOT NULL,
fecha		    DATE 		 NOT NULL,
emailUsu   	 VARCHAR(45) NOT NULL,
overUnder  	 VARCHAR(45) NOT NULL,
PRIMARY KEY (idApuesta));

CREATE TABLE IF NOT EXISTS Usuarios (      
email 	 VARCHAR(45) NOT NULL,
nombre 	 VARCHAR(45) NOT NULL,
apellidos VARCHAR(45) NOT NULL,
edad		 INT  		 NOT NULL,
cuentaUsu INT		    NOT NULL,
PRIMARY KEY (email));

CREATE TABLE IF NOT EXISTS Cuentas (      
tarjeta INT  		  NOT NULL,
saldo   VARCHAR(45) NOT NULL,
banco   VARCHAR(45) NOT NULL,
PRIMARY KEY (tarjeta));

ALTER TABLE Mercados ADD FOREIGN KEY (eventoMer)  REFERENCES Eventos(idEvento);
ALTER TABLE Apuestas ADD FOREIGN KEY (mercadoApu) REFERENCES Mercados(idMercado);
ALTER TABLE Apuestas ADD FOREIGN KEY (emailUsu)   REFERENCES Usuarios(email);
ALTER TABLE Usuarios ADD FOREIGN KEY (cuentaUsu)   REFERENCES Cuentas(tarjeta);

INSERT INTO eventos (nomLocal, nomVisitante, fecha) VALUES ('Real Madrid', 'Valencia','2020-05-22');
INSERT INTO eventos (nomLocal, nomVisitante, fecha) VALUES ('Betis', 'Granada','2020-05-23');
INSERT INTO eventos (nomLocal, nomVisitante, fecha) VALUES ('Sevilla', 'Barcelona','2020-05-29');
INSERT INTO eventos (nomLocal, nomVisitante, fecha) VALUES ('Schalke 04', 'Bayern','2020-06-30');
INSERT INTO eventos (nomLocal, nomVisitante, fecha) VALUES ('Lyon', 'Manchester City','2020-05-22');

INSERT INTO mercados (tipo, cuotaOver, cuotaUnder, dineroOver, dineroUnder, eventoMer) VALUES (1, 1.43, 2.85, 100, 50, 03);
INSERT INTO mercados (tipo, cuotaOver, cuotaUnder, dineroOver, dineroUnder, eventoMer) VALUES (3, 1.9, 1.9, 75, 60, 02);
INSERT INTO mercados (tipo, cuotaOver, cuotaUnder, dineroOver, dineroUnder, eventoMer) VALUES (2, 2.85, 1.43, 125, 30, 05);
INSERT INTO mercados (tipo, cuotaOver, cuotaUnder, dineroOver, dineroUnder, eventoMer) VALUES (2, 2.1, 1.54, 50, 100, 01);
INSERT INTO mercados (tipo, cuotaOver, cuotaUnder, dineroOver, dineroUnder, eventoMer) VALUES (1, 1.54, 2.1, 70, 90, 04);

INSERT INTO cuentas VALUES ('2345233L', 3000, 'Santander');
INSERT INTO cuentas VALUES ('3423573P', 750, 'Santander');
INSERT INTO cuentas VALUES ('9032683C', 1050, 'BBVA');
INSERT INTO cuentas VALUES ('4327823N', 200, 'Caixa Bank');
INSERT INTO cuentas VALUES ('1432258B', 2000, 'BBVA');

INSERT INTO usuarios VALUES ('juanjo@gmail.com', 'Juanjo', 'García Gomez', 23, '3423573P');
INSERT INTO usuarios VALUES ('manolo@gmail.com', 'Manolo', 'Gutierrez Navarro', 19, '2345233L');
INSERT INTO usuarios VALUES ('manuel@gmail.com', 'Manuel', 'Naranjo Gomez', 35, '4327823N');
INSERT INTO usuarios VALUES ('ricardo@gmail.com', 'Ricardo', 'Travé Gonzalez', 20, '9032683C');
INSERT INTO usuarios VALUES ('pedro@gmail.com', 'Pedro', 'Navarro Molero', 43, '1432258B');

INSERT INTO apuestas (mercadoApu, cuota, dinero, fecha, emailUsu, overUnder) VALUES (01, 2.85, 23, '2020-05-20', 'juanjo@gmail.com', 'under');
INSERT INTO apuestas (mercadoApu, cuota, dinero, fecha, emailUsu, overUnder) VALUES (04, 2.1, 12, '2020-06-21', 'manolo@gmail.com', 'over');
INSERT INTO apuestas (mercadoApu, cuota, dinero, fecha, emailUsu, overUnder) VALUES (03, 2.85, 35, '2020-05-25', 'ricardo@gmail.com', 'over');
INSERT INTO apuestas (mercadoApu, cuota, dinero, fecha, emailUsu, overUnder) VALUES (02, 1.9, 20, '2020-05-22', 'manuel@gmail.com', 'under');
INSERT INTO apuestas (mercadoApu, cuota, dinero, fecha, emailUsu, overUnder) VALUES (05, 1.54, 10, '2020-05-20', 'pedro@gmail.com', 'over');