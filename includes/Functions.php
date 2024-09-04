<?php



    function alertBox($message) {

       return  "<div class=\"alert alert-success alert-dismissable\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">x</button>$message</div>";
    }
    
     
	function format_amount($n, $n_decimals) {
        return ((floor($n) == round($n, $n_decimals)) ? number_format($n).'.00' : number_format($n, $n_decimals));
    }
    
    
	function encryptIt($value) {
		
		$encodeKey = 'Li1KUqJ4tgX14dS,A9ejk?uwnXaNSD@fQ+!+D.f^`Jy';
		$key = hash('sha256', $encodeKey); 
		$iv = substr(hash('sha256', $encodeKey), 0, 16); 
		$encoded = openssl_encrypt($value, "AES-256-CBC", $key, 0, $iv);
		return base64_encode($encoded); 
	}
	

    
	function decryptIt($value) {
		
		$decodeKey = 'Li1KUqJ4tgX14dS,A9ejk?uwnXaNSD@fQ+!+D.f^`Jy';
		$key = hash('sha256', $decodeKey); 
		$iv = substr(hash('sha256', $decodeKey), 0, 16); 
		$decodedValue = base64_decode($value);
		$decoded = openssl_decrypt($decodedValue, "AES-256-CBC", $key, 0, $iv);
		return rtrim($decoded, "\0"); 
	}
	
	
	function clean($string) {
			return $string = str_replace(',', '', $string);
	}
	
	function Percentage($value){
			return round($value * 100). "%";
		}
		
		function Percentages($value){
			return round($value * 100);
		}
    
?>
