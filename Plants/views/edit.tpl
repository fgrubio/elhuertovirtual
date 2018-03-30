<!DOCTYPE html>
<html>
<head>
  <link rel = 'stylesheet' href = '/static/css/es_add.css'>
   
</head>
<body>

<!-- <p>This form will be submitted using the GET method:</p> -->

<form action="/"  target="_blank" method="GET">
  Tipo de Planta: {{.taula.Tipo}}<br><br>
  Cantidad:<br><br>
  <input type="text" name="Cantidad" value="{{.taula.Cantidad}}" id="cantidad">
  <br><br>
  Duracion de la Plantacion:<br><br>
  <input type="text" name="Duracion" value="{{.taula.Duracion}}" id="duracion">
  <br><br>
  <!--Fecha de incio:<br>
  <input type="text" name="ini" value="" id="Ini">
  <br>
  Fecha de recogida:<br>
  <input type="text" name="fin" value="">
  <br>-->
  <input type="button" onclick="myFunction({{.taula.ID}})" value="Guardar">
  <input type="button" onclick="location.href='/actual';" value="Cancelar">
  
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

</form>

</body>
</html>
