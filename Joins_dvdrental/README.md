*REQUISITOS*
Descargar base de datos de esta pagina web y seguir tutorial para importar
https://neon.tech/postgresql/postgresql-getting-started/postgresql-sample-database

*CONSULTAS SOLICITADAS A BASE DE DATOS*

1.	Se está haciendo un análisis de la proporción entre el costo de reemplazo por pérdida y la tarifa de alquiler de cada película. Se necesita listar las películas cuyo costo de reemplazo sea menor que cuatro veces la tarifa de alquiler.

2.	Se necesita filtrar las películas que fueron lanzadas en el año 2006, que se alquilan a $0.99 o $2.99, que tienen un costo de reemplazo inferior a $19.99, que tienen una duración de entre 90 y 150 minutos, que tienen clasificación ‘G’, ‘PG’ o ‘PG-13’, que se rentan por 5 días o menos y que sean de alguna de las categorías ‘Comedy’, ‘Family’ o ‘Children’. Cree un query que devuelva la lista de títulos que cumplen con todos esos filtros.

3.	Se necesita crear el reporte de Rentas del Día, que consiste en la información de todas las rentas registradas en una fecha en particular. Escriba un query que genere este reporte para una fecha fija, por ejemplo el 31 de julio de 2005. El reporte debe mostrar las rentas de esa fecha en orden cronológico. El reporte debe incluir las siguientes columnas:
    a)	“Fecha de Renta”, en este formato, como ejemplo: 31-JUL-2005
    b)	“Hora de Renta”, en este formato, como ejemplo: 15:30 (formato de 24 horas, sin am/pm)
    c)	“Título” (de la película)
    d)	“Nombre del Cliente” (Primer nombre seguido del apellido)
    e)	“Email del Cliente”
    f)	“Teléfono del Cliente”
    g)	“Dirección Completa del Cliente”, en este formato: Dirección Base. Distrito, Código Postal. Ciudad, País. 
    h)	“Nombre del Empleado” (Primer nombre seguido de apellido)

4.	Genere un reporte que muestre las rentas del día: Fecha y hora de renta, datos del cliente (nombre completo, teléfono y país de residencia); y datos del empleado que registra la renta (nombre completo, teléfono y país de residencia). Use en el query una fecha fija como ejemplo del filtro.

5.	Se piensa que hay un problema con la congruencia de los datos entre la tarifa de renta de cada película y el monto pagado realmente por rentarla. Escriba un query que muestre todas las rentas efectuadas en agosto de 2005 en las que la tarifa de renta de la película (según la tabla film) NO coincida con el monto pagado realmente (según la tabla payment). Suponga que cada renta de ese periodo está asociada a un solo pago en la tabla payment.
