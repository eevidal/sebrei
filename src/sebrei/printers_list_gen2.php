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
  }
  else {$var= 0;$varf = ""; $varr="";}
  return array($var,$varf, $varr);
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

function make_arr_vel($var,$val)
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


function abool($var)
{
	if($var=='t') return "si";
	else return "no";

}
	



// obtengo las variables
list($dir, $dirf, $dirr) = getvars('direct');
list($pap, $paperf, $paperr) = getvars('paper');
list($she, $sheetf, $sheetr) = getvars('sheet');
list($sos, $sosf, $sosr) = getvars('so');
list($qual, $qualf, $qualr) = getvars('qual');
list($cqual,$cqualf, $cqualr) = getvars('cqual');
list($vel, $velf, $velr) = getvars('vel');
list($cvel, $cvelf, $cvelr) = getvars('cvel');
list($mem, $memf, $memr) = getvars('mem');
list($war, $warf, $warr) = getvars('war');
list($lcd, $lcdf, $lcdr) = getvars('lcd');
list($pro, $prof, $pror) = getvars('pro');
list($spro, $sprof, $spror) = getvars('spro');
list($cap, $capf, $capr) = getvars('cap');
list($ocap, $ocapf, $ocapr) = getvars('ocap');
list($tcap, $tcapf, $tcapr) = getvars('tcap');
list($pdl, $pdlf, $pdlr) = getvars('pdl');



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
// exapmple	
/*(printer (model "HP Deskjet 2050" )(tecnology laser) 
(type multifuncion) (conectivity usb) (functions imprimir copiar escanear) 
(color si) (duplex si) (use hogar)(tag economico))
  */
$function = create_array('function');
$direct = create_array('dicrect');
$paper = create_array('paper');
$language = create_array('language');
$tag = create_array('tag');
$tagp= create_array('tagp');
#$tecnology=array();
$tecnology = create_array('tecnology');
$type = create_array('type');
$quality = create_array('quality');
$quality_color = create_array('quality_color');
$protocol = create_array('protocol');
$security_protocol = create_array('security_protocol');
$sheet = create_array('sheet');
$so = create_array('so');
$conectivity=create_array('conectivity');



$aprinters= array();
$i=0;
$sql = pg_query("SELECT * FROM printer ORDER by printer_id");
while ($row=pg_fetch_array($sql))
{
  $id = $row['printer_id'];
//	print_r($conectivity);
  $con = make_arr_vel($row['printer_conectivities'],$conectivity);
  $fun = make_arr_vel($row['printer_functions'],$function);
  $use = make_arr_vel($row['printer_tag'],$tag);				
  $tgp = make_arr_vel($row['printer_tagp'],$tagp);
  
  $aprinters[] = "(printer (model \"".$row['printer_model']."\" )(tecnology "
		     .$tecnology[$row['tecnology_id']-1].")(type "
		      .$type[$row['type_id']-1].") (conectivity "
		      .$con.") (functions "
		      .$fun.")(color ".abool($row['printer_color']).")(duplex "
		      .abool($row['printer_duplex']).")(use ".$use.")(tag ".$tgp."))";
//			(a3 ".abool($row['printer_color']) ."))";
		
		  

} 

print_r($aprinters);


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
   .$qualf.$cqualf.$velf.$cvelf.$memf
   .$warf.$lcdf.$prof.$sprof.$capf.$ocapf
   .$tcapf.$pdlf;

$varsr=$dirr.$papr.$sher.$sosr
   .$qualr.$cqualr.$velr.$cvelr.$memr
   .$warf.$lcdf.$pror.$spror.$capr.$ocapr
   .$tcapr.$pdlr;


$deft="(deftemplate printer
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
        (model ?model)
        (use ?uso)
        (type ?type)
        (tecnology ?tec)
        (color ?color)
        (duplex ?duplex)"
//        (a3 ?a3)	
	."
	(functions $?functions)"
	.$vars
."
)
	(uso ?uso)
	(type ?type)
	(tecnology ?tec)
	(color ?color)
	(duplex ?duplex)"
	.$vars
."
=>
        (assert (models(model ?model)))

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

}


include('footer.php');

?>
