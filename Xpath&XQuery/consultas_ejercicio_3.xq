"3. Descárgate los siguientes ficheros de la plataforma Moodle y realiza las siguientes consultas con XQuery.","","",

"a. Muestra los títulos de todos los libros (contenido):",
for $a in doc ("ejercicio_3_libros.xml")//bib/libro
  return $a/titulo/text(),
"","","",
  
  
"b. Devuelve todos los títulos de los libros del año 2000. (elemento):",
for $b in doc ("ejercicio_3_libros.xml")//bib/libro
  where $b/@year = 2000
  return $b/titulo,
"","","",
  
  
"c. Devuelve todos los títulos de los libros entre el año 1995 y 2000. Ambos incluidos.
(elemento):",
for $b in doc ("ejercicio_3_libros.xml")//bib/libro
  where $b/@year >= 1995
  and $b/@year <= 2000
  return $b/titulo,
"","","",


"d. Obtén todos los títulos de los libros que tengan algún autor de apellido ‘Stevens’
(contenido):",
for $d in doc ("ejercicio_3_libros.xml")//bib/libro
  where $d/autor/apellido = 'Stevens'
  return $d/titulo/text(),
"","","",


"e. Muestra los títulos de todos los libros almacenados de la editorial 'Addison-Wesley', primero con una cláusula 'for' y, a continuación, con una cláusula 'let' (elemento):",
"for",
for $e in doc ("ejercicio_3_libros.xml")//bib/libro
  where $e/editorial = 'Addison-Wesley'
  return $e/titulo,
  "",
  
"let", 
let $e := doc ("ejercicio_3_libros.xml")//bib/libro[
  editorial = 'Addison-Wesley'
]
return $e/titulo,
"","","",


"f. Consigue todos los títulos de los libros que tengan un solo autor ordenados por precio (elemento):",
for $f in doc ("ejercicio_3_libros.xml")//bib/libro
  where count($f/autor) = 1
  order by $f/precio/number()
  return $f/titulo,
"","","",
 
  
"g. Devuelve todos los títulos de los libros que tengan más de dos autores ordenados por su título (elemento):",
for $g in doc ("ejercicio_3_libros.xml")//bib/libro
  where count($g/autor) >2
  order by $g/titulo
  return $g/titulo,
"","","",


"h. Devuelve el título y el año de cada uno de los libros junto con el número de autores de cada libro (elemento). ¿Puedes hacerlo directamente? : ",
for $h in doc("ejercicio_3_libros.xml")//bib/libro
return
  <libro>
    <titulo>{$h/titulo/text()}</titulo>
    <ano>{$h/@year/string()}</ano>
    <num_autores>{count($h/autor)}</num_autores>
  </libro>,
"","","",


"i. Repite el apartado generando el siguiente fichero XML: 
'<resumen_bib>
 <libro>
<titulo>...</titulo>
<anio>...</anio>
<num_autores>...</num_autores>
 </libro>
 <libro>
 ...
 </libro>
</resumen_bib>'","",

"Resultado: ",
<resumen_bib>
  {
    for $i in doc("ejercicio_3_libros.xml")//bib/libro
      return
        <libro>
          <titulo>{$i/titulo/text()}</titulo>
          <ano>{$i/@year/string()}</ano>
          <num_autores>{count($i/autor)}</num_autores>
        </libro>
  }
</resumen_bib>,
"","","",

"j. Devuelve los títulos de todos los libros y los apellidos de sus dos primeros autores.En el caso de que existan más de dos autores para un libro, se añade un tercer autor 'et al.' . Para ello genera el siguiente XML:
'<resumen_bib>
    <libro>
        <titulo>...</titulo>
        <autores>
            <apellido>...</apellido>
        </autores>
    </libro>
    <libro>
        <titulo>...</titulo>
        <autores>
            <apellido>...</apellido>
            <apellido>...</apellido>
            <apellido>et al.</apellido>
        </autores>
    </libro>
    <libro>
        ...
    </libro>
</resumen_bib>'","",

