<!DOCTYPE html>
<html>
<head>
  <title>Edit</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/15/15739.png" 
  type="image/x-icon" />
  <link rel = 'stylesheet' href = '/static/css/es.css'>
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
      <c href="">Editando cultivo tipo {{.taula.Tipo}}</c>
  </div>
</header>
<body>
  <div class="div1"></div>
  <form action="/"  target="_blank" method="GET" align="center">
    <h2>Cantidad:</h2>
    <input type="text" name="Cantidad" value="{{.taula.Cantidad}}" id="cantidad" >
    <br>
    <h2>Duración de la Plantacion:<h2>
    <input type="text" name="Duracion" value="{{.taula.Duracion}}" id="duracion" >
    <br>
    <br>
    <!--Fecha de incio:<br>
    <input type="text" name="ini" value="" id="Ini">
    <br>
    Fecha de recogida:<br>
    <input type="text" name="fin" value="">
    <br>-->
    <input type="button" onclick="myFunction({{.taula.ID}})" value="Guardar" class = "boton">
    <input type="button" onclick="location.href='/actual';" value="Cancelar" class = "boton">
  </form>
</body>
<footer>
  <h1>by Felipe and David for Sparsity </h1>
</footer>
<script>
      function myFunction(s) {
          var r = confirm("¿Seguro que quieres guardar?");
          if (r == true) {
            //location.href = "/"
              location.href= "/update?key="+ {{.taula.ID}} + 
              "&tipo="+ {{.taula.Tipo}} +
              "&cantidad="+ document.getElementById("cantidad").value +
              "&duracion="+ document.getElementById("duracion").value;
          } else {
            location.href= "/edit?key=" + s;
          }        
      }
      </script>
</html>
