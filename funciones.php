<?php

/*funciones*/

function encrypt () {
	$input = "APPLE";
	$output = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5(Encrypter::$Key), $input, MCRYPT_MODE_CBC, md5(md5(Encrypter::$Key))));
	return $output;
}



?>