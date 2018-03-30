<!DOCTYPE html>

<html>
<head>
  <title>Login</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="http://cdn2.melodijolola.com/media/files/styles/nota_imagen/public/field/image/logo2.jpg" 
  type="image/x-icon" />
  <link rel = 'stylesheet' href = '/static/css/estilo.css'>
   
</head>
<body>

  <header>

    <h1 class="logo">Huerto</h1>
     <p>
    
</header>
<h2 class="hey">Cultivos Actuales</h2>
     <table>
  <tr>
    <th>Tipo</th>
    <th>Cantidad</th>
    <th>Duración</th>
    <th></th>
    <th></th>
  </tr>
  <tr></tr>
   {{range $key, $val := .taula}}
    <td>{{$val.Tipo}}</td>
    <td>{{$val.Cantidad}}</td>
    <td>{{$val.Duracion}}</td>
    <td><input type="button" onclick="editar({{$val.ID}})" value="Editar"></td>
    <td><input type="button" onclick="fuera({{$val.ID}})" value="Eliminar"></td>
   </tr>
    {{end}}
</table>
    </p>

    <script>
    function editar(s) {
      location.href= "/edit?key=" + s;
    }
    </script>
    <script>
    function fuera(s) {
      var r = confirm("¿Estas seguro?");
      if (r == true) {
          //location.href= '/elim'
          location.href= "/elim?key=" + s;
      } else {
          location.href= "/actual"
      }
      //document.getElementById("demo").innerHTML = txt;
    }
    function eliminartabla() {
      var r = confirm("¿Estas seguro que quieres eliminar la actual?");
      if (r == true) {
          location.href="/createtable"
      } else {
          location.href= "/"
      }
    }
    </script> 
    
    <br><br>
    <div align="left">
     <input type="button" onclick="location.href='/añade';" value="Añadir Planta" class="boton">
     <input type="button" onclick="location.href='/historial';" value="Historial" class="boton">
     <input type="button" onclick="location.href='/';" value="Volver al menú principal" class="boton">
     <input type="button" onclick="eliminartabla()" value="Elimina todo el cultivo actual" class="boton">
    </div>
   
</body>
</html>