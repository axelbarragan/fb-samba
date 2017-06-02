<?php

  require_once('../conexion/conn.php');
  require_once('../config/config.php');

  class Login extends Conexion {
    //Atributos a usar
  	private $user;
  	private $password;
  	private $db;
  	private $mysqli;
    private $token;
    private $tokenRecibido;
    private $salt;
    private $contraOrdi;
    private $contraHash;

    #Método constructor
  	public function __construct() {
      $this->db     = Conexion::getInstance();
      $this->mysqli = $this->db->getConnection();
  	}

    #Método para verificar datos
  	public function login($usuario, $pass) {
      $this->user = $usuario;
      $this->pass = $pass;
      $this->salt = SALT;

      $this->pass = hash_hmac("sha256", $this->pass, $this->salt);
      
      //$query    = "SELECT * FROM sesion uno I WHERE nombre_usuario = '".$this->user."'";
      $query = "SELECT *  FROM sesion INNER JOIN usuarios ON sesion.id_usuario = usuarios.id_usuario INNER JOIN nivel_usuario ON sesion.id_nivel = nivel_usuario.id_nivel WHERE sesion.nombre_usuario = '".$this->user."'";
      $consulta = $this->mysqli->query($query);

      if($row = $consulta->fetch_array()) {
        if($row['pass_usuario'] == $this->pass) {
          session_start();
          $_SESSION['sesion_iniciada'] = "si";
          $_SESSION['nombre_usuario']  = $row['nombre_usuario']." ".$row['apellidos_usuario'];
          $_SESSION['nivel_usuario']   = $row['letra_nivel'];
          $_SESSION['alias_usuario']   = $row['user']; 
          $_SESSION['empresa_usuario'] = $row['empresa'];
          $token = md5(uniqid(rand(), TRUE));
          $_SESSION['token'] = $token;
          echo "oka";
        } else {
          echo "Contraseña mal";
        }  
      } else {
        echo "Usuario y/o contraseña mal";
      }
    }

    #Método para cerrar la conexion
    public function cerrar() {
      $this->mysqli->close();
    }

    public function cerrarSesion(/*$token*/) {
      session_start();
      $_SESSION = array();
        session_destroy();
        echo "adios";
      
      /*$this->tokenRecibido = $token;
      $this->token = $_SESSION['token'];
      if($this->token == $this->tokenRecibido) {
        
      } else {
        echo "error";
      }*/
      
    }



  }

?>