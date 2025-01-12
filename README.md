**CONSULTAS REALIZADAS A BASE DE DATOS DE POSTGRESQL**

*REQUISITOS PREVIOS*
Paso1: Descargar pgAdmid y configurar
Paso2: Crear nuevo servidor y crear base de datos

*IMPORTAR LOS DATOS*

Utiliza la instrucción COPY para cargar los datos del CSV a la tabla:

*COPY mi_tabla FROM 'ruta/hacia/tu/archivo.csv' DELIMITER ',' CSV HEADER;*

Hacerlo desde la query tool de PgAdmin