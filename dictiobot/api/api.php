<?php
 //devuelve el idioma más repetido
function topIdioma(){
  //conectamos a la base de datos
$basedatos = new mysqli("localhost","root","root");
$basedatos->set_charset("utf8");
$basedatos->select_db("api");

//hacemos la consulta y la almacenamos
$sql = "SELECT * FROM token WHERE IDtoken = 'token1234'";
$reg = $basedatos->query($sql);
//cerramos la base de datos
$basedatos->close();

if ($reg->num_rows) { //comprueba si hay registros en la base de datos
  //abrimos la base de datos del diccionario
  $basedatos = new mysqli("localhost","root","root");
  $basedatos->set_charset("utf8");
  $basedatos->select_db("dictiobot");

  //hacemos la consulta
  $sql = "SELECT `idioma` FROM `diccionario` GROUP BY `idioma` ORDER BY COUNT(*) DESC LIMIT 1;";
  $reg = $basedatos->query($sql);
  //lo guardamos en un array
  $datos = mysqli_fetch_object($reg);
  //le hacemos el encode al array
  $json = json_encode($datos);
  return $json;
}
}

?>
