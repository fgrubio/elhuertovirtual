<!DOCTYPE html>
<html>
<head>
  <title>Error</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/15/15739.png" 
  type="image/x-icon" />
  <link rel = 'stylesheet' href = '/static/css/esInicio.css'>
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
    <b href="">|</b>
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
    <input type="button" onclick="editar({{.planta.ID}})" value="Editar el ya existente" class="boton">
    <input type="button" onclick="eliminar({{.planta.ID}})" value="Eliminar el ya existente" class="boton">
    <input type="button" onclick="location.href= '/anade'" value="Añadir un nuevo cultivo diferente" class="boton">
    <input type="button" onclick="location.href= '/actual'" value="Cancelar" class="boton">
  </div>
</body>
<footer>
  <h1>by Felipe and David for Sparsity </h1>
</footer>
<script>
  function eliminar(s) {
    var r = confirm("¿Estas seguro que quieres eliminar la planta existente?");
    if (r == true) {
        location.href= "/elim?key=" + s;
    } else {
        location.href= "/añade"
    }
  }
  function editar(s) {
    location.href= "/edit?key=" + s;
  }
</script> 
</html>
