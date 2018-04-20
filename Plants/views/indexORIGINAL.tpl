<!DOCTYPE html>

<html>
<head>
  <title>MiHuerto | Actual</title>
  <script></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/15/15739.png" 
  type="image/x-icon" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,900|Montserrat:800">
  <link rel = 'stylesheet' href = '/static/css/es4.css'>
  <meta http-equiv="refresh" content="15">
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
      <c href="">Dia {{.dia}}, {{.hora}}:00h</c>
      <c href="">|</c>
      <c href="">Cultivos Actuales</c>
      <c href=""></c>
  </div>
</header>
<body onload="mi();">
  <div class="div1"></div>
  <div align="left">
    <input type="button" onclick="location.href='/anade';" value="Añadir Planta" class="boton">
    <input type="button" onclick="location.href='/recogidas';" value="Cultivos Recogidos" class="boton">
    <input type="button" onclick="location.href='/historial';" value="Historial" class="boton">
    <input type="button" onclick="location.href='/json';" value="JSON" class="boton">
    <input type="button" onclick="eliminartabla()" value="Reiniciar cultivo actual" class="boton">
    <input type="button" onclick="location.href='/random';" value="Random" class="boton3">
    
  </div>
  

  <div>
    <table>
      <tr>
        <th>Tipo</th>
        <th>Cantidad</th>
        <th>Duración</th>
        <th>Quedan</th>
        <th></th>
        <th></th>
        <th></th>
      </tr>
      {{range $key, $val := .taula}}
        <td class="td1">{{$val.Tipo}}</td>
        <td>{{$val.Cantidad}}</td>
        <td>{{$val.Duracion}} {{$val.Seleccio}}</td>
        <td>{{$val.Temporizador}} {{$val.SeleccioTemp}}</td>
        <td>  
          <input type="button" onclick="editar({{$val.ID}})" value="Editar" class="boton2">
        </td>
        <td>
          <input type="button" onclick="fuera({{$val.ID}})" value="Eliminar" class="boton2" id="myBtn">
        </td>
         <td>
          <input type="button" onclick="recogida({{$val.ID}})" value="Recoger" class="boton2" id="myBtn">
        </td>
      </tr>
        {{end}}
    </table>
  </div>
      <!-- The Modal -->
    <div id="myModal" class="modal">

      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>
        <p>{{.flash.error}}{{.flash.warning}}{{.flash.notice}}</p>
      </div>
    </div>

  <footer>
  <div class="div2"></div>
      <div class="slidecontainer" align="center">
      <d class="td2"> Velocidad: </d>
        <input type="range" min="0" max="60" value="{{.speed}}" class="slider" id="myRange">
        <d class="td2"> 1 Hora cada <span id="demo">{{.speed}}</span> Segundo/s </d>
      </div>
      <div align="left">
        <h1><img src="https://png.icons8.com/metro/1600/copyright.png" width="9" height="9"/>    by Felipe and David for Sparsity </h1>
     </div>
  </footer>

</body>

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
  function recogida(s) {
    var r = confirm("¿Estas seguro?");
    if (r == true) {
        //location.href= '/elim'
        location.href= "/recoger?key=" + s;
                
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
        location.href= "/actual"
    }
  }
    // Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    function mi() {
      if({{.flash.notice}} != ""){
			   modal.style.display = "block";
      }
		}
    var slider = document.getElementById("myRange");
    var output = document.getElementById("demo");
    output.innerHTML = slider.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
    slider.oninput = function() {
      output.innerHTML = this.value;
      location.href= "/actual?speed=" + this.value;
    }
</script> 
</html>