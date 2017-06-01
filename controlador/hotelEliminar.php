<?php

  include_once("../modelo/Hoteles.php");

  $id = $_POST['id'];

  $wish = new Hoteles;
  //$wish->cerrarSesion();
  $wish->eliminar($id);
  $wish->cerrar();

?>
