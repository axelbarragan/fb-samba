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
    $this->id = $id;
    //SELECT * FROM servicio_habitacion INNER JOIN servicios_habitaciones ON servicio_habitacion.id_servicio = servicios_habitaciones.id_servicio INNER JOIN habitaciones ON servicio_habitacion.id_hab = habitaciones.id_hab WHERE id_hab = 1;
    $query = "SELECT * FROM servicio_habitacion INNER JOIN servicios_habitaciones ON servicio_habitacion.id_servicio = servicios_habitaciones.id_servicio WHERE id_hab ='".$this->id."'";
    $res = $this->mysqli->query($query);
    if($res) {
      while ($row = $res->fetch_assoc()) {
        $columns[] = $row;
      }
      header('Content-type: application/json; charset=utf-8');
      echo json_encode($columns);
    } else {
      echo "error: ".$this->mysqli->errno." - ".$this->mysqli->error;
    }
  }

    #Método para eliminar
  public function eliminar($id) {

  }

    #Método para ver datos
  public function ver($id) {
    $this->id = $id;
    $columns  = array();
    session_start();
    $_SESSION['idHab'] = $this->id;
    $query = "SELECT * FROM habitaciones WHERE id_hab = '".$this->id."'";
    $resultado = $this->mysqli->query($query);
    if($resultado) {
      while ($row = $resultado->fetch_assoc()) {
        $columns[] = $row;
      }
      header('Content-type: application/json; charset=utf-8');
      //var_dump($columns);
      echo json_encode($columns);
    } else {
      echo "error: ".$this->mysqli->errno." - ".$this->mysqli->error;
    }
  }

    #Método para enlistar
  public function enlistar($idHotel) {
    $this->id = $idHotel;
    $query     = "SELECT id_hab, titulo_habitacion, cantidad_habitacion FROM habitaciones WHERE id_hotel = '".$this->id."'";
    $resultado = $this->mysqli->query($query);
    if($resultado) {
      while ($row = $resultado->fetch_array()) {
        $arreglo["data"][] = $row;
      }
      echo json_encode($arreglo);
    } else {
      echo "NO";
    }
    
  }
}
?>