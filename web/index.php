<?php

session_start();
if($_SESSION['sesion_iniciada'] == "si") {
	$var = $_SESSION['nivel_usuario'];
	//echo $var;
	switch ($var) {
		case 'a':
		header("Location: administrador/");
		break;

		case 'b':
		header("Location: clientes/");
		break;

	}
} else {
	echo "NO";
	//header("Location: ".URL."login");
}


?>