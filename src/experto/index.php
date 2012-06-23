<?

include('../header.php');


$color=$_GET['color'];
$pag=$_GET['pag'];
$grupo=$_GET['grupo'];

if(!(isset($_GET['env']))){

echo("<form action=\"$_SELF\" method=\"GET\"> <fieldset>");
        echo("<input type=\"hidden\" name=\"env\" value=\"1\">");
?>

<p class="question">Desea poder imprimir a color?</p>
<input type="radio" name="color" value="si"> Si<br>
<input type="radio" name="color" value="no" >No 

<p class="question">Cual es el volumen de páginas mensuales?</p>
<input type="text" name="pag"/>
<p class="question">Cual es el tamaño del grupo de trabajo?</p>
<input type="text" name="grupo"/>

<input type="submit" value="Submit" />


<?
}
else {


switch ($grupo) {
    case ($grupo<=1):
          $gv=500;
        break;
    case ($grupo<4 && $grupo >1):
        $gv=5000;
        break;
    case ($grupo<12 && $grupo >4):
        $gv=10000;
	break;
    default: $gv=15000;	break;
   
}

$vol=($pag + $gv)/2;





clips_clear();
//	clips_set_strategy(LEX_STRATEGY);
clips_load("SE_FC.CLP");
clips_reset();
	

//ob_start();
/*passthru("/usr/bin/clips, $result");
$content_grabbed=ob_get_contents();
ob_end_clean();

if($result=0){
 echo '<div>',$content_grabbed,'</div>';
}
*/


//$output = shell_exec('clips');
//echo "<pre>$output</pre>";


// seteo del color
if ($color) clips_assert(array("color", $color));
//else clips_assert( color no);
//	clips_assert(array("volumen", array("paginas", $vol)));	
//seteo del uso
switch ($vol) {
    case ($vol<=500):
        clips_assert(array ("uso", "hogar"));
	$uso="hogar";	
        break;
    case ($vol>500 && $vol <=1000):
        clips_assert(array("uso", "profesional"));
        $uso="profesional";   
        break;
    case ($vol>1000 && $vol <=5000):
	clips_assert(array("uso", "pyme"));
        $uso="pyme";
        break;
    case ($vol>5000 && $vol <=10000):
        clips_assert(array("uso", "pyme+"));
        $uso="pyme+";
        break;
    case ($vol>10000 ):
        clips_assert(array("uso", "empresarial"));
        $uso="empresarial";
        break;
}


 



//	clips_assert( volumen (pagina $vol ));
	$fired=clips_run();
	
	$rules=clips_get_defrule_list();
	
//	print_r($rules);
	$facts = clips_get_fact_list();

//	$ag = clips_get_salience_evaluation();	
	echo("<p>Fired</p>");
	echo($fired);

	print_r($facts);
	echo("<p>Rules</p>");
	print_r($rules);
	$fired=clips_run();
	  echo("<p>Fired</p>");
        echo($fired);


//phpinfo();
}
include('../footer.php');
?>
