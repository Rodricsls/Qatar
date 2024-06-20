


/*Consulta que nos dará la tabla para la bota de oro*/
SELECT nombres, penales, minutos, goles, asistencias
FROM Jugadores_Seleccionados
ORDER BY goles DESC, asistencias DESC, minutos ASC, penales ASC;

/*Esta consulta nos mostrara los 2 paises clasificados a Octavos por Grupo*/
SELECT grupo, pais, puntos, goles_f, goles_c,llave_s,llave_p
FROM (
    SELECT S.grupo, S.pais, G.llave_p, G.llave_s, S.puntos, S.goles_f, S.goles_c,
           ROW_NUMBER() OVER (PARTITION BY S.grupo ORDER BY S.grupo) AS n
    FROM Selecciones S, Grupos G
    WHERE S.grupo = G.grupo
) f
WHERE n <= 2
ORDER BY grupo, puntos, goles_f, goles_c DESC;


/*Consulta que agregara los partidos dependiendo del ganador a las siguientes fases eliminatorias*/
INSERT INTO Partidos(paisV,paisL,fase,estadio)
SELECT D.ganador AS paisV, L.ganador AS paisL,'Siguiente Fase' AS fase, 'estadio' AS estadio
FROM (SELECT ganador FROM Partidos WHERE fase='Fase Actual' AND id_partido%2!=0)D,
	(SELECT ganador FROM Partidos WHERE fase='Fase Actual' AND id_partido%2=0)L
	
	
/*Consulta para agregar informacion de un partido*/

INSERT INTO Partidos (fase, paisL, paisV, estadio)
VALUES ('fase Actual', 'Pais A', 'Pais B', 'estadio');

INSERT INTO Titulares (id_partido, dorsal, pais)

INSERT INTO Colegiados (id_partido, id_ref)



