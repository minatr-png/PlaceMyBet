CREATE DATABASE IF NOT EXISTS PlaceMyBet;

USE placemybet;

CREATE TABLE IF NOT EXISTS Evento (      
idEvento 	 INT 			 NOT NULL,
nomLocal 	 VARCHAR(45) NOT NULL,
nomVisitante VARCHAR(45) NOT NULL,
fecha 		 DATE 	    NOT NULL,
PRIMARY KEY (idEvento));

CREATE TABLE IF NOT EXISTS Mercado (      
idMercado   INT 		  NOT NULL,
cuotaOver   DECIMAL(2) NOT NULL,
cuotaUnder  DECIMAL(2) NOT NULL,
dineroOver  DECIMAL(2) NOT NULL,
dineroUnder DECIMAL(2) NOT NULL,
eventoMer   INT 		  NOT NULL,
PRIMARY KEY (idMercado));

CREATE TABLE IF NOT EXISTS Apuesta (      
idApuesta    INT 		 	 NOT NULL,
mercadoApu   INT		    NOT NULL,
tipo   		 VARCHAR(3)  NOT NULL,
cuota		    DECIMAL(2)  NOT NULL,
dinero	    DECIMAL(2)  NOT NULL,
fecha		    DATE 		 NOT NULL,
emailUsu   	 VARCHAR(45) NOT NULL,
PRIMARY KEY (idApuesta));

CREATE TABLE IF NOT EXISTS Usuario (      
email 	 VARCHAR(45) NOT NULL,
nombre 	 VARCHAR(45) NOT NULL,
apellidos VARCHAR(45) NOT NULL,
edad		 INT  		 NOT NULL,
cuentaUsu INT		    NOT NULL,
PRIMARY KEY (email));

CREATE TABLE IF NOT EXISTS Cuenta (      
tarjeta INT  		  NOT NULL,
saldo   VARCHAR(45) NOT NULL,
banco   VARCHAR(45) NOT NULL,
PRIMARY KEY (tarjeta));

ALTER TABLE Mercado ADD FOREIGN KEY (eventoMer)  REFERENCES Evento(idEvento);
ALTER TABLE Apuesta ADD FOREIGN KEY (mercadoApu) REFERENCES Mercado(idMercado);
ALTER TABLE Apuesta ADD FOREIGN KEY (emailUsu)   REFERENCES Usuario(email);
ALTER TABLE Usuario ADD FOREIGN KEY (cuentaUsu)   REFERENCES Cuenta(tarjeta);

INSERT INTO evento VALUES (01, 'Real Madrid', 'Valencia','2020-05-22');
INSERT INTO evento VALUES (02, 'Betis', 'Granada','2020-05-23');
INSERT INTO evento VALUES (03, 'Sevilla', 'Barcelona','2020-05-29');
INSERT INTO evento VALUES (04, 'Schalke 04', 'Bayern','2020-06-30');
INSERT INTO evento VALUES (05, 'Lyon', 'Manchester City','2020-05-22');

INSERT INTO mercado VALUES (01, 1.43, 2.85, 100, 50, 03);
INSERT INTO mercado VALUES (02, 1.9, 1.9, 75, 60, 02);
INSERT INTO mercado VALUES (03, 2.85, 1.43, 125, 30, 05);
INSERT INTO mercado VALUES (04, 2.1, 1.54, 50, 100, 01);
INSERT INTO mercado VALUES (05, 1.54, 2.1, 70, 90, 04);

INSERT INTO cuenta VALUES ('2345233L', 3000, 'Santander');
INSERT INTO cuenta VALUES ('3423573P', 750, 'Santander');
INSERT INTO cuenta VALUES ('9032683C', 1050, 'BBVA');
INSERT INTO cuenta VALUES ('4327823N', 200, 'Caixa Bank');
INSERT INTO cuenta VALUES ('1432258B', 2000, 'BBVA');

INSERT INTO usuario VALUES ('juanjo@gmail.com', 'Juanjo', 'García Gomez', 23, '3423573P');
INSERT INTO usuario VALUES ('manolo@gmail.com', 'Manolo', 'Gutierrez Navarro', 19, '2345233L');
INSERT INTO usuario VALUES ('manuel@gmail.com', 'Manuel', 'Naranjo Gomez', 35, '4327823N');
INSERT INTO usuario VALUES ('ricardo@gmail.com', 'Ricardo', 'Travé Gonzalez', 20, '9032683C');
INSERT INTO usuario VALUES ('pedro@gmail.com', 'Pedro', 'Navarro Molero', 43, '1432258B');

INSERT INTO apuesta VALUES (01, 01, 'Under', 2.85, 23, '2020-05-20', 'juanjo@gmail.com');
INSERT INTO apuesta VALUES (02, 04, 'Over', 2.1, 12, '2020-06-21', 'manolo@gmail.com');
INSERT INTO apuesta VALUES (03, 03, 'Over', 2.85, 35, '2020-05-25', 'ricardo@gmail.com');
INSERT INTO apuesta VALUES (04, 02, 'Under', 1.9, 20, '2020-05-22', 'manuel@gmail.com');
INSERT INTO apuesta VALUES (05, 05, 'Over', 1.54, 10, '2020-05-20', 'pedro@gmail.com');