<?php
session_start();
function index() {
	if(!isset($_SESSION['sesion_iniciada'])) {
		header("Location: ".URL."login");
	} else if (isset($_SESSION['nivel_usuario']) !== "b") {
		header("Location: ".URL."login");
	}
	/*switch ($_SESSION['nivel_usuario']) {
		case 'a':
			# code...
			break;
		
		default:
			# code...
			break;
	}*/
}
?>