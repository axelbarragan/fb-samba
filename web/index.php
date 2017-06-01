<?php

session_start();
if(isset($_SESSION['sesion_iniciada']) == "si") {
	$var = isset($_SESSION['nivel_usuario']);
	switch ($var) {
		case 'a':
		header("Location: administrador/");
		break;

		case 'b':
		header("Location: clientes/");
		break;

	}
} else {
	header("Location: ".URL."login");
}


?>