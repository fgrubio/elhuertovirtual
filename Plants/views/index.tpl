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
     
    {{map_get .tipos 0}}  {{map_get .cant 0}}  {{map_get .dur 0}}<br>
    {{map_get .tipos 1}}  {{map_get .cant 1}}  {{map_get .dur 1}}<br>
    {{map_get .tipos 2}}  {{map_get .cant 2}}  {{map_get .dur 2}}<br>
    </p>

<p id="demo"></p>

<script>
var text = "";
var i;
for (i = 0; i < 3; i++) {
    text += "{{map_get .tipos 0}}";
}
document.getElementById("demo").innerHTML = text;
</script>

   <div class="description">
   </div>
  </header>
 

  <footer>
    <div class="author">
      <a href="localhost:8080">{{.Website}}</a> 
      <br>
      <a class="email" href="mailto:{{.Email}}">{{.Email}}</a>
    </div>
  </footer>
  <div class="backdrop"></div>


   <input type="button"  onclick="myFunction()" value="Eliminar">

  <script>
  function myFunction() {
     var r = confirm("¿Estas seguro?");
    if (r == true) {
      
        location.href= "/eliminar?"
    } else {
        location.href= "/"
    }
    //document.getElementById("demo").innerHTML = txt;
  }
  </script> 
  
    
   <input type="button" onclick="" value="Editar">
   <input type="button" onclick="location.href='/inicio';" value="Añadir">

   
</body>
</html>