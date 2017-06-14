<?php

  include_once("../modelo/Hoteles.php");

  $nombreHotel  = $_POST['nombre'];
  $direccion    = $_POST['direccion'];
  $telefono     = $_POST['telefono'];
  $email        = $_POST['email'];
  $nombreCont   = $_POST['nombreContacto'];
  $apellidoCont = $_POST['apellidosContacto'];
  echo $img     = $_FILES['img'];

  //$wish = new Hoteles;
  //$wish->cerrarSesion();
  //$wish->registrar($nombreHotel, $direccion, $telefono, $email, $nombreCont, $apellidoCont);
  //$wish->cerrar();

?>
