<?

ini_set("display_errors", 1);  
session_start();

require_once('functions.php');




$t=pg_escape_string($_GET['table']);

$sql= "SELECT * FROM $t ";
$res = pg_query($sql);


include('header.php');

?>


<?


//if(!isset($add)){
echo("<h2>  ".$t."</h2>");
	echo("<form action=\"add.php\" method=\"GET\">");
	echo("<input type=\"hidden\" name=\"table\" value=\"$t\">");
	echo("<input type=\"text\" name=\"ad\" class=\"input\"  size=\"20\" style=\"margin-left: 40px;\" />");
	echo("<input type=\"submit\" name=\"send\" class=\"button-primary\" value=\"Add New\":  style=\"margin-top: 5px; margin-left: 195px;\" />");
	echo("</form>");
        
?>
<br>
<fieldset>
<h3> Already in database</h3>

<ul>
<?	while($row = pg_fetch_assoc($res))
		echo("<li>".$row[$t.'_name']."<a href=\"mod.php?table=$t&id=".$row[$t.'_id']."\">     Modify ==>></a></li>");		
	

?>

</ul>
</fieldset>
<? //}
//else { echo(isset($add));
//	$name = "";//row_table($t);
 //       pg_query("INSERT INTO $t ($name) VALUES '$add')");
//	header ('Location href://');
//}

include('footer.php');

?>
