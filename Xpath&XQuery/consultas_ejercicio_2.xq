"2. Descárgate el fichero XML 'ejercicio_2_bailes.xml' de la plataforma Moodle y realiza las siguientes consultas con XQuery.","",


"a. Muestra el nombre de todos los bailes (contenido):",
for $a in doc ("ejercicio_2_bailes.xml")//bailes/baile
return $a/nombre/text(),
"","","",


"b. Consigue el nombre de todos los bailes que se realizan en la sala número uno (elemento).",
for $b in doc ("ejercicio_2_bailes.xml")//bailes/baile
  where $b/sala/number() = 1
  return $b/nombre,
"","","",


"c. Muestra todos los bailes con toda su información que se imparten en la sala número dos y cuyo precio sea menor que 35,00 EUROS (elemento):",
for $c in doc ("ejercicio_2_bailes.xml")//bailes/baile
  where $c/sala/number() = 2 
  and $c/precio/@moneda = 'euro' 
  and $c/precio < 35
  return $c,
"","","",  


"d. Obtén el nombre de todos los profesores que dan clase con cuotas mensuales (contenido):",
for $d in doc ("ejercicio_2_bailes.xml")//bailes/baile
  where $d/precio/@cuota = 'mensual'
  return $d/profesor/text(),
"","","",


"e. Genera un nuevo documento XML que almacena la información de los bailes que imparte el profesor 'Jesús Lozano' con la siguiente estructura:",
<bailes_lozano profesor="Jesús Lozano">
{
  for $e at $num in doc("ejercicio_2_bailes.xml")//bailes/baile
  where $e/profesor = "Jesús Lozano"
  return
    <baile num="{$num}">
      <nombre>{$e/nombre/text()}</nombre>
      <plazas>{$e/plazas/text()}</plazas>
      <duracion>Inicio el {$e/comienzo/text()}, final el {$e/fin/text()}</duracion>
    </baile>
}
</bailes_lozano>,
"","","",


"f. Genera un documento HTML con una tabla HTML que muestre el nombre del baile, el profesor que lo imparte y el número de plazas ofertadas, pero estableciendo la condición de ser bailes con cuota trimestral. Además, se ordenarán de menor a mayor los bailes según el número de plazas disponibles:",
<html>
  <head>
    <title>Bailes de Cuotas Trimestrales</title>
  </head>
  <body>
    <table border="4" >
      <tr>
        <th>Baile</th>
        <th>Profesor</th>
        <th>Plazas</th>
       </tr>
        {
           for $f in doc("ejercicio_2_bailes.xml")//bailes/baile
           where $f/precio/@cuota='trimestral'
           order by $f/plazas
           return 
           <tr>
             <td>{$f/nombre/text()}</td>
             <td>{$f/profesor/text()}</td>
             <td>{$f/plazas/text()}</td>
          </tr>
       }
    </table>
  </body>
</html>
