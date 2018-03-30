<!DOCTYPE html>
<html>
<head>
  <title>New</title>
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
      <c href="">Añadiendo nuevo cultivo</c>
  </div>
</header>
<body>
  <div class="div1"></div>
  <form action="/"  target="_blank" method="GET" align="center">
    <h2>Tipo:<h2>
    <input type="text" name="Tipo" value="" id ="tipo" >
    <br>
    <h2>Cantidad:<h2>
    <input type="text" name="Cantidad" value="" id="cantidad">
    <br>
    <h2> Duración de la Plantacion:<h2>
    <input type="text" name="Duracion" value="" id="duracion">
    <br>
    <br>
    <!--Fecha de incio:<br>
    <input type="text" name="ini" value="" id="Ini">
    <br>
    Fecha de recogida:<br>
    <input type="text" name="fin" value="">
    <br>-->
    <input type="button" onclick="myFunction()" value="Añadir" class = "boton">
    <input type="button" onclick="location.href='/actual';" value="Cancelar" class = "boton">
  </form>
</body>
<footer>
  <h1>by Felipe and David for Sparsity </h1>
</footer>
<script>
    function myFunction() {
      var r = confirm("¿Seguro que quieres crearlo?");
      if (r == true) {
          location.href= "/crear?tipo="+ document.getElementById("tipo").value + 
        "&cantidad="+ document.getElementById("cantidad").value +
        "&duracion="+ document.getElementById("duracion").value;
      } else {
          location.href= "/actual"
      }       
    }
</script>
</html>
