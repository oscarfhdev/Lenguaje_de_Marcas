"4. Descárgate el fichero XML 'ejercicio_4_clase.xml' de la plataforma Moodle y realiza las siguientes consultas con XQuery.","","",

"a. Obtener el número de alumnos de la clase (número):",
count(doc("ejercicio_4_clase.xml")//clase/alumnos/alumno),
"","","",


"b. Obtener el número de módulos que se imparten (número).",
count(doc("ejercicio_4_clase.xml")//clase/asignaturas/asignatura),
"","","",

"c. Obtener el nombre y apellidos de todos los alumnos matriculados en algún módulo, es decir que tenga alguna nota (elemento). Usa el operador unión.",
let $alumnosynotas := distinct-values(doc("ejercicio_4_clase.xml")//clase/notas/nota/@alum)
let $alumnos := 
  for $c in doc("ejercicio_4_clase.xml")//clase/alumnos/alumno
  where $c/@cod = $alumnosynotas
  return $c/apenom

return $alumnos union $alumnos,
"","","",


"d. Obtener las calificaciones del alumno de código 'n43483437' en cada uno de sus módulos. Para ello genera el siguiente XML:
'<alumno cod='n88234942'>
   <modulo>
    <nombre_modulo>...</nombre_modulo>
    <nota>...</nota>
   </modulo>
   <modulo>
       ...
   </modulo>
</alumno>'","",

"Resultado",
<alumno cod="n43483437">
  {
    for $d in doc("ejercicio_4_clase.xml")//clase/notas/nota
    where $d/@alum = 'n43483437'
    return 
      <modulo>
        <nombre_modulo>{doc("ejercicio_4_clase.xml")//clase/asignaturas/asignatura[@cod = $d/@asig]/@nombre/string()}</nombre_modulo>
        <nota>{$d/@calificacion/number()}</nota>
      </modulo>
  }
</alumno>,
"","","",


"e. Obtener los nombres de los alumnos matriculados en LMSGI y sus notas. El resultado estará ordenado por notas de forma descendente.
Para ello genera el siguiente XML:
'<lmsgi>
   <alumno>
      <nombre>...</nombre>
      <nota>...</nota>
   </alumno>
   <alumno>
      ...
   </alumno>
</lmsgi>'","",

"Resultado:",
<lmsgi>
{
   for $e in doc("ejercicio_4_clase.xml")//clase/notas/nota[@asig = 'a4']
   let $alumno := doc("ejercicio_4_clase.xml")//clase/alumnos/alumno[@cod = $e/@alum]
   return 
     <alumno>
       <nombre>{$alumno/apenom/text()}</nombre>
       <nota>{$e/@calificacion/number()}</nota>
     </alumno>
}
</lmsgi>,
"","","",

"f. Repite el ejercicio anterior, pero muestra solo los alumnos que hayan aprobado:",
<lmsgi>
{
   for $f in doc("ejercicio_4_clase.xml")//clase/notas/nota[@asig = 'a4' and number(@calificacion) >= 5]
   let $alumno := doc("ejercicio_4_clase.xml")//clase/alumnos/alumno[@cod = $f/@alum]
   return 
     <alumno>
       <nombre>{$alumno/apenom/text()}</nombre>
       <nota>{$f/@calificacion/number()}</nota>
     </alumno>
}
</lmsgi>



