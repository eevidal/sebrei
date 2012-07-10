<?


//ini_set("display_errors", 1);  
//session_start();   


include('members.php');


//funciones necesarias
function make_arr($var)
{
        $result=array();
        $var = trim($var, "{}");
        $var=explode(',',$var );

        $cant=count($var);
        $i=1;

        foreach ($var as $value)

        {
                 $result[]= $value ;

        }
//      print_r($result);
        return $result;
}

$t='';

$t=pg_escape_string($_GET['t']);
print($t);
if($t=='tag' || $t=='tagp')
{
	
	$table = 'printer'; // texto, nombre de la tabla

	$res = pg_query("SELECT ".$table."_id,".$table."_vol,".$table."_price  FROM $table ORDER BY ".$table."_id");
	$update= "UPDATE $table SET printer" ;
	$er="Error:";

	while($row = pg_fetch_array($res))
	{	
		$where="WHERE ".$table."_id=".$row['printer_id'];
		if ($t=='tag'){
			$res1=make_arr($row['printer_vol']);
			$min=$res1[0];
			$max=$res1[1];
			$especial=1;
		}
		else if($t=='tagp')
		{
			$especial=2;
			$min=$row['printer_price'];
			$max=$min;
		}

	//preparo los tags 
		$sql1 = pg_fetch_row(pg_query("SELECT ".$t."_id FROM ".$t." WHERE  ".$t."_range[2] >= $min AND ".$t."_range[1] < $min"));
		$sql2 = pg_fetch_row(pg_query("SELECT ".$t."_id FROM ".$t." WHERE  ".$t."_range[2] >= $max AND ".$t."_range[1] < $max"));
		$tag1=$sql1[0];
		$tag2=$sql2[0];
	        $tag11 = '';
	        for ($i=$tag1 ; $i<$tag2; $i++)
        	        $tag11 .=  $i.',';
	        $tag11 .=$tag2;


		if (!empty($tag1)&&!empty($tag2)) pg_query($update."_".$t."=ARRAY[$tag11] ".$where)or die($er.$t);
	}
}
else $especial = 0;	
	

switch ($especial) {
    case 0: $r= "Nada a pasado";
	    break;			
    case 1: $r= "<h2>Base de datos actualizada</h2><p>Resta</p><p><ul>
                <li><a href=\"printers_list.php\" target=\"_blank\">Generar impresoras</a></li>
                <li><a href=\"printers_rule_use.php\" target=\"_blank\">Actualizar reglas de uso</a></li></ul> </p>";
        break;
    case 2:
        $r= "<h2>Base de datos actualizada</h2> <p>Resta</p><p><ul>
                <li><a href=\"printers_list.php\" target=\"_blank\">Generar impresoras</a></li>
                <li><a href=\"printers_rule_price.php\" target=\"_blank\">Actualizar reglas de precio</a></li></ul> </p> ";
        break;

}


	
include('header.php');
	
	//ahora el formulario para agregar los cartuchos 
	echo("<fieldset>");
	echo($r);
	echo("</fieldset>");
	include('footer.php');
//}	
?>
