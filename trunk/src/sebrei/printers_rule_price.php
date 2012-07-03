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

function make_rule($number,$price, $min,$max)
{
$template="(defrule regla-price".$number."
	?r<-(regla 1)
        (paginas ?p)
        (and (test (> ?p  ".$min.") )(test (<=  ?p  ".$max.")))
	=>
        (retract ?r)
        (assert (tag ".$price."))
)
";
return $template;
}

function make_name()


function create_array($str){
  $psql = "SELECT ".$str."_name,".$str."_range  FROM ".$str ." ORDER BY ".$str."_id";

  $consult = pg_query($psql);
  $result = array();
  $result2	
  while ($res=pg_fetch_row($consult))
        $result[] = $res[$str.'_name'];
#  print_r($result);    
  return $result;
}


include ('header.php');

//function 
$psql = pg_query("SELECT * FROM tagp ORDER BY tagp_id");


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
		
		$m = make_arr($row['tagp_range']);
		$names = make_names($row['tagp_name'],$m[0]);		
		$res = make_rule($i,$names,$m[0],$m[1]);
		fwrite($fp,$res."\n" . PHP_EOL);
		$i++;
	}
	

	

	fclose($fp);

	$old = $PATH_RULES.'/temporary_rules_price';
	$new = $PATH_RULES.'/regla_precio.clp';
	copy($old, $new) or die("Unable to copy $old to $new.");
	echo("<p>Archivo generado regla_uso.clp</p>");	
	
}






include('footer.php');

?>
