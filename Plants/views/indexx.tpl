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
     <br>
     <br>
     <br>
    {{range $key, $val := .taula}}
    {{$val}}
    <input type="button" onclick="" value="Editar">
    <input type="button" onclick="fuera()" value="Eliminar">
    <br>
    {{end}}
    </p>


    <script>
    function fuera() {
      var r = confirm("¿Estas seguro?");
      if (r == true) {
          location.href= '/elim' 
      } else {
          location.href= "/"
      }
      //document.getElementById("demo").innerHTML = txt;
    }
    </script> 
   
</body>
</html>