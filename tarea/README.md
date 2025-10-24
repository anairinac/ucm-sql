# EJEMPLO PINACOTECA

## *Bases de Datos SQL*

**Irina Calvo**

Máster Big Data, Data Science, Inteligencia Artificial  
Universidad Complutense \- NTIC

# ENUNCIADO

El ministerio encargado de temas culturales de cierto país quiere mantener información acerca de todos los cuadros que se encuentran en sus pinacotecas y toda la información relacionada con ellos. 

De cada pinacoteca se desea saber el nombre (que se supone único) , la ciudad en que se encuentra, la dirección y los metros cuadrados que tiene.

Cada pinacoteca tiene una serie de cuadros de los que quiere mantener información acerca de su código, nombre, dimensiones, fecha en que fue pintado y técnica utilizada.

Cada cuadro es pintado por un determinado pintor (nombre, país, ciudad, fecha de nacimiento y fecha de defunción si procede). Un pintor puede tener a otro como maestro; a su vez, un maestro puede serlo de varios (o de ninguno).

Los pintores pueden pertenecer o no a una escuela de la que se desea saber su nombre y en qué país y en qué fecha apareció.

Los pintores pueden tener también uno o varios mecenas que les protegen (nombre, país, fecha de nacimiento y fecha de defunción si procede). A su vez un mismo mecenas puede serlo de varios pintores.


# DISEÑO ENTIDAD-RELACIÓN

En esta sección se desarrolla el modelo conceptual de la base de datos a trabajar, utilizando un diagrama Entidad-Relación, haciendo uso de la notación Chen para describir entidades, relaciones, atributos, cardinalidades e interdependencias.

El primer diagrama hace uso de la variante original numérica de Peter Chen, presentada por el mismo en su artículo "*The Entity–Relationship Model: Toward a Unified View of Data*" en 1976\.


![](Numerico.png)

Este segundo diagrama hace uso de la variante simbólica de Chen:  

![](Simbolico.png)

Este último diagrama utiliza la variante híbrida de Chen, la cual hemos completado además con los atributos de cada entidad.  

![](Completo.png)

# MODELO RELACIONAL

En esta sección se muestra la conversión, paso a paso, del modelo conceptual desarrollado anteriormente al modelo lógico relacional correspondiente.

## Esquema de base de datos

Pasamos las tablas al esquema, incluyendo las relaciones, descritas en negrita:

pinacoteca ( nombre, ciudad, direccion, superficie )

cuadro ( codigo, nombre, ancho, alto, fechaPintado, tecnica, **codigoPinacoteca**, **codigoPintor** )

pintor ( codigo, nombre, pais, ciudad, fechaNacimiento, fechaDefunción )

mecenas ( codigo, nombre, pais, fechaNacimiento, fechaDefunción )

escuela ( codigo, nombre, pais, fechaAparicion )

**es_maestro ( codigoMaestro, codigoDiscipulo )**

**protege_a ( codigoMecenas, codigoPintor )**

**pertenece_a ( codigoPintor, codigoEscuela )**

## Modelado de tablas

Con esta información, podemos finalizar el modelo relacional de nuestras tablas:

![](Relacional.png)

# SCRIPT COMPLETO

Adjunto a este documento se encuentra el archivo en formato SQL llamado **IrinaCalvo.sql** con el código resultante. También podemos encontrar su contenido en el [repositorio de GitHub](https://github.com/anairinac/ucm-sql/blob/main/tarea/IrinaCalvo.sql) correspondiente, así como en la siguiente sección:

https://github.com/anairinac/ucm-sql/blob/3f4d72993e606a72530c769f35305e8cb4be6c14/ejemplos/pinacoteca/pinacoteca.sql#L1-L98