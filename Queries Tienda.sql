-- IT Academy C1_S2_Queries
-- Author Miquel Debon Villagrasa

-- TABLES Tienda
USE tienda;

-- 1. Llista el nom de tots els productes que hi ha en la taula producto.
SELECT * FROM producto;

-- 2. Llista els noms i els preus de tots els productes de la taula producto.
SELECT nombre, precio 
FROM producto;

-- 3. Llista totes les columnes de la taula producto.
SHOW COLUMNS FROM producto;

-- 4. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio as "Precio €", CAST(precio * 1.1 AS DECIMAL(10,2)) as "Precio $"
FROM producto;

-- 5. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
SELECT nombre as nom , precio as "euros", precio * 1.1  as "dòlars"
FROM producto;

-- 6. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre) as NombreMajuscula, precio
FROM producto;

-- 7. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre) as NombreMinuscula, precio
FROM producto;

-- 8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, UPPER(SUBSTRING(nombre,1,2)) as nombre2 -- UPPER(LEFT(nombre, 2))
FROM fabricante ;


-- 9. Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
SELECT nombre as Nombre, precio as "Precio €", CAST(precio * 1.1 AS DECIMAL(10,2)) as "Precio $"
FROM producto;

-- 10. Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.


-- 11. Llista el codi dels fabricants que tenen productes en la taula producto.
-- 12. Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
-- 13.Llista els noms dels fabricants ordenats de manera ascendent.
-- 22. Llista els noms dels fabricants ordenats de manera descendent.
-- 23. Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
-- 24. Retorna una llista amb les 5 primeres files de la taula fabricante.
-- 25.Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
-- 26. Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
-- 27. Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
-- 28. Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
-- 29. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
-- 30. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
-- 31. Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
-- 32. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
-- 33. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
-- 34. Retorna una llista de tots els productes del fabricant Lenovo.
-- 35. Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
-- 36. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
-- 37. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Fent servir l'operador IN.
-- 38. Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
-- 39. Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
-- 40. Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
-- 41. Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
-- 42. Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
-- 43. Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
-- 44. Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- 45. Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
-- 46. Llista el nom del producte més car del fabricant Lenovo.
-- 47. Llista el nom del producte més barat del fabricant Hewlett-Packard.
-- 48. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
-- 49. Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.