<?

//ini_set("display_errors", 1);  
//session_start();   			

require_once('members.php');

include ('header.php');

//function 

function getvars($str){
  $var	= $_GET[$str];
  if(isset($var)) {
   $varf = "
   (multislot ".$str." (default any))";
   $varr= "
	(".$str." $?".$str.")";
   $varr2= "
        (".$str." $?".$str."2)
	(test (subsetp $?".$str." $?".$str."2))";
	
			
  }
  else {$var= 0;$varf = ""; $varr="";$varr2="";}
  return array($var,$varf, $varr,$varr2);
} 

function getvars2($str,$def){
  $var  = $_GET[$str];
  if(isset($var)) {
   $varf = "
   (slot ".$str." (default ".$def."))";
   $varr= "
        (".$str." ?".$str.")";
   $varr2="
        (".$str." ?".$str."2)
        (test (>= ?".$str." ?".$str."2))";	
  }
  else {$var= 0;$varf = ""; $varr="";$varr2="";}
  return array($var,$varf, $varr,$varr2);
}





function create_array($str){
  $psql = "SELECT ".$str."_name FROM ".$str ." ORDER BY ".$str."_id";

  $consult = pg_query($psql);
  $result = array();
  while ($res=pg_fetch_row($consult))
	$result[] = $res[0];
#  print_r($result);	
  return $result;
}

function make_arr($var,$val)
{
        $str="";
	$var = trim($var, "{}");
        $var=explode(',',$var );
        $cant=count($var);
        $i=1;

        foreach ($var as $value)
	
        {
                if ($i<$cant) { $str.= $val[$value-1].' ' ; $i+=1;}
                else $str.=  $val[$value-1]  ;
        }
        return $str;
}

function make_arr3($var)
{

	$result='';
        foreach ($var as $value)

        {
                 $result.= $value.' ';

        }
//      print_r($result);
        return $result;
}



function make_arr_vel($var)
{
        $str="";
        $var = trim($var, "{}");
        $var=explode(',',$var );
        $cant=count($var);
//	print_r ($var) ;
//	print ($cant);
        $i=1;

        foreach ($var as $value)

        {
                if ($i<$cant) { $str.= $value.' ' ; $i+=1;}
                else $str.=  $value  ;
        }
        return $str;
}




function abool($var)
{
	if($var=='t') return "si";
	else return "no";

}
	



// obtengo las variables
list($dir, $dirf, $dirr,$dirr2) = getvars('direct');
list($pap, $papf, $papr,$papr2 ) = getvars('paper');
list($she, $shef, $sher,$sher2 ) = getvars('sheet');
list($sos, $sosf, $sosr,$sosr2) = getvars('so');
/*list($qual, $qualf, $qualr,$qualr2) = getvars('qual');
list($cqual,$cqualf, $cqualr,$cqualr2) = getvars('cqual');
list($vel, $velf, $velr,$velr2) = getvars('vel');
list($cvel, $cvelf, $cvelr,$cvelr2) = getvars('cvel');*/
list($mem, $memf, $memr,$memr2) = getvars2('mem','0');
list($war, $warf, $warr,$warr2) = getvars2('war','12');
list($lcd, $lcdf, $lcdr,$lcdr2) = getvars2('lcd','any');
list($pro, $prof, $pror,$pror2) = getvars('pro');
list($spro, $sprof, $spror,$spror2) = getvars('spro');
list($cap, $capf, $capr,$capr2) = getvars2('cap','0');
list($ocap, $ocapf, $ocapr,$ocapr2) = getvars2('ocap','0');
list($tcap, $tcapf, $tcapr,$tcapr2) = getvars2('tcap','0');
list($pdl, $pdlf, $pdlr,$pdlr2) = getvars('pdl');



/*  TABLE PRINTER
    printer_id integer NOT NULL,
    printer_model character varying NOT NULL,
    vendor_id integer NOT NULL,
    tecnology_id integer NOT NULL,
    type_id integer NOT NULL,
    printer_conectivities integer[] NOT NULL,
    printer_direct_con integer[],
    printer_cartridges integer[],
    printer_functions integer[] NOT NULL,
    printer_papers integer[] NOT NULL,
    printer_sheet integer[] NOT NULL,
    printer_so integer[],
    printer_color boolean NOT NULL,
    printer_duplex boolean NOT NULL,
    printer_mmdc integer NOT NULL,
    printer_vol integer[] NOT NULL,
    printer_tag integer[] NOT NULL,
    printer_link text,
    printer_description text,
    printer_quality_color integer[] NOT NULL,
    printer_valid boolean DEFAULT true NOT NULL,
    printer_languages integer[],
    printer_memory integer,
    printer_lcd boolean,
    printer_protocols integer[],
    printer_security_protocols integer[],
    printer_velocity double precision[],
    printer_velocity_color double precision[],
    printer_quality integer[],
    printer_tagp integer[] NOT NULL,
    printer_price double precision NOT NULL,
    printer_warranty integer,
    printer_capacity_standart integer NOT NULL,
    printer_capacity_total integer NOT NULL,
    printer_capacity_output integer NOT NULL

*/

  
$function = create_array('function');
$direct = create_array('direct');
$paper = create_array('paper');
$language = create_array('language');
$tag = create_array('tag');
$tagp= create_array('tagp');
$tecnology = create_array('tecnology');
$type = create_array('type');
//$quality = create_array('quality');
$protocol = create_array('protocol');
$security_protocol = create_array('security_protocol');
$sheet = create_array('sheet');
$so = create_array('so');
$conectivity=create_array('conectivity');



