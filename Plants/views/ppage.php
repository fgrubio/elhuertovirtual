
<!DOCTYPE html>
<title>Prueba de SELECT y MySQL</title> 
</head> 
<body> 
<?php 
  $bdconex = mysql_connect("localhost", "root", "goru");
  
  if (!$bdconex) {
  echo( "<h1>La base de datos no está disponible</h1> " .
  "<p>Por si acaso, comprueba que tienes bien los datos de la dirección, el nombre de usuario y la contraseña.</p>" );
  exit();
  }else {
  echo ("ole que funciona");
  }
  
  ?>
</body> 
</html>