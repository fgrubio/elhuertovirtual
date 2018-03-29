<!DOCTYPE html>
<html>
<body>

<!-- <p>This form will be submitted using the GET method:</p> -->

<form action="/"  target="_blank" method="GET">
  Tipo de Planta:<br>
  <input type="text" name="Tipo" value="Tipo1" id ="tipo" >
  <br>
  Cantidad:<br>
  <input type="text" name="Cantidad" value="102" id="cantidad">
  <br>
  Duracion de la Plantacion:<br>
  <input type="text" name="Duracion" value="102" id="duracion">
  <br>
  <!--Fecha de incio:<br>
  <input type="text" name="ini" value="" id="Ini">
  <br>
  Fecha de recogida:<br>
  <input type="text" name="fin" value="">
  <br>-->

  <input type="button" onclick="location.href='/';" value="Cancelar">
  <input type="button" onclick="myFunction()" value="Aceptar">
  
    <script>
    function myFunction() {
        //alert();
        location.href= "/crear?tipo="+ document.getElementById("tipo").value + 
        "&cantidad="+ document.getElementById("cantidad").value +
        "&duracion="+ document.getElementById("duracion").value;
        
    }
    </script>

</form>

</body>
</html>
