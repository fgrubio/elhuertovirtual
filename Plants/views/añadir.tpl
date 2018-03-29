<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
  <link rel = 'stylesheet' href = '/static/css/es_add.css'>
=======
  <link rel = 'stylesheet' href = '/static/css/estilo.css'>
>>>>>>> 2f15133edd2d54dc788416f3c4081d078588f4b0
   
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

  <input type="button" onclick="location.href='/';" value="Cancelar">
  <input type="button" onclick="myFunction()" value="Añadir">
  
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
