<?

ini_set("display_errors", 1);  
session_start();

require_once('members.php');


$t='';


$t=pg_escape_string($_GET['table']);

if(empty($t))  header("Location: error.php?mes='Error en el nombre de la tabla'");

$sql= "SELECT * FROM $t ORDER BY ".$t."_model";
$res = pg_query($sql);


include('header.php');

?>


<?


//if(!isset($add)){


        
?>
<br>
<fieldset>
<h3> Already in database</h3>

<ul>
<?	while($row = pg_fetch_assoc($res))
		echo("<li>".$row[$t.'_model']."<a href=\"mod_printer.php?table=$t&id=".$row[$t.'_id']."\">     Modify ==>></a></li>");		
	

?>

</ul>
</fieldset>
	 


<?
include('footer.php');

?>
