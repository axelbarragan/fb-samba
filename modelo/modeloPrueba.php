<?php

class CodigoTuring {
	//Atributos    
	private static $Key = "dublin";
	
	public static function encrypt ($input) {
		$output = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5(CodigoTuring::$Key), $input, MCRYPT_MODE_CBC, md5(md5(CodigoTuring::$Key))));
		return $output;
	}
	
	public static function decrypt ($input) {
		$output = rtrim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, md5(CodigoTuring::$Key), base64_decode($input), MCRYPT_MODE_CBC, md5(md5(CodigoTuring::$Key))), "\0");
		return $output;
	}
	
}

/*$texto = "Apple";
$obj = new Encrypter;
$encriptado =  $obj->encrypt($texto);
var_dump($encriptado);
$desencriptado = $obj->decrypt($encriptado);

echo "Encriptado: '<b>".$encriptado."</b>' | y desencriptado: '<b>".$desencriptado."</b>'";*/


?>