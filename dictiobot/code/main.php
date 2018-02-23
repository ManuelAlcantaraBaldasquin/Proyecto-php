<?php
	//comprobar la sesión
	session_start();
	function destruir_session() {
		// Destruir variables de sesión
		$_SESSION[] = array() ;
		// Destruimos la sesión
		session_destroy() ;
		header("location:index.php") ;
	}
	// Si se nos indica, destruimos la sesión.
	if (isset($_GET["destroy"])) {
		destruir_session() ;
	}

	 //Conectar a la base de datos
  	$basedatos = @new mysqli("localhost","root","root");
  	$basedatos->set_charset("utf8");
  	$basedatos->select_db("dictiobot");


  	//Sentencia que toma todos los valores de la tabla palabras
  	$sql  = "SELECT * FROM palabras WHERE IDdiccionario = 1;";
  	$reg = $basedatos->query($sql);

?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>main</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/estilo.css">
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
	</head>
	<body>
	<a href="main.php?destroy">Destruir sesión</a>
	 <center><div class="col-xs-6 col-md-3 center">
      <h3>Listado de palabras</h3>
    <table class="table">
      <tr>
        <th>Palabra</th><th>Significado</th><th>Ejemplo</th>
      </tr>
      <tr>
       <!-- Bucle por cada registro muestra en la tabla (texto, contraseña y fecha) -->
        <?php while ($row = mysqli_fetch_assoc($reg)) { ?>
        <td class=""> <?php echo $row["palabra"]; ?> </td>
        <td class=""> <?php echo $row["significado"]; ?> </td>
        <td class=""> <?php echo $row["ejemplo"]; ?> </td>
      </tr>
      <?php }; ?>
    </table></div></center>

	</body>
</html>
