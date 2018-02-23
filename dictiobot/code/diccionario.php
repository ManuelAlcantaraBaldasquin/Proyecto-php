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
  	$basedatos = new mysqli("localhost","root","root");
  	$basedatos->set_charset("utf8");
  	$basedatos->select_db("dictiobot");

		$IDuser = $_SESSION["IDuser"]; //guardamos la id del usuario logueado
  	//Sentencia que toma todos los valores de la tabla diccionario
  	$sql  = "SELECT * FROM `diccionario` WHERE `IDuser` = $IDuser ORDER BY `Idioma`;";
  	$reg = $basedatos->query($sql);
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>diccionario</title>
	  <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	</head>
	<body>
	<div class="encabezado">

	<center><h3>Lista de tus diccionarios</h3></center>
  </div>
	Bienvenido <?= $_SESSION["user"] ?> ¿Que idioma aprenderás hoy?
	<br>
	<a href="main.php?destroy">Abandonar sesión</a>

	 <center><div class="col-xs-6 col-md-7 center">
    <table class="table" id="tDiccionario">
      <tr>
        <th>Nombre</th><th>Descripción</th><th>Idioma</th>
      </tr>
      <tr>
       <!-- Bucle por cada registro muestra en la tabla (nombre, descripcion y idioma) -->
        <?php while ($row = mysqli_fetch_assoc($reg)) {?>
        <td class=""> <?php echo $row["nombre"]; ?> </td>
        <td class=""> <?php echo $row["descripcion"]; ?> </td>
				<td class=""> <?php echo $row["idioma"]; ?> </td>
				</tr>
      <?php }; ?>
    </table></div></center>
		</div>

		</div>

	</body>
</html>
