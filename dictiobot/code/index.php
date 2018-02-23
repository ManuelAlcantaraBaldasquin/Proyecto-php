<?php
 include_once '../api/api.php';

	//iniciar sesión
	session_start() ;
	if (isset($_POST["user"])) {

	//conectar a la base de datos
	$basedatos = new mysqli("localhost", "root", "root") ;

	//comprobar si hay errores al conectar
	if ($basedatos->connect_errno) {
			die("**Error $basedatos->connect_errno: $basedatos->connect_error.<br/>") ;
		}

	//seleccionar la base de datos
	$basedatos->select_db("dictiobot") ;

	// Escapamos las cadenas correctamente para evitar inyección de código
		$user = $basedatos->real_escape_string($_POST["user"]) ;
		$password = $basedatos->real_escape_string($_POST["password"]) ;

	//Comprobar user
	$sql  = "SELECT * FROM usuarios WHERE user='$user' AND password='$password';" ;
	$reg = $basedatos->query($sql) ; //ejecuta la sentencia

	$datos = mysqli_fetch_assoc($reg); //guardamos los registros en un array
	if ($reg->num_rows) {
		$_SESSION["IDuser"] = $datos["IDuser"];
		$_SESSION["user"] = $_POST["user"] ;

	// Redirigimos
	if ($datos["admin"] == 1) {
			//usuario admin
			header("location:diccionarioAdmin.php");
		}else{
			//usuario corriente
			header("location:diccionario.php");
		}
		} else {
			$msg = "<p>Error al iniciar sesion</p>" ;
		}
		// Cerrar la conexión de la base datos.
		$basedatos->close() ;
	}
  //creamos la variable para que sea igual a la función
	$topIdioma = topIdioma();
	//esta variable almacena el json_decode
	$paraDecode = json_decode($topIdioma, true);
?>
<!DOCTYPE html>
<html>
<head>
	<title>Index</title>

	<meta charset="utf-8">
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/style.css">

</head>
<body class="bodyIndex">
	<?= isset($msg) ? $msg : "" ; ?>
<center>
	<form method="POST">
		<h1>Dictiobot</h1>
<div class="containerLogin">
		<div class="form-group">
			<p><b>El idioma más popular en este momento<br>(<?=$paraDecode["idioma"]?>)<b><p>
		<p><label for="user"><b>Usuario</b></label><br>
		<input class="form-control" type="text" placeholder="Introduce usuario" name="user" id="user" required /><p>

		<p><label for="password"><b>Contraseña<b></label><br>
		<input class="form-control" type="password" placeholder="Introduce contraseña" name="password" id="password" required /><p>

		<button type="submit">Entrar</button>
	</div>
	</form>
</div>
</center>
</body>
</html>
