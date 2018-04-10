<!DOCTYPE html>
<html>
<head>
  <title>MiHuerto | Error</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/15/15739.png" 
  type="image/x-icon" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,900|Montserrat:800">
  <link rel = 'stylesheet' href = '/static/css/esInicio1.css'>
</head>
<header>
  <div class="topnav">
    <a href="/actual">
    <img src="https://image.flaticon.com/icons/svg/17/17699.svg" width="40" height="40">
    </a>
    <b href="">
    <img src="https://image.flaticon.com/icons/png/512/15/15739.png" width="40" height="40">
    </b>
    <b href="">Mi Huerto</b>
    <c href="">|</c>
    <c href="">Error al añadir tipo {{.planta.Tipo}}</c>
  </div>
</header>
<body>
  <div class="div1"></div>
  <h2> El tipo {{.planta.Tipo}} ya se está cultivando en el huerto. </h2>
  <h2> Puede hacer lo siguiente: </h2>
  </p>
  <br><br>
  <div align="center">
    <input type="button" onclick="editar({{.planta.ID}})" value="Canviarle tipo" class="boton">
    <input type="button" onclick="eliminar({{.planta.ID}})" value="Eliminar el ya existente y añadir el nuevo" class="boton">
    <input type="button" onclick="actualizar({{.planta.ID}})" value="Actualizar el ya existente con los valores nuevos" class="boton">
    <input type="button" onclick="location.href= '/actual'" value="Cancelar" class="boton">
  </div>
</body>
<footer align="center">
  <h1><img src="https://png.icons8.com/metro/1600/copyright.png" width="9" height="9"/>    by Felipe and David for Sparsity </h1>
</footer>
<script>
  function eliminar(s) {
    var r = confirm("¿Estas seguro que quieres eliminar la planta existente y añadir el nuevo?");
    if (r == true) {
        location.href= "/elim2?key=" + s + 
        "&tipo="+ {{.plantanueva.Tipo}} + 
        "&cantidad="+ {{.plantanueva.Cantidad}} +
        "&duracion="+ {{.plantanueva.Duracion}} +
        "&seleccio="+ {{.plantanueva.Seleccio}};
    } else {
        location.href= "/actual"
    }
  }
  function editar(s) {
    location.href= "/anade?tipo="+ {{.plantanueva.Tipo}} + 
    "&cantidad="+ {{.plantanueva.Cantidad}} +
    "&duracion="+ {{.plantanueva.Duracion}} +
    "&seleccio="+ {{.plantanueva.Seleccio}};
  }
  function actualizar(s) {
    location.href= "/update?key="+ {{.planta.ID}} + 
    "&tipo="+ {{.plantanueva.Tipo}} +
    "&cantidad="+ {{.plantanueva.Cantidad}} +
    "&duracion="+ {{.plantanueva.Duracion}} +
    "&seleccio="+ {{.plantanueva.Seleccio}};
  }
</script> 
</html>
