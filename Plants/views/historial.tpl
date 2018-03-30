<!DOCTYPE html>

<html>
<head>
  <title>Historial</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/15/15739.png" 
  type="image/x-icon" />
  <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Titillium+Web"> -->
  <link rel = 'stylesheet' href = '/static/css/es.css'>
   
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
      <b href="">|</b>
      <c href="">Historial</c>
  </div>
</header>
<body>
  <div class="div1"></div>
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
    <td  class="td1">{{$val.Tipo}}</td>
    <td>{{$val.CreatedAt}}</td>
    <td>{{$val.UpdatedAt}}</td>
    <td>{{$val.DeletedAt}}</td>
    <td>{{$val.Cantidad}}</td>
    <td>{{$val.Duracion}}</td>
   </tr>
    {{end}}
</table>   
</body>
<footer>
  <h1>by Felipe and David for Sparsity </h1>
</footer>
</html>