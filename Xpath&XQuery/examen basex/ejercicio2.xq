"Ejercicio 2",
"",
<html>
  <head>
    <title>Beatles y su Web</title>
  </head>
  <body>
    {
      for $a in doc("beatles.xml")//beatle
      return
      <span>{concat("El beatle ", $a/name/firstname, "",$a/name/lastname, " tiene una web llamada ", $a/@link/string())}</span>
    }
  </body>
</html>