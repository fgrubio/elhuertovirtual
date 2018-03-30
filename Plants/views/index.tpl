<!DOCTYPE html>

<html>
<head>
  <title>Actual</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/15/15739.png" 
  type="image/x-icon" />
  <link rel = 'stylesheet' href = '/static/css/es.css'>
   
</head>

<header>
  <div class="topnav">
      <a href="/">
        <img src="https://image.flaticon.com/icons/svg/17/17699.svg" width="40" height="40">
      </a>
      <b href="">
        <img src="https://image.flaticon.com/icons/png/512/15/15739.png" width="40" height="40">
      </b>
      <b href="">Mi Huerto</b>
      <b href="">|</b>
      <c href="">Cultivos Actuales</c>
  </div>
</header>
<body>
  <div class="div1"></div>
  <div align="left">
    <input type="button" onclick="location.href='/anade';" value="Añadir Planta" class="boton">
    <input type="button" onclick="location.href='/historial';" value="Historial" class="boton">
    <input type="button" onclick="eliminartabla()" value="Eliminar todo el cultivo actual" class="boton">
    <!-- <input type="button" onclick="location.href='/';" value="Volver al menú principal" class="boton"> -->
  </div>
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
      <td class="td1">{{$val.Tipo}}</td>
      <td>{{$val.Cantidad}}</td>
      <td>{{$val.Duracion}}</td>
      <td>  
        <input type="button" onclick="editar({{$val.ID}})" value="Editar" class="boton2">
      </td>
      <td>
        <input type="button" onclick="fuera({{$val.ID}})" value="Eliminar" class="boton2">
      </td>
    </tr>
      {{end}}
  </table>   
</body>
<footer>
  <h1>by Felipe and David for Sparsity </h1>
</footer>

<script>
  function editar(s) {
    location.href= "/edit?key=" + s;
  }
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
</html>