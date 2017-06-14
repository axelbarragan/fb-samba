<?php

  include_once('../conexion/conn.php');
  include_once('../config/config.php');

  class SubirArchivos extends Conexion{
  	//Atributos
  	private $mysqli;
  	private $img;
  	
  	public function __construct() {
  	  $this->db     = Conexion::getInstance();
      $this->mysqli = $this->db->getConnection();
  	}

  	public function adminSubirImagenHotel($img) {
  		$this->img = $img;
  	}
  }

?>