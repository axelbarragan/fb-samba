<?php

  include_once("../modelo/Hoteles.php");

  $nombreHotel  = $_POST['nombre'];
  $direccion    = $_POST['direccion'];
  $telefono     = $_POST['telefono'];
  $email        = $_POST['email'];
  $nombreCont   = $_POST['nombreContacto'];
  $apellidoCont = $_POST['apellidosContacto'];

  $wish = new Hoteles;
  //$wish->cerrarSesion();
  $wish->registrar($nombreHotel, $direccion, $telefono, $email, $nombreCont, $apellidoCont);
  $wish->cerrar();

?>
