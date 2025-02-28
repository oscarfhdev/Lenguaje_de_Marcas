"1. Descárgate el fichero XML 'ejercicio_1_modulos_informatica.xml' de la plataforma Moodle y realiza las siguientes consultas con XQuery.", "","",


"a. Consigue el nombre de los módulos que se imparten en el instituto (elemento):",
for $a in doc ("ejercicio_1_modulos_informatica.xml")//ies/modulos/modulo
  return $a/nombre,
"","","",



"b. Muestra el nombre de los módulos del ciclo ASIR (contenido):",
for $b in doc ("ejercicio_1_modulos_informatica.xml")//ies/modulos/modulo
  where $b/ciclo/text() = 'ASIR'
  return $b/nombre/text(),
"","","",
 
 
"c. Devuelve el nombre de los módulos que se imparten en el segundo curso de cualquier ciclo (elemento):",
for $c in doc ("ejercicio_1_modulos_informatica.xml")//ies/modulos/modulo
  where $c/curso = '2'
  return $c/nombre,
"","","",
 
  
"d. Devuelve el nombre de los módulos que se imparten en el primer curso de ASIR (elemento) y ordénalos alfabéticamente:",
for $d in doc ("ejercicio_1_modulos_informatica.xml")//ies/modulos/modulo
  where $d/ciclo/text() = 'ASIR' and $d/curso = '1'
  order by $d/nombre
  return $d/nombre,
"","","",
    
    
"e. Obtén el nombre de los módulos con menos de 5 horas semanales (contenido):",
for $e in doc ("ejercicio_1_modulos_informatica.xml")//ies/modulos/modulo
  where $e/horasSemanales < 5
  return $e/nombre/text(),
"","","",
 


"f. Devuelve el número de módulos que se imparten en el primer curso de ASIR (número):",
count(
  doc("ejercicio_1_modulos_informatica.xml")//ies/modulos/modulo[
    ciclo = 'ASIR' and curso = '1'
  ]
),
"","","",

"g. Muestra las horas semanales de los módulos con más de 3 horas semanales (contenido):",
for $g in doc("ejercicio_1_modulos_informatica.xml")//ies/modulos/modulo
    where $g/horasSemanales/number() > 3
    return $g/horasSemanales/text()
 
  