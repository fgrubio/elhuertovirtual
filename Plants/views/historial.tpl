<!DOCTYPE html>

<html>
<head>
  <title>Login</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="http://cdn2.melodijolola.com/media/files/styles/nota_imagen/public/field/image/logo2.jpg" 
  type="image/x-icon" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Titillium+Web">
  <link rel = 'stylesheet' href = '/static/css/estilohistorial.css'>
   
</head>
<body>

  <header>

    <h1 class="logo">Huerto</h1>
     <p>
    
</header>
    <h2 class="hey">Historial</h2>
     <table>
  <tr>
    <th>Tipo</th>
    <th>Creación</th>
    <th>Última actualización</th>
    <th>Eliminación</th>
    <th>Cantidad</th>
    <th>Duración</th>
  </tr>
  <tr></tr>
   {{range $key, $val := .taula}}
    <td>{{$val.Tipo}}</td>
    <td>{{$val.CreatedAt}}</td>
    <td>{{$val.UpdatedAt}}</td>
    <td>{{$val.DeletedAt}}</td>
    <td>{{$val.Cantidad}}</td>
    <td>{{$val.Duracion}}</td>
   </tr>
    {{end}}
</table>
    </p>

    <br><br>
    <div align="left">
     <input type="button" onclick="location.href='/actual';" value="Atras" class="boton">
    </div>
   
</body>
</html>