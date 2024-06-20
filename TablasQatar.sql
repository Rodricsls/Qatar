CREATE TABLE Grupos(
	grupo VARCHAR(1),
	llave_p VARCHAR(1),
	llave_s VARCHAR(1),
	PRIMARY KEY(grupo)
);

CREATE TABLE Selecciones(
	pais VARCHAR(20),
	grupo VARCHAR(1),
	participaciones INT,
	campeon INT,
	f_afiliado DATE,
	puntos INT,
	goles_f INT,
	goles_c INT,
	PRIMARY KEY (pais),
	FOREIGN KEY (grupo) REFERENCES Grupos(grupo)
);

CREATE TABLE Jugadores_Seleccionados(
	nombres VARCHAR(30),
	apellidos VARCHAR(30),
	dorsal INT,
	pais VARCHAR(20),
	f_nacimiento DATE,
	pierna VARCHAR(1),
	pos VARCHAR(20),
	goles INT,
	asistencias INT,
	penales INT,
	minutos INT,
	PRIMARY KEY (pais,dorsal),
	FOREIGN KEY (pais) REFERENCES Selecciones(pais) ON DELETE CASCADE 
);

CREATE TABLE Staff(
	nombres VARCHAR(30),
	apellidos VARCHAR(30),
	pais VARCHAR(20),
	f_nacimiento DATE,
	rol VARCHAR(20),
	PRIMARY KEY (pais,rol),
	FOREIGN KEY (pais) REFERENCES Selecciones(pais) ON DELETE CASCADE 
);

CREATE TABLE Partidos(
	id_partido SERIAL,
	ganador VARCHAR(20),
	fase VARCHAR(20),
	paisL VARCHAR(20),
	paisV VARCHAR(20),
	estadio VARCHAR(20),
	PRIMARY KEY(id_partido),
	FOREIGN KEY(paisL) REFERENCES Selecciones(pais),
	FOREIGN KEY(paisV) REFERENCES Selecciones(pais),
	FOREIGN KEY (estadio) REFERENCES Estadios(nombre)
);

CREATE TABLE Arbitros(
	ref_id Serial,
	nombres VARCHAR(30),
	apellidos VARCHAR(30),
	pais VARCHAR(20),
	f_nacimiento DATE,
	puesto VARCHAR(20),
	PRIMARY KEY (ref_id)
);

CREATE TABLE Colegiados(
	ref_id INT NOT NULL,
	id_partido INT NOT NULL,
	PRIMARY KEY (ref_id, id_partido),
	FOREIGN KEY (ref_id) REFERENCES Arbitros(ref_id) ON DELETE CASCADE,
    FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido) ON DELETE CASCADE
);

CREATE TABLE Titulares(
	dorsal INT NOT NULL,
	pais VARCHAR(20) NOT NULL,
	id_partido INT NOT NULL,
	PRIMARY KEY (dorsal,pais, id_partido),
	FOREIGN KEY (pais,dorsal) REFERENCES Jugadores_Seleccionados(pais,dorsal) ON DELETE CASCADE,
    FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido) ON DELETE CASCADE
);


CREATE TABLE Estadios(
	nombre VARCHAR (20),
	ciudad VARCHAR (20),
	capacidad INT,
	PRIMARY KEY (nombre)
);


CREATE TABLE Goles_Asistencias(
	gol_id Serial,
	id_partido INT NOT NULL,
	tipo VARCHAR (10),
	d_goleador INT NOT NULL,
	p_goleador VARCHAR(20) NOT NULL,
	d_asistidor INT,
	p_asistidor VARCHAR(20),
	PRIMARY KEY(gol_id),
	FOREIGN KEY(id_partido) REFERENCES Partidos(id_partido),
	FOREIGN KEY (p_goleador, d_goleador) REFERENCES Jugadores_Seleccionados(pais,dorsal)
);



CREATE TABLE Balon_Parado(
	accion_id SERIAL,
	tipo VARCHAR(20),
	pais VARCHAR (20) NOT NULL,
	dorsal INT NOT NULL,
	id_partido INT NOT NULL,
	PRIMARY KEY (accion_id),
	FOREIGN KEY(id_partido) REFERENCES Partidos(id_partido),
	FOREIGN KEY (pais, dorsal) REFERENCES Jugadores_Seleccionados(pais,dorsal)
);


CREATE TABLE Tarjetas(
	id_tarjeta SERIAL,
	color VARCHAR (10),
	pais VARCHAR (20) NOT NULL,
	dorsal INT NOT NULL,
	id_partido INT NOT NULL,
	PRIMARY KEY (id_tarjeta),
	FOREIGN KEY(id_partido) REFERENCES Partidos(id_partido),
	FOREIGN KEY (pais, dorsal) REFERENCES Jugadores_Seleccionados(pais,dorsal)
);





