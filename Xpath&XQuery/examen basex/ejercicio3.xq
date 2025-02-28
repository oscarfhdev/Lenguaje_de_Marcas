"Ejercicio 3",
"",
for $a in doc("records.xml")//records/record/country
order by $a
group by $a
return
<span>{concat("El país ", $a, " se repite " ,count(doc("records.xml")//records/record[country=$a]), " veces con los siguientes nombres")}
{
for $b in doc("records.xml")//records/record
    where $b/country = $a
    return
    <b>{$b/name/text()}</b>
}
  
</span>