$aprinters= array();
$i=0;
$sql = pg_query("SELECT * FROM printer WHERE printer_valid='t' ORDER by printer_id");
while ($row=pg_fetch_array($sql))
{
  $id = $row['printer_id'];
//	print_r($conectivity);
  $con = make_arr($row['printer_conectivities'],$conectivity);
  $fun = make_arr($row['printer_functions'],$function);
  $use = make_arr($row['printer_tag'],$tag);				
  $tgp = make_arr($row['printer_tagp'],$tagp);
  $direct2=make_arr($row['printer_direct_con'],$direct);
  if ($dir==1&&$direct2<>"" ) $d= "(direct ".$direct2.")";	else $d="";

  $pa2=make_arr($row['printer_papers'],$paper);
  if ($pap==1&&$pa2<>"" ) $pa= "(paper ".$pa2.")";      else $pa="";
	

  $sh2=make_arr($row['printer_sheet'],$sheet);
  if ($she==1&&$sh2<>"" ) $sh= "(sheet ".$sh2.")";      else $sh="";
	

  $so2=make_arr($row['printer_so'],$so);
  if ($sos==1&&$so2<>"" ) $s= "(so ".$so2.")";      else $s="";

/*  $quality2=make_arr($row['printer_quality'],$quality);
  if ($qual==1&&$quality2<>"" ) $q= "(qual ".$quality2.")";      else $q="";

    $cquality2=make_arr($row['printer_quality_color'],$quality);
  if ($cqual==1&&$cquality2<>"" ) $cq= "(cqual ".$cquality2.")";      else $cq="";

 
  $velocity2=make_arr_vel($row['printer_velocity']);
  if ($vel==1&&$velocity2<>"" ) $v= "(vel ".$velocity2.")";      else $v="";


  $cvelocity2=make_arr_vel($row['printer_velocity_color']);
  if ($cvel==1&&$cvelocity2<>"" ) $cv= "(cvel ".$cvelocity2.")";      else $cv="";*/

  $protocol2=make_arr($row['printer_protocols'],$protocol);
  if ($pro==1&&$protocol2<>"" ) $p= "(pro ".$protocol2.")";      else $p="";

  $sprotocol2=make_arr($row['printer_security_protocols'],$security_protocol);
   if ($spro==1&&$sprotocol2<>"" ) $sp= "(spro ".$sprotocol2.")";      else $sp="";

  $pdl2=make_arr($row['printer_languages'],$language);
  if ($pdl==1&&$pdl2<>"" ) $pd= "(pdl ".$pdl2.")";      else $pd="";

  $war2= $row['printer_warranty'];
  if ($war==1&&$war2 ) $w= "(war ".$war2.")";      else $w="";

  $mem2= $row['printer_memory'];
  if ($mem==1&&$mem2 ) $m= "(mem ".$mem2.")";      else $m="";


  $cap2= $row['printer_capacity_standart'];
  if ($cap==1&&$cap2 ) $c= "(cap ".$cap2.")";      else $c="";
  $ocap2= $row['printer_capacity_output'];
  if ($ocap==1&&$ocap2 ) $o= "(ocap ".$ocap2.")";      else $o=""; 
  $tcap2= $row['printer_capacity_total'];
  if ($tcap==1&&$tcap2 ) $t= "(tcap ".$tcap2.")";      else $t="";

  $lcd2= abool($row['printer_lcd']);
  if ($lcd==1 ) $l= "(lcd ".$lcd2.")";      else $l="";

 
  $aprinters[] = "(printer (id ".$id.")(model \"".$row['printer_model']."\" )(tecnology "
		     .$tecnology[$row['tecnology_id']-1].")(type "
		      .$type[$row['type_id']-1].") (conectivity "
		      .$con.") (functions "
		      .$fun.")(color ".abool($row['printer_color']).")(duplex "
		      .abool($row['printer_duplex']).")(use ".$use.")(tag ".$tgp.")"
			."(a3 ".abool($row['printer_a3']) .")"
			.$d.$pa.$sh.$s.$m.$w.$l.$p.$sp.$c.$o.$t.$pd.")";

} 



// Dedfaults
//-----------

