<?php

include_once('../conexion/conn.php');
include_once('../config/config.php');

class Habitaciones extends Conexion {
    //Atributos a usar
  private $mysqli;
  private $nombre;
  private $direccion;
  private $telefono;
  private $id;

    #Método constructor
  public function __construct() {
    $this->db     = Conexion::getInstance();
    $this->mysqli = $this->db->getConnection();
  }

    #Método para cerrar la conexion
  public function cerrar() {
    $this->mysqli->close();
  }

    #Método para verificar datos
  public function registrar($nombre, $direccion, $telefono) {
    
  }

    #Método para editar
  public function editar($id) {

  }

    #Método para eliminar
  public function eliminar($id) {

  }

    #Método para ver datos
  public function ver($id) {

  }

    #Método para enlistar
  public function enlistar() {

  }
}
?>