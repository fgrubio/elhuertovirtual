<!DOCTYPE html>

<html>
<head>
  <title>MiHuerto | Historial</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/15/15739.png" 
  type="image/x-icon" />
  <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Titillium+Web"> -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,900|Montserrat:800">
  <link rel = 'stylesheet' href = '/static/css/es1.css'>
   
</head>
<header>
  <div class="topnav">
      <a href="/actual">
        <img src="https://image.flaticon.com/icons/svg/17/17699.svg" width="40" height="40">
      </a>
      <b href="">
        <img src="https://image.flaticon.com/icons/png/512/15/15739.png" width="40" height="40">
      </b>
      <b href="">Mi Huerto</b>
      <c href="">|</c>
      <c href="">Historial</c>
  </div>
</header>
<body>
  <div class="div1"></div>
  <div class="divtable">
    <table>
      <tr>
        <th>Tipo</th>
        <th>Creación</th>
        <th>Última actualización</th>
        <th>Eliminación</th>
        <th>Cantidad</th>
        <th>Duración</th>
      </tr>
    {{range $key, $val := .taula}}
      <td  class="td1">{{$val.Tipo}}</td>
      <td>{{$val.CreatedAt}}</td>
      <td>{{$val.UpdatedAt}}</td>
      <td>{{$val.DeletedAt}}</td>
      <td>{{$val.Cantidad}}</td>
      <td>{{$val.Duracion}}</td>
    </tr>
      {{end}}
    </table> 
  </div>
  <footer align="center">
    <h1><img src="https://png.icons8.com/metro/1600/copyright.png" width="9" height="9"/>    by Felipe and David for Sparsity </h1>
  </footer>
</body>
</html>