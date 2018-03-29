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
     <input type="button" onclick="location.href='/añade';" value="Añadir">
</header>
     <table>
  <tr>
    <th>Tipo</th>
    <th>Cantidad</th>
    <th>Duración</th>
  </tr>
  <tr></tr>
   {{range $key, $val := .taula}}
    <td>{{$val.Tipo}}</td>
    <td>{{$val.Cantidad}}</td>
    <td>{{$val.Duracion}}</td>
    <td><input type="button" onclick="editar({{$val.ID}})" value="Editar"></td>
    <td><input type="button" onclick="eliminar({{$val.ID}})" value="Eliminar"></td>
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
    function eliminar(s) {
      var r = confirm("¿Estas seguro que quieres eliminarlo?");
      if (r == true) {
          location.href= "/elim?key=" + s;
      } else {
          location.href= "/"
      }
      //document.getElementById("demo").innerHTML = txt;
    }
    </script> 
   
</body>
</html>