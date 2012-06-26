<?

//ini_set("display_errors", 1);  
//session_start();   			

require_once('members.php');

include ('header.php');

// ask for features required

/*(defrule recomendar
 (printer
        (model ?model)
        (use ?uso)
        (type ?type)
        (tecnology ?tec)
        (color ?color)
        (duplex ?duplex)
        (a3 ?a3))
 (uso ?uso)
 (type ?type)
 (tecnology ?tec)
 (color ?color)
 (duplex ?duplex)
=>
        (assert (models(model ?model)))

)

(defrule print-recom
 (models (model ?model))
=>
 (printout t crlf ?model "\n")
)
*/
//function 



$direct	= $_GET['direct'];
if(isset($direct)) {
   $directf = "
   (multislot direct (default any))";
   $directr= "
	(direct $?direct)";
}
else {$directf = ""; $directr="";}

$paper = $_GET['paper'];
if(isset($paper)) {
$paperf = "
   (multislot paper (default any))";
$paperr = "
	(paper $?paper)";
}
else {$paperf= ""; $paperr="";}

$sheet  = $_GET['sheet'];
if(isset($sheet)) {
$sheetf = "
   (multislot sheet (default any))";
$sheetr = "
	(sheet $?sheet)";}
else {$sheetf = ""; $sheetr = "";}

$so   = $_GET['so'];
if(isset($so)) $sof = "
   (multislot so (default any))";
else $sof = "";

$qual	 = $_GET['qual'];
if(isset($qual)) $qualf = "
   (multislot quality (default any))";
else $qualf = "";

$cqual	 = $_GET['cqual'];
if(isset($cqual)) $cqualf = "
   (multislot cquality (default any))";
else $cqualf="";

$vel	 = $_GET['vel'];
if(isset($vel)) $velf = "
   (multislot velocity (default any))";
else $velf = "";	

$cvel	 = $_GET['cvel'];
if(isset($cvel)) $cvelf = "
   (multislot cvelocity (default any))";
else $cvelf = "";

$mem    = $_GET['mem'];
if(isset($mem)) $memf = "
   (slot memory (default any))";
else $memf = "";

$war	 = $_GET['war'];
if(isset($war)) $warf = "
   (slot warranty (default any))";
else $warf = "";

$lcd	 = $_GET['lcd'];
if(isset($lcd)) $lcdf = "
   (slot lcd (default any))";
else $lcdf = "";

$pro	 = $_GET['pro'];
if(isset($pro)) $prof = "
   (multislot protocols (default any))";
else $prof = "";

$spro	 = $_GET['spro'];
if(isset($spro)) $sprof = "
   (multislot sprotocols (default any))";
else $sprof = "";

$cap	 = $_GET['cap'];
if(isset($cap)) $capf = "
   (slot capacity (default 0))";
else  $capf = "";

$ocap	 = $_GET['ocap'];
if(isset($ocap)) $ocapf = "
   (slot ocapacity (default any))";
else $ocapf = "";

$tcap = $_GET['tcap'];
if(isset($tcap)) $tcapf = "
   (slot tcapacity (default any))";
else $tcapf = "";

$pdl = $_GET['pdl'];
if(isset($pdl)) $pdlf = "
   (multislot pdl (default any))";
else $pdlf = "";


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

$deft="(deftemplate printer
   (slot model  (default ?NONE))
   (slot tecnology (default ?NONE))
   (slot type (default ?NONE))
   (multislot conectivity (default any))
   (multislot functions (default any))
   (slot color (default any))
   (slot duplex (default any))
   (slot use (default any))
   (slot a3 (default any))"
   .$directf.$paperf.$sheetf.$sof
   .$qualf.$cqualf.$velf.$cvelf.$memf
   .$warf.$lcdf.$prof.$sprof.$capf.$ocapf
   .$tcapf.$pdlf
   ."
)";		

$rule ="(defrule recomendar
 (printer
        (model ?model)
        (use ?uso)
        (type ?type)
        (tecnology ?tec)
        (color ?color)
        (duplex ?duplex)
        (a3 ?a3)	
	(functions $?functions)"
	.$directr.$paperr.$sheetr
/*	.$sor
	.$qualr.$cqualr.$velr.$cvelr.$memr
	.$warr.$lcdr.$pror.$spror.$capr.$ocapr
	.$tcapr.$pdlr*/

."
)
	(uso ?uso)
	(type ?type)
	(tecnology ?tec)
	(color ?color)
	(duplex ?duplex)"
	.$directr.$paperr.$sheetr
/*.$sor
        .$qualr.$cqualr.$velr.$cvelr.$memr
        .$warr.$lcdr.$pror.$spror.$capr.$ocapr
        .$tcapr.$pdlr*/
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

$fp = fopen($PATH_RULES."/temporary_rules","w+");
if($fp == false)
{
	die("No se ha podido crear el archivo.");
}
else 
{
	fwrite($fp,  $sep."\n;; ARCHIVO GENERADO AUTOMATICAMENTE \n".$sep."\n" . PHP_EOL);
	fwrite($fp,  $deft . PHP_EOL);
	fwrite($fp,  "\n\n".$sep."\n;; lista de hechos\n".$sep."\n" . PHP_EOL);
	
	fwrite($fp,  "\n\n".$sep."\n;; Reglas\n".$sep."\n" . PHP_EOL);	
	fwrite($fp,  $rule . PHP_EOL);
	fwrite($fp,  $final . PHP_EOL);


fclose($fp);

}

// header("Location: alter.php?table=$t") ;
/*

/*(defrule recomendar
 (printer
        (model ?model)
        (use ?uso)
        (type ?type)
        (tecnology ?tec)
        (color ?color)
        (duplex ?duplex)
        (a3 ?a3))
 (uso ?uso)
 (type ?type)
 (tecnology ?tec)
 (color ?color)
 (duplex ?duplex)
=>
        (assert (models(model ?model)))

)

(defrule print-recom
 (models (model ?model))
=>
 (printout t crlf ?model "\n")
)
*/

	
//include('header.php');
include('footer.php');

?>
