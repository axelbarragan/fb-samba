<?php

include_once("../modelo/Hoteles.php");

$nombreHotel  = $_POST['nombre'];
$direccion    = $_POST['direccion'];
$telefono     = $_POST['telefono'];
$email        = $_POST['email'];
$nombreCont   = $_POST['nombreContacto'];
$apellidoCont = $_POST['apellidosContacto'];
$img          = $_FILES['img'];

$wish = new Hoteles;
//echo $wish->adminSubirImagenHotel($img);
  //$wish->cerrarSesion();
$wish->registrar($nombreHotel, $direccion, $telefono, $email, $nombreCont, $apellidoCont, $img);
$wish->cerrar();

?>
