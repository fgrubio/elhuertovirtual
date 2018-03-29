<!DOCTYPE html>
<html>
<head>
  <link rel = 'stylesheet' href = '/static/css/es_add.css'>
   
</head>
<body>

<!-- <p>This form will be submitted using the GET method:</p> -->


  El tipo {{.planta.Tipo}} ya se está cultivando en el huerto.<br>
  Puede hacer lo siguiente:<br>
  <input type="button" onclick="editar({{.planta.ID}})" value="Editar el ya existente">
  <input type="button" onclick="eliminar({{.planta.ID}})" value="Eliminar el ya existente">
  <input type="button" onclick="location.href= '/añade'" value="Añadir una nuevo cultivo diferente">
  <input type="button" onclick="location.href= '/'" value="Cancelar">

  
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

</form>

</body>
</html>
