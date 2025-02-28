"Ejercicio 1",
"",
"a) Devuelve el título en formato texto de aquellos libros que no su género (genre) no sea Computers y el precio sea inferior a 5",
for $a in doc("books.xml")//catalog/book[genre/text() != 'Computer' and price/number()< 5] 
return $a/title/text(),
"","","",
"b) continuación, devuelve en número entero cuántos son estos libros",
count(doc("books.xml")//catalog/book[genre/text() != 'Computer' and price/number()< 5])