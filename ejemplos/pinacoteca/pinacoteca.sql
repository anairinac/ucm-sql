/*--------------------------------------------------------------
Proyecto:   Ejemplo Pinacoteca
Archivo:    ejemplos/pinacoteca.sql
Autor:      Irina Calvo
Fecha:      22-10-2025
DB:         MySQL Ver 9.4.0 for macos15 on arm64 (MySQL Community Server - GPL)
Curso:      Bases de Datos SQL
Programa:   Master Big Data, Data Science, AI
Universidad Complutense
--------------------------------------------------------------*/
-- create database
DROP DATABASE IF EXISTS ejemplo_pinacoteca;
CREATE DATABASE ejemplo_pinacoteca;
USE ejemplo_pinacoteca;

-- pinacoteca
DROP TABLE IF EXISTS pinacoteca;
CREATE TABLE pinacoteca (
    nombre VARCHAR(60) PRIMARY KEY, 
    ciudad VARCHAR(60), 
    direccion VARCHAR(100), 
    superficie SMALLINT
);

-- escuela
DROP TABLE IF EXISTS escuela;
CREATE TABLE escuela ( 
    codigo SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(60), 
    pais VARCHAR(60), 
    fechaAparicion DATE
);

-- mecenas
DROP TABLE IF EXISTS mecenas;
CREATE TABLE mecenas (
    codigo SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(60), 
    pais VARCHAR(60), 
    fechaNacimiento DATE, 
    fechaDefuncion DATE
);

-- pintor
DROP TABLE IF EXISTS pintor;
CREATE TABLE pintor (
    codigo SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60), 
    pais VARCHAR(60), 
    ciudad VARCHAR(60), 
    fechaNacimiento DATE, 
    fechaDefuncion DATE
);

-- cuadro
DROP TABLE IF EXISTS cuadro;
CREATE TABLE cuadro (
    codigo SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(60), 
    ancho SMALLINT, 
    alto SMALLINT, 
    fechaPintado DATE, 
    tecnica VARCHAR(25), 
    codigoPinacoteca VARCHAR(60) NOT NULL, 
    codigoPintor SMALLINT NOT NULL,
    FOREIGN KEY (codigoPinacoteca) REFERENCES pinacoteca(nombre) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (codigoPintor) REFERENCES pintor(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- protege_a
DROP TABLE IF EXISTS protege_a;
CREATE TABLE protege_a (
    codigoMecenas SMALLINT,
    codigoPintor SMALLINT,
    PRIMARY KEY (codigoMecenas, codigoPintor),
    FOREIGN KEY (codigoMecenas) REFERENCES mecenas(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (codigoPintor) REFERENCES pintor(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- pertenece_a
DROP TABLE IF EXISTS pertenece_a;
CREATE TABLE pertenece_a (
    codigoPintor SMALLINT,
    codigoEscuela SMALLINT,
    PRIMARY KEY (codigoPintor, codigoEscuela),
    FOREIGN KEY (codigoPintor) REFERENCES pintor(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (codigoEscuela) REFERENCES escuela(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- es_maestro
DROP TABLE IF EXISTS es_maestro;
CREATE TABLE es_maestro (
    codigoMaestro SMALLINT,
    codigoDiscipulo SMALLINT,
    PRIMARY KEY (codigoMaestro, codigoDiscipulo),
    FOREIGN KEY (codigoMaestro) REFERENCES pintor(codigo) ON DELETE CASCADE,
    FOREIGN KEY (codigoDiscipulo) REFERENCES pintor(codigo) ON DELETE CASCADE
);



