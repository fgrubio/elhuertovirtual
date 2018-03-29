<!DOCTYPE html>
<html>
<head>
  <link rel = 'stylesheet' href = '/static/css/es_add.css'>
   
</head>
<body>

<!-- <p>This form will be submitted using the GET method:</p> -->

<form action="/"  target="_blank" method="GET">
  Tipo de Planta:<br><br>
  <input type="text" name="Tipo" value="" id ="tipo" >
  <br><br>
  Cantidad:<br><br>
  <input type="text" name="Cantidad" value="" id="cantidad">
  <br><br>
  Duracion de la Plantacion:<br><br>
  <input type="text" name="Duracion" value="" id="duracion">
  <br><br>
  <!--Fecha de incio:<br>
  <input type="text" name="ini" value="" id="Ini">
  <br>
  Fecha de recogida:<br>
  <input type="text" name="fin" value="">
  <br>-->
  <input type="button" onclick="myFunction()" value="Añadir">
  <input type="button" onclick="location.href='/';" value="Cancelar">

  
    <script>
    function myFunction() {
      var r = confirm("¿Seguro que quieres crearlo?");
      if (r == true) {
          location.href= "/crear?tipo="+ document.getElementById("tipo").value + 
        "&cantidad="+ document.getElementById("cantidad").value +
        "&duracion="+ document.getElementById("duracion").value;
      } else {
          location.href= "/"
      }       
    }
    </script>

</form>

</body>
</html>
