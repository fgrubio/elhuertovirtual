<!DOCTYPE html>

<html>
<head>
  <title>MiHuerto | Recogidas</title>
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
      <c href="">Dia {{.dia}}, {{.hora}}:00h</c>
      <c href="">|</c>
      <c href="">Cultivos Almacenados</c>
  </div>
</header>
<body>
  <div class="div1"></div>
  <div>
    <table>
      <tr>
        <th>Tipo</th>
        <th>Cantidad</th>
        <th>Plantada</th>
        <th>Recogida</th>
        <th>Duración de la plantación</th>
        <th></th>
      </tr>
    {{range $key, $val := .taula}}
      <td  class="td1">{{$val.Tipo}}</td>
      <td>{{$val.Cantidad}}</td>
      <td>Dia {{$val.PlantadaDia}}, {{$val.PlantadaHora}}:00h</td>
      <td>Dia {{$val.RecogidaDia}}, {{$val.RecogidaHora}}:00h</td>
      <td>{{$val.DuracionDia}} Dias y {{$val.DuracionHora}}h</td>
      <td></td>
    </tr>
      {{end}}
    </table> 
  </div>

  <footer align="center">
    <h1><img src="https://png.icons8.com/metro/1600/copyright.png" width="9" height="9"/>    by Felipe and David for Sparsity </h1>
  </footer>

</body>
</html>