<?

//ini_set("display_errors", 1);  
//session_start();   			

require_once('members.php');

$t=pg_escape_string($_GET['table']);
$new="";
$new=$_GET['ad'];


$m="No ha ingresado ningún valor";

if (empty($new))  header("Location: error.php?mes=".$m); 

else {
	if ($t=='tag'||$t=='cartridge'|| $t=='quality') 
	{
		if($t=='tag') 
		{
			$min=pg_escape_string($_GET['min']);
			$max=pg_escape_string($_GET['max']);
			$sql= "INSERT INTO  $t  (".$t."_name , ".$t."_range)  VALUES ('$new', ARRAY[$min,$max])";
		}
		else 
		{ 
			if($t=='quality')
                	{
	                        $hor=pg_escape_string($_GET['hor']);
        	               	$ver=pg_escape_string($_GET['ver']);
					$sql= "INSERT INTO  $t  (".$t."_name )  VALUES ( ARRAY[$hor,$ver])";
			}
			else
			{      
				$vendor = pg_escape_string($_GET['ven']);
				$val=pg_escape_string($_GET['valor']);
				$sql= "INSERT INTO  $t  (".$t."_name , ".$t."_duration, vendor_id)  VALUES ('$new', $val , $vendor )";
			}
		}
	}
	else $sql= "INSERT INTO  $t  (".$t."_name)  VALUES ('$new')";


		$res = pg_query($sql) or die('Error al agregar los datos');

 header("Location: alter.php?table=$t") ;


	}
//include('header.php');
//include('footer.php');

?>
