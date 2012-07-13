<?

ini_set("display_errors", 1);  
session_start();   			

require_once('members.php');

$t=pg_escape_string($_GET['table']);
$new="";

$new=$_GET['new'];
$id=$_GET['id'];

if(empty($new)) header("Location: error.php?mes='No ha ingresado ning'un valor'");
else 
{ 
	if(!is_numeric($id)) header("Location: error.php?mes='Error en la consulta'");
	else {
		if ($t=='tag'||$t=='cartridge'||$t=='tagp')
        	{
                	if($t=='tag'||$t=='tagp')
                	{	
                        	$min=pg_escape_string($_GET['min']);
	                        $max=pg_escape_string($_GET['max']);
        	                $sql= "UPDATE  $t  SET ".$t."_name='$new' , ".$t."_range=ARRAY[$min,$max] WHERE ".$t."_id=".$id."";
                	}
	                else
        	        {
                	        $vendor = pg_escape_string($_GET['ven']);
                        	$val=pg_escape_string($_GET['valor']);
	                        $sql="UPDATE  $t SET ".$t."_name='$new' , ".$t."_duration=$val , vendor_id=$vendor WHERE ".$t."_id=".$id."";
	                }
       		 }
		else $sql= "UPDATE $t SET  ".$t."_name='$new'  WHERE ".$t."_id=".$id."";
	
 		$res = pg_query($sql) or  die('Query failed: ' . pg_last_error()); 
		header("Location: alter.php?table=".$t);
		exit;
	}
//include('footer.php');
}
?>
