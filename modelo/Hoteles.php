<?php

include_once('../conexion/conn.php');
include_once('../config/config.php');

class Hoteles extends Conexion {
    //Atributos a usar
  private $mysqli;
  private $nombre;
  private $direccion;
  private $telefono;
  private $email;
  private $nombreCont;
  private $apellidoCont;
  private $id;
  private $salt;
  private $pass;

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
  public function registrar($nombreHotel, $direccion, $telefono, $email, $nombreCont, $apellidoCont) {
    $this->nombre    = $nombreHotel;
    $this->direccion = $direccion;
    $this->telefono  = $telefono;
    $this->email      = $email;
    $this->nombreCont = $nombreCont;
    $this->apellidoCont = $apellidoCont;
    $this->pass      = "1234";
    $this->salt      = SALT;
    $this->pass = hash_hmac("sha256", $this->pass, $this->salt);

    $query     = "INSERT INTO hotel VALUES (null,'$this->nombre','$this->direccion','$this->telefono')";
    $resultado = $this->mysqli->query($query);
    if($resultado) {
      $last_id = $this->mysqli->insert_id;
      $query   = "INSERT INTO usuarios VALUES (null,'$this->nombreCont','$this->apellidoCont','$last_id')"; 
      $res     = $this->mysqli->query($query);
      if($res) {
        $last_id = $this->mysqli->insert_id;
        $query   = "INSERT INTO sesion VALUES (null,'2','$last_id','$this->email','$this->pass')";
        $res     = $this->mysqli->query($query);
        if($res) {
          echo "REGISTRO COMPLETO";
        } else {
          echo "Error en sesion";
        }
      } else {
        echo "Error usuarios: ".$this->mysqli->connect_errno;
      }
    } else {
      echo "MAL";
    }
  }

    #Método para editar
  public function editar($id) {
      //Código para editar
  }

    #Método para eliminar
  public function eliminar($id) {
    $this->id  = $id;
    $query     = "DELETE FROM hotel WHERE id_hotel = '".$this->id."'";
    $resultado = $this->mysqli->query($query);
    if($resultado) {
      echo "Eliminado";
    } else {
      echo "No se pudo";
    }
  }

    #Método para ver datos
  public function ver($id) {
    $this->id = $id;
    $columns  = array();
    session_start();
    $_SESSION['idHotel'] = $this->id;
    $query =  $query = "SELECT *  FROM hotel INNER JOIN habitaciones ON hotel.id_hotel = habitaciones.id_hotel WHERE hotel.id_hotel = '".$this->id."'";
    $resultado = $this->mysqli->query($query);
    if($resultado) {
      while ($row = $resultado->fetch_assoc()) {
        $columns[] = $row;
      }
      header('Content-type: application/json; charset=utf-8');
      //var_dump($columns);
      echo json_encode($columns);
      /*switch(json_last_error()) {
        case JSON_ERROR_NONE:
        echo ' - Sin errores';
        break;
        case JSON_ERROR_DEPTH:
        echo ' - Excedido tamaño máximo de la pila';
        break;
        case JSON_ERROR_STATE_MISMATCH:
        echo ' - Desbordamiento de buffer o los modos no coinciden';
        break;
        case JSON_ERROR_CTRL_CHAR:
        echo ' - Encontrado carácter de control no esperado';
        break;
        case JSON_ERROR_SYNTAX:
        echo ' - Error de sintaxis, JSON mal formado';
        break;
        case JSON_ERROR_UTF8:
        echo ' - Caracteres UTF-8 malformados, posiblemente están mal codificados';
        break;
        default:
        echo ' - Error desconocido';
        break;
      }*/
      
    } else {
      echo "error: ".$this->mysqli->errno." - ".$this->mysqli->error;
    }

  }

    #Método para enlistar
  public function enlistar() {
      //Código para enlistar
    $query     = "SELECT * FROM hotel";
    $resultado = $this->mysqli->query($query);
    while ($row = $resultado->fetch_array()) {
      $arreglo["data"][] = $row;
    }
    echo json_encode($arreglo);
      //return "<tr><td>asd</td><td>asd</td><td>asd</td><td>asd</td><td>asd</td><td>asd</td></tr>";
  }
}
?>