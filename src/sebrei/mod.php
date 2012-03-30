	<?

ini_set("display_errors", 1);  
session_start();

require_once('members.php');



$t=pg_escape_string($_GET['table']);
$id=$_GET['id'];

if(!is_numeric($id)) header("Location error.php?mes='Consulta incorrecta'");

else {

$sql= "SELECT * FROM $t WHERE ".$t."_id='$id'";
$res = pg_query($sql);
$row = pg_fetch_assoc($res);



include('header.php');


echo("<h2>  ".$t."</h2>");
echo("<form action=\"modify.php\" method=\"GET\">");
echo("<input type=\"hidden\" name=\"table\" value=\"$t\">");
echo("<input type=\"hidden\" name=\"id\" value=\"$id\">");


if($t=='tag'||$t=='cartridge' ){
        if($t=='tag')
        {
                echo("<p>Nombre del tag");
                echo("<input type=\"text\" name=\"new\" class=\"input\" value=".$row[$t.'_name']." size=\"20\" style=\"margin-left: 40px;\" /></p>");
		$a=explode(',' , $row[$t.'_range']);
		$min1=explode('{' , $a[0]);
		$max1=explode('}' , $a[1]);

                echo("<p>Volumen mínimo de páginas al mes recomendado");
                echo("<input type=\"text\" name=\"min\" class=\"input\"  value=".$min1[1]." size=\"10\" style=\"margin-left: 40px;\" /></p>");
                echo("<p>Volumen máximo de páginas al mes recomendado");
                echo("<input type=\"text\" name=\"max\" class=\"input\" value=".$max1[0]."  size=\"10\" style=\"margin-left: 40px;\" /></p>");
        }
        else // es cartridge
        {

                $ven=pg_query("SELECT * FROM vendor");
                echo("<p>Marca</p><select name=\"ven\"  >");
			
                while($row2=pg_fetch_array($ven)) 
			if($row['vendor_id']==$row2['vendor_id'])  
				echo("<option  selected=\"selected\" value=\"".$row2['vendor_id']."\">".$row2['vendor_name']."</option>");
                        else  
				echo("<option   value=\"".$row2['vendor_id']."\">".$row2['vendor_name']."</option>");
                echo("</select></p>");
                echo("<p>Modelo");
               echo("<input type=\"text\" name=\"new\" class=\"input\" value=".$row[$t.'_name']." size=\"20\" style=\"margin-left: 40px;\" /></p>");

                echo("<p>Duración (en páginas)");
                        echo("<input type=\"text\" name=\"valor\" class=\"input\" value=".$row[$t.'_duration']."  size=\"10\" style=\"margin-left: 40px;\" /></p>");


        }

      }

else
	echo("<input type=\"text\" name=\"new\" class=\"input\" value=".$row[$t.'_name']." size=\"20\" style=\"margin-left: 40px;\" />");


echo("<input type=\"submit\" name=\"Modify\" class=\"button-primary\": value=\"Modify\" style=\"margin-top: 5px; margin-left: 195px;\" />");
	echo("</form>");
    
include('footer.php');
}
?>