"Resultado: ",
<resumen_bib>
  {
    for $j in doc("ejercicio_3_libros.xml")//bib/libro
    return
      <libro>
        <titulo>{$j/titulo/text()}</titulo>
        <autores>
          {
            for $a in $j/autor[position() <= 2]
            return 
              <apellido>{$a/apellido/text()}</apellido>
          }
          {
            if (count($j/autor) > 2) then
              <apellido>et al.</apellido>
          }
        </autores>
      </libro>
  }
</resumen_bib>,
"","","",


"k. Devuelve los títulos de todos los libros, su editorial y los comentarios del mismo, si es que tiene algún comentario. Si no tiene, usarás la etiqueta <sin_comentario/>. 
Para ello genera el siguiente XML:
'<resumen_bib_com>
  <libro>
    <titulo>...</titulo>
    <editorial>...</editorial>
    <comentario>...</comentario>
  </libro>
  <libro>
    <titulo>...</titulo>
    <editorial>...</editorial>
    <sin_comentario/>
  </libro>
  <libro>
    <titulo>...</titulo>
    <editorial>...</editorial>
    <comentario>...</comentario>
  </libro>
</resumen_bib_com>'","",

"Resultado: ",
<resumen_bib_com>
  {
    for $k in doc("ejercicio_3_libros.xml")//bib/libro
    return
      <libro>
        <titulo>{$k/titulo/text()}</titulo>
        <editorial>{$k/editorial/text()}</editorial>
        {
          let $comentario := doc("ejercicio_3_libros_comentarios.xml")//comentarios/entrada[titulo/text() = $k/titulo/text()]/comentario
          return
            if ($comentario) then
              <comentario>{$comentario/text()}</comentario>
            else
              <sin_comentario/>
        }
      </libro>
  }
</resumen_bib_com>,
"","","",


"l. Consigue los títulos de todos los libros en los que al menos uno de sus autores es 'Stevens' (elemento). Usa 'some'. Este cuantificador existencial permite definir consultas que devuelvan algún elemento que satisfaga la condición: ",
for $l in doc("ejercicio_3_libros.xml")//bib/libro
where some $autor in $l/autor/apellido satisfies $autor = 'Stevens'
return $l/titulo,
"","","",


"m. Devuelve todos los títulos de los libros en los que todos los autores sean 'Stevens' (elemento). Usa 'every'. Este cuantificador existencial permite devolver los elementos en los que todos sus nodos satisfagan la condición. ",
for $l in doc("ejercicio_3_libros.xml")//bib/libro
where every $autor in $l/autor/apellido satisfies $autor = 'Stevens'
return $l/titulo,
"","","",


"n. Devuelve todos los apellidos distintos de los autores (elemento). Usa 'distinct-values()'. Esta función extrae los valores de una secuencia de nodos y crea una nueva secuencia con valores únicos eliminando los nodos duplicados: ",
for $n in distinct-values(doc("ejercicio_3_libros.xml")//bib/libro/autor/apellido)
    return
    <apellido>{$n}</apellido>,
"","","",

"o. Usa 'empty()' y 'exists()' en dos consultas distintas inventadas por ti. La función 'empty()' devuelve cierto cuando la expresión entre paréntesis está vacía. La función opuesta a 'empty()' es 'exists()', la cual devuelve cierto cuando una secuencia contiene, al menos, un elemento.","",

"Uso de 'empty':",
let $titulo := "TCP/IP Illustrated"
let $libro := doc("ejercicio_3_libros.xml")//bib/libro[titulo = $titulo]
  
return 
  if (empty($libro/autor)) then
    <mensaje>No hay autores para el libro {$titulo}.</mensaje>
  else
    <mensaje>El libro {$titulo} tiene autores.</mensaje>,
"","",
"Uso de 'exists':",
let $apellido := "Fernandez"
let $autor := exists(doc("ejercicio_3_libros.xml")//bib/libro/autor/apellido[. = $apellido])

return 
  if ($autor) then
    <mensaje>Existen libros escritos por autores con el apellido {$apellido}</mensaje>
  else
    <mensaje>No existen libros escritos por autores con el apellido {$apellido}.</mensaje>




