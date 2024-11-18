/*CONSULTA 1: Obtener el título, tipo y duración de todos los shows que tienen una
duración mayor a 1 hora o más de 1 temporada.*/
SELECT
    title,
type,
duration
FROM
    titles
WHERE
type = 'Movie'
AND SUBSTRING(duration, '[0-9]+')::INTEGER > 60
OR
type = 'TV Show'
AND SUBSTRING(duration, '[0-9]+')::INTEGER > 1
ORDER BY
type;

/*CONSULTA 2: Contar cuántos shows tienen una calificación de "TV-MA"*/
SELECT
    count(rating) AS count_rating_tv_ma
FROM
    titles
WHERE
    rating = 'TV-MA';

/*CONSULTA 3: Listar los títulos de los shows que fueron añadidos después del 1 de
septiembre de 2021 y que son del país "United States".*/
/*NOTA: Columna date_added mayor al primero de septiembre 2021 y especifica
que pais sea solo United States y no que se encuentre inluido en una lista de paises*/
SELECT
    title
FROM
    titles
WHERE
    date_added > '2021-09-01'
    AND country = 'United States';

/*CONSULTA 4: Ranking de duracion de shows por tipo.*/
/*No especificaba si el valor minimo o maximo seria el top 1*/
SELECT
type,
duration,
RANK() OVER (
    PARTITION BY
    type
    ORDER BY
        (SUBSTRING(duration, '[0-9]+'))::INTEGER ASC
)
FROM
    titles;

/*CONSULTA 5: Número acumulativo de shows añadidos por fecha.*/
/*Ordené los datos por fecha en orden ascendente para una mejor visualizacion*/
/*Conteo de shows añadidos por cada fecha*/
SELECT
    date_added,
    count(show_id)
FROM
    titles
GROUP BY
    date_added
ORDER BY
    date_added;

/*Por si el enunciado se refiere a una frecuencia acumulada*/
SELECT
    date_added,
    COUNT(show_id) AS registro,
    SUM(COUNT(show_id)) OVER(
        ORDER BY date_added
    ) AS frecuencia_acumulada
FROM
    titles
GROUP BY date_added;

/*CONSULTA 6: Promedio móvil de la cantidad de shows añadidos por fecha.*/
SELECT
    date_added,
    COUNT(show_id),
    AVG(COUNT(show_id)) OVER (
        ORDER BY
            date_added ASC ROWS BETWEEN 6 PRECEDING
            AND CURRENT ROW
    ) AS promedio_movil
FROM
    titles
GROUP BY
    date_added;

/*CONSULTA 7: Sumar el número de shows por país hasta cada fecha.*/
SELECT
    country,
    date_added,
    COUNT(show_id) AS show,
    SUM(COUNT(show_id)) OVER(
        PARTITION BY country
        ORDER BY date_added
    ) AS suma_acumulativa
FROM
    titles
GROUP BY
    country,
    date_added;

/*Consulta 8: Número de shows con el mismo release_year y rating.*/
SELECT
    release_year,
    rating,
    count(show_id)
FROM
    titles
GROUP BY
    release_year,
    rating
ORDER BY
    release_year;

/*Consulta 9: Diferencia de días entre shows consecutivos añadidos.*/
SELECT
    title,
    date_added,
    date_added-LAG(date_added) OVER(
        ORDER BY date_added
    ) AS diff_days
FROM
    titles;

/*Consulta 10: Ranking de shows por fecha de lanzamiento dentro del mismo año.*/
/*Enunciado dice fecha de lanzamiento, no de agregacion*/
select
    release_year,
    count(title) AS title_count,
    RANK() OVER(
        ORDER BY release_year
    )
FROM
    titles
GROUP BY
    release_year




