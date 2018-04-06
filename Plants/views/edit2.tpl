<!DOCTYPE html>
<html>
<head>
  <title>MiHuerto | Edit</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/15/15739.png" 
  type="image/x-icon" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,900|Montserrat:800">
  <link rel = 'stylesheet' href = '/static/css/esEdit4.css'>
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
      <c href="">Editando cultivo tipo {{.taula.Tipo}}</c>
  </div>
</header>
<body>
  <div class="div1"></div>
  <form action="/"  target="_blank" method="GET" align="center">
     <h2>Tipo:<h2>
    <input class="forminput" type="text" name="Tipo" value="{{.taula.Tipo}}" id ="tipo" >
    <br>
    <h2>Cantidad:<h2>
    <input class="forminput" type="text" name="Cantidad" value="{{.taula.Cantidad}}" id="cantidad" >
    <div align="center" class="errorFlash">{{.flash.error}}</div>
    <h2>Duración de la Plantación:<h2>
    <input class="forminput" type="text" name="Duracion" value="{{.taula.Duracion}}" id="duracion" >

    <select class="select1" name="Seleccio" id= "seleccio">
    <option value="{{.taula.Seleccio}}" disabled selected>{{.taula.Seleccio}}</option>
      <option value="Dias">Dias</option>
      <option value="Meses">Meses</option>
      <option value="Años">Años</option>
    </select>
    <br>
    <br>
    <!--Fecha de incio:<br>
    <input type="text" name="ini" value="" id="Ini">
    <br>
    Fecha de recogida:<br>
    <input type="text" name="fin" value="">
    <br>-->
    <input type="button" onclick="myFunction({{.taula.ID}})" data-target="#myModal" value="Guardar" class = "boton">
    <input type="button" onclick="location.href='/actual';" value="Cancelar" class = "boton">
  </form>
</body>
<footer align="center">
  <h1><img src="https://png.icons8.com/metro/1600/copyright.png" width="9" height="9"/>    by Felipe and David for Sparsity </h1>
</footer>
<script>
      function myFunction(s) {
          var r = confirm("¿Seguro que quieres guardar?");
          if (r == true) {
            //location.href = "/"
              location.href= "/update?key="+ {{.taula.ID}} + 
              "&tipo="+ document.getElementById("tipo").value +
              "&cantidad="+ document.getElementById("cantidad").value +
              "&duracion="+ document.getElementById("duracion").value +
              "&seleccio="+ document.getElementById("seleccio").value;
          } else {
            location.href= "/edit?key=" + s;
          }        
      }
      </script>
</html>
