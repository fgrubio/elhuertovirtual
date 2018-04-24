<!DOCTYPE html>
<html>
<head>
  <title>MiHuerto | JSON</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/15/15739.png" 
  type="image/x-icon" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,900|Montserrat:800">
  <link rel = 'stylesheet' href = '/static/css/esEdit4.css'> 
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
      <c href="">JSON</c>
  </div>
</header>
<body>
<div class = "div1"></div>
  <form name="f1" id="f1" action="/imprimir" method="get" align="center">
  <h2> <input type="checkbox" name="tipo" value="1" id="c4">Tipo<br> <div><br></div> </h2>

   <h2><input type="checkbox" name="fecha" value="1" id="c1" onClick='desplegar()'>Fecha de Plantacion<br></h2>
    <div style="visibility:hidden" id='div1'>
   <input type="checkbox" name="primera"value="1" id="c11"> Solo Primera Semana
   <input type="checkbox" name="segunda"value="1" id="c12"> Solo Segunda Semana</div>

  <h2> <input type="checkbox" name="duracion" value="1" id="c2" onClick='desplegar()'>Duracion<br></h2>
    <div style="visibility:hidden" id='div2'>
   <input type="checkbox" name="dia"value="1" id="c21">Dias
   <input type="checkbox" name="mes"value="1" id="c22">Meses
   <input type="checkbox" name="ano"value="1" id="c23">Años </div>

   <h2><input type="checkbox" name="cantidad" value="1" id="c3" onClick='desplegar()'>Cantidad<br></h2>
    <div style="visibility:hidden" id='div3'>
   <input type="checkbox" name="50"value="1" id="c31">Entre 1-50
   <input type="checkbox" name="100"value="1" id="c32">Entre 51-100
   <input type="checkbox" name="200"value="1" id="c31">Mas de 100</div>
   <input type="submit" value="Submit" class = "boton">
  </form>



</body>
<footer align="center">
  <h1><img src="https://png.icons8.com/metro/1600/copyright.png" width="9" height="9"/>    by Felipe and David for Sparsity </h1>
</footer>

    <script type="text/javascript">
       function desplegar(){
        var c1 = document.getElementById('c1');
        var c2 = document.getElementById('c2');
        var c3 = document.getElementById('c3');
        var div1 = document.getElementById('div1');
        var div2 = document.getElementById('div2');
        var div3 = document.getElementById('div3');
        if(c1.checked==true){
         div1.style.visibility = 'visible';   
        }else{
         div1.style.visibility = 'hidden';
        }
        if(c2.checked==true){
         div2.style.visibility = 'visible';   
        }else{
         div2.style.visibility = 'hidden';
        }
        if(c3.checked==true){
         div3.style.visibility = 'visible';   
        }else{
         div3.style.visibility = 'hidden';
        }
       } 
      </script>

</html>