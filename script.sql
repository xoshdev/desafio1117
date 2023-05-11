-- Deployment: Desafío 1117: Desafío - Manipulación de datos y transaccionalidad en las operaciones.

--Name Database: desafio2-Jose-Cheuquepil-002

-- 1.Crear tabla: INSCRITOS

    /*Query: */

create table inscritos (
    cantidad INT,
    fecha DATE,
    fuente varchar
);

-- ingreso de datos

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

select * from inscritos;

--1.Cuántos registros hay?

    -- Respuesta: 16 registros.

    --Query:

SELECT COUNT(*) FROM inscritos;

--2.¿Cuántos inscritos hay en total?

    -- Respuesta: el total es 774 inscritos.

    -- Query:

SELECT SUM(cantidad) FROM inscritos;

--3.¿Cuál o cuáles son los registros de mayor antigüedad?

    /* Respuesta:
        cantidad   	fecha		fuente
        44	    	1/1/2021	Blog
        56	    	1/1/2021	Página */

    -- Query:

SELECT *
    FROM inscritos
    WHERE fecha = (SELECT MIN(fecha) FROM inscritos);

--- 4.¿Cuántos inscritos hay por día?

    /* Respuesta: 

    fecha		inscritos_por_dia
    2021-02-01		120
    2021-08-01		182
    2021-05-01		88
    2021-04-01		93
    2021-06-01		30
    2021-07-01		58
    2021-03-01		103
    2021-01-01		100 */

    --Query:

SELECT fecha, SUM(cantidad) AS inscritos_por_dia

    FROM inscritos
    GROUP BY fecha;

-- 5.¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?

/* Respuesta:

    fecha	    inscritos_por_dia
    2021-08-01  	182 */

    --Query:

SELECT fecha, SUM(cantidad) AS inscritos_por_dia
    FROM inscritos
    GROUP BY fecha
    ORDER BY inscritos_por_dia DESC
    LIMIT 1;

-- Fin.