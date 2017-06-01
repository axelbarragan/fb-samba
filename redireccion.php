<?php

  session_start();

  /*Archivo de redirección*/
  switch ($_SESSION['nivel_usuario']) {
  	case 'a':
  		#Administrador
  	  header('Location: web/administrador/index');
  		break;

  	case 'b':
  		#Cliente
  	  header('Location: web/clientes/index');
  		break;
  }

?>