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
    <td><input type="button" onclick="" value="Editar"></td>
<<<<<<< HEAD
    <td><input type="button" onclick="fuera({{$val.ID}})" value="Eliminar"></td>
=======
    <td><input type="button" onclick="fuera({{$key}})" value="Eliminar"></td>
>>>>>>> 2f15133edd2d54dc788416f3c4081d078588f4b0
   </tr>
    {{end}}
</table>
    </p>


    <script>
    function fuera(s) {
      var r = confirm("¿Estas seguro?");
      if (r == true) {
          //location.href= '/elim'
          location.href= "/elim?key=" + s;
      } else {
          location.href= "/"
      }
      //document.getElementById("demo").innerHTML = txt;
    }
    </script> 
   
</body>
</html>