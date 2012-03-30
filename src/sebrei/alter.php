<?

ini_set("display_errors", 1);  
session_start();

require_once('members.php');


$t='';


$t=pg_escape_string($_GET['table']);

if(empty($t))  header("Location: error.php?mes='Error en el nombre de la tabla'");

$sql= "SELECT * FROM $t ORDER BY ".$t."_name";
$res = pg_query($sql);


include('header.php');

?>


<?


//if(!isset($add)){


	echo("<h2>  ".$t."</h2>");
	echo("<form action=\"add.php\" method=\"GET\">");
	echo("<input type=\"hidden\" name=\"table\" value=\"$t\">");

if($t=='tag'||$t=='cartridge' || $t=='quality' ){ 
	if($t=='tag')
	{
		echo("<p>Nombre del tag"); 
		echo("<input type=\"text\" name=\"ad\" class=\"input\"  size=\"20\" style=\"margin-left: 60px;\" /></p>");
		echo("<p>Volumen mínimo de páginas al mes recomendado");
		echo("<input type=\"text\" name=\"min\" class=\"input\"  size=\"10\" style=\"margin-left: 40px;\" /></p>");
		echo("<p>Volumen máximo de páginas al mes recomendado");
		echo("<input type=\"text\" name=\"max\" class=\"input\"  size=\"10\" style=\"margin-left: 40px;\" /></p>");
	}
	else  {
		if ($t=='quality')
        	{
        	        
			echo("<input type=\"hidden\" name=\"ad\" value=\"1\">");	                
                	echo("<p>Valor horizontal");
        	        echo("<input type=\"text\" name=\"hor\" class=\"input\"  size=\"10\" style=\"margin-left: 40px;\" /></p>");
	                echo("<p>Valor vertical");
                	echo("<input type=\"text\" name=\"ver\" class=\"input\"  size=\"10\" style=\"margin-left: 40px;\" /></p>");
       		 }
		else// es cartridge
		{
		
			$ven=pg_query("SELECT * FROM vendor");
			echo("<p>Marca</p><select name=\"ven\">");
        	        while($row=pg_fetch_array($ven)) 
				echo("<option value=\"".$row['vendor_id']."\">".$row['vendor_name']."</option>");
			echo("</select>");
			echo("<p>Modelo"); 
			echo("<input type=\"text\" name=\"ad\" class=\"input\"  size=\"20\" style=\"margin-left: 40px;\" /></p>");
			echo("<p>Duración (en páginas)");
			echo("<input type=\"text\" name=\"valor\" class=\"input\"  size=\"10\" style=\"margin-left: 40px;\" /></p>");

		}
 	}

 }
else {	echo("<input type=\"text\" name=\"ad\" class=\"input\"  size=\"20\" style=\"margin-left: 40px;\" />");

}	echo("<input type=\"submit\" name=\"send\" class=\"button-primary\" value=\"Add New\":  style=\"margin-top: 5px; margin-left: 195px;\" />");
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
	 


<?
include('footer.php');

?>
