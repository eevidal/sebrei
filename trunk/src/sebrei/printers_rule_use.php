<?

//ini_set("display_errors", 1);  
//session_start();   			

require_once('members.php');
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

function make_rule($number,$uso, $min,$max)
{
$template="(defrule regla-uso".$number."
	?r<-(regla 1)
        (paginas ?p)
        (and (test (> ?p  ".$min.") )(test (<=  ?p  ".$max.")))
	=>
        (retract ?r)
        (assert (uso ".$uso."))
)
";
return $template;
}



include ('header.php');

//function 
$psql = pg_query("SELECT * FROM tag ORDER BY tag_id");


// Write all in the file 

$sep = ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;";

$fp = fopen($PATH_RULES."/temporary_rules_use","w+");
if($fp == false)
{
	fclose($fp);
	die("No se ha podido crear el archivo.");
}
else 
{
	fwrite($fp,  $sep."\n;; ARCHIVO GENERADO AUTOMATICAMENTE \n".$sep."\n" . PHP_EOL);
	$i=1;
	while ($row=pg_fetch_array($psql))
	{
		
		$m = make_arr($row['tag_range']);		
		$res = make_rule($i,$row['tag_name'],$m[0],$m[1]);
		fwrite($fp,$res."\n" . PHP_EOL);
		$i++;
	}
	

	

	fclose($fp);

	$old = $PATH_RULES.'/temporary_rules_use';
	$new = $PATH_RULES.'/regla_uso.clp';
	copy($old, $new) or die("Unable to copy $old to $new.");
	echo("<p>Archivo generado regla_uso.clp</p>");	
	
}






include('footer.php');

?>