/*  
    Uso
    Tipo (impresora, multifuncion)
    Funciones (imprimir, escanear, etc)	
    Tecnologia (laser, inkjet, etc)
    Color (si/no)
    Duplex automatico (si/no)
    A3 (si/no)
    Conexitividad (usb, ethernet, etc)

(deftemplate models "Modelos"
  (slot model)
)

*/
$varsf=$dirf.$papf.$shef.$sosf
 //  .$qualf.$cqualf.$velf.$cvelf
    .$memf
   .$warf.$lcdf.$prof.$sprof.$capf.$ocapf
   .$tcapf.$pdlf;

$varsr=$dirr.$papr.$sher.$sosr
 //  .$qualr.$cqualr.$velr.$cvelr
   .$memr.$warr.$lcdr.$pror.$spror.$capr.$ocapr
   .$tcapr.$pdlr;

$vars2=$dirr2.$papr2.$sher2.$sosr2
 //  .$qualr2.$cqualr2.$velr2.$cvelr2
   .$memr2
   .$warr2.$lcdr2.$pror2.$spror2.$capr2.$ocapr2
   .$tcapr2.$pdlr2;


$deft="(deftemplate printer
   (slot id (default ?NONE))	
   (slot model  (default ?NONE))
   (slot tecnology (default ?NONE))
   (slot type (default ?NONE))
   (multislot conectivity (default any))
   (multislot functions (default any))
   (slot color (default any))
   (slot duplex (default any))
   (multislot use (default any))
   (multislot tag (default any))
   (slot a3 (default any))"
   .$varsf
   ."
)";	

$defm= "(deftemplate models \"Modelos\"
  (slot model)
)";

$def="(deffacts the-printer-list
";



$rule ="(defrule recomendar
 (printer
	(id ?id)
        (model ?model)
        (use $?uso)
        (type ?type)
        (tecnology ?tec)
        (color ?color)
        (duplex ?duplex)
        (a3 ?a3)	
	(functions $?functions)"
	.$varsr
."
)
	(uso $?uso2)
	(functions $?functions2)
        (test (subsetp $?uso2 $?uso))
        (test (subsetp $?functions $?functions2))
        (test (subsetp $?functions2 $?functions))
	(type ?type)
	(tecnology ?tec)
	(color ?color)
	(a3 ?a3)
	(duplex ?duplex)"
	.$vars2
."
=>
        (assert (models(model ?model)))
	(assert (id ?id))

)";

$final = "(defrule print-recom
 (models (model ?model))
=>
 (printout t crlf ?model \"\\n\")
)";

$sep = ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;";


// Write all in the file 

$fp = fopen($PATH_RULES."/temporary_rules","w+");
if($fp == false)
{
	fclose($fp);
	die("No se ha podido crear el archivo.");
}
else 
{
	fwrite($fp,  $sep."\n;; ARCHIVO GENERADO AUTOMATICAMENTE \n".$sep."\n" . PHP_EOL);
	fwrite($fp,  $deft . PHP_EOL);
	fwrite($fp,  $defm . PHP_EOL);
	fwrite($fp,  "\n\n".$sep."\n;; lista de hechos\n".$sep."\n" . PHP_EOL);
	fwrite($fp,  $def . PHP_EOL);
	for($i=0;$i<count($aprinters);$i++)
        fwrite($fp, $aprinters[$i] ."\n" . PHP_EOL); 
	fwrite($fp,  ")" . PHP_EOL);

	
	fwrite($fp,  "\n\n".$sep."\n;; Reglas\n".$sep."\n" . PHP_EOL);	
	fwrite($fp,  $rule . PHP_EOL);
	fwrite($fp,  $final . PHP_EOL);
	fclose($fp);

	$old = $PATH_RULES.'/temporary_rules';
	$new = $PATH_RULES.'/printers.clp';
	copy($old, $new) or die("Unable to copy $old to $new.");
}

//ahora genero reglas adicionales

$asserts = "
(defrule adicional
 (adicionales)
=>
 (assert (direct any ".make_arr3($direct)."))
 (assert (so any".make_arr3($so)."))
 (assert (mem 0))
 (assert (war 0))
 (assert (lcd any))
 (assert (pro any ".make_arr3($protocol)."))
 (assert (spro any ".make_arr3($security_protocol)."))
 (assert (cap 0))
 (assert (ocap 0))
 (assert (tcap 0))
)";

$fp = fopen($PATH_RULES."/temporary_rules_aditionals","w+");
if($fp == false)
{
        fclose($fp);
        die("No se ha podido crear el archivo.");
}
else
{
        fwrite($fp,  $sep."\n;; ARCHIVO GENERADO AUTOMATICAMENTE \n".$sep."\n" . PHP_EOL);
	fwrite($fp,  $asserts . PHP_EOL);
	
        fclose($fp);
}


echo("<p>Archivo generados printers.clp y temporary_rules_aditionals</p>");
echo("<p>Verificar temporary_rules_aditionals y mover aditionals.clp lo relevante </p>");	
	







include('footer.php');

?>
