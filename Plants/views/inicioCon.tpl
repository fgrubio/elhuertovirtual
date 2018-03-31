<!DOCTYPE html>

<html>
<head>
  <title>MiHuerto</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/15/15739.png" 
  type="image/x-icon" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,900|Montserrat:800">
  <link rel = 'stylesheet' href = '/static/css/esInicio1.css'>
   
</head>

<header>
  <div class="topnav">
      <b href="">
        <img src="https://image.flaticon.com/icons/png/512/15/15739.png" width="40" height="40">
      </b>
      <b href="">Mi Huerto</b>
  </div>
</header>
<body>
<div class="div1"></div>
<h2 class="hey">Bienvenido</h2>
<h2 class="hey">Se ha detectado un huerto exitente,</h2>
<h2 class="hey">¿Que desea hacer?</h2>
<br><br>
<div align="center">
  <input type="button" onclick="location.href='/actual';" value="Seguir con el actual" class="boton">
  <input type="button" onclick="fuera()" value="Eliminar actual y empezar de nuevo" class="boton">
</div>
</body>
<footer align="center">
  <h1><img src="https://png.icons8.com/metro/1600/copyright.png" width="9" height="9"/>    by Felipe and David for Sparsity </h1>
</footer>
<script>
function fuera() {
  var r = confirm("¿Estas seguro que quieres eliminar la actual?");
  if (r == true) {
      location.href="/createtable"
  } else {
      location.href= "/"
  }
}
</script> 
</html>