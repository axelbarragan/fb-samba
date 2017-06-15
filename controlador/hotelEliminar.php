<?php

  include_once("../modelo/Hoteles.php");
  
  session_start();
  $id = $_POST['id'];
  $com = $_POST['comentario'];
  $usuario = $_SESSION['nombre_usuario'];

  $wish = new Hoteles;
  //$wish->cerrarSesion();
  $wish->eliminar($id, $usuario, $com);
  $wish->cerrar();

?>
