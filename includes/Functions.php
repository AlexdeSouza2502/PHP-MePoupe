<?php


/*
     * Function to show an Alert type Message Box
     *
     * @param string $message   The Alert Message
     * @return string           The Alert Box
     */
    function alertBox($message) {
       // return "<div class=\"alert alert-dismissable $type\"><span>$icon</span> $message <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">x</a></div>";
       return  "<div class=\"alert alert-success alert-dismissable\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">x</button>$message</div>";
    }
    /*
     * Function to convert a number into readable Currency
     *
     * @param string $n   			The number
     * @param string $n_decimals	The decimal position
     * @return string           	The formatted Currency Amount
	 *
	 * Returns string type, rounded number - same as php number_format()):
	 *
	 * Examples:
	 *		format_amount(54.377, 2) 	returns 54.38
	 *		format_amount(54.004, 2) 	returns 54.00
	 *		format_amount(54.377, 3) 	returns 54.377
	 *		format_amount(54.00007, 3) 	returns 54.00
     */
	function format_amount($n, $n_decimals) {
        return ((floor($n) == round($n, $n_decimals)) ? number_format($n).'.00' : number_format($n, $n_decimals));
    }
    
    /*
     * Function to Encrypt user sensitive data for storing in the database
     *
     * @param string	$value		The text to be encrypted
	 * @param 			$encodeKey	The Key to use in the encryption
     * @return						The encrypted text
     */
	function encryptIt($value) {
		// A chave de encriptação deve ser a mesma para encriptação e decriptação
		$encodeKey = 'Li1KUqJ4tgX14dS,A9ejk?uwnXaNSD@fQ+!+D.f^`Jy';
		$key = hash('sha256', $encodeKey); // Gera uma chave a partir da string
		$iv = substr(hash('sha256', $encodeKey), 0, 16); // Gera um IV a partir da string
		$encoded = openssl_encrypt($value, "AES-256-CBC", $key, 0, $iv);
		return base64_encode($encoded); // Retorna o valor encriptado em base64
	}
	

    /*
     * Function to decrypt user sensitive data for displaying to the user
     *
     * @param string	$value		The text to be decrypted
	 * @param 			$decodeKey	The Key to use for decryption
     * @return						The decrypted text
     */
	function decryptIt($value) {
		// A chave de desencriptação deve ser a mesma usada para encriptação
		$decodeKey = 'Li1KUqJ4tgX14dS,A9ejk?uwnXaNSD@fQ+!+D.f^`Jy';
		$key = hash('sha256', $decodeKey); // Gera uma chave a partir da string
		$iv = substr(hash('sha256', $decodeKey), 0, 16); // Gera um IV a partir da string
		$decodedValue = base64_decode($value);
		$decoded = openssl_decrypt($decodedValue, "AES-256-CBC", $key, 0, $iv);
		return rtrim($decoded, "\0"); // Retorna o valor desencriptado
	}
	
	
	function clean($string) {
			return $string = str_replace(',', '', $string); // Replaces all spaces with hyphens.
	}
	
	function Percentage($value){
			return round($value * 100). "%";
		}
		
		function Percentages($value){
			return round($value * 100);
		}
    
?>
