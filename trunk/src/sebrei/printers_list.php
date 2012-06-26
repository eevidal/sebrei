<?

//ini_set("display_errors", 1);  
//session_start();   			

require_once('members.php');

include ('headers.php');

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
?>

 <h2>Las caracteristicas por defecto son</h2>
	<ul>
		<li>Uso</li>
		<li>Tipo</li>
		<li>Tecnologia</li>
		<li>Color</li>
		<li>Duplex</li>
		<li>A3</li>
		<li>Conexitividad</li>
	</ul>

 <h2>Elegir caracteristicas adiccionales</h2>");
     
 <form>

        <p>T <input type="checkbox" name="duplex" value="1"><br>
        Impresión a color<input type="checkbox" name="color" value="1"> <br>
        LCD<input type="checkbox" name="lcd"  value="1">
        </p>





 </form>

<?
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


// 
/*
(deftemplate printer
   (slot model  (default ?NONE))
   (slot tecnology (default ?NONE))
   (slot type (default ?NONE))
   (multislot conectivity (default any))
   (multislot functions (default any))
   (slot color (default any))
   (slot duplex (default any))
   (slot use (default any))
   (slot maxp (default any))
   (slot minp (default any))
   (slot a3 (default any))
   (slot tag (default ?NONE))
 )

(deftemplate models "Modelos"
  (slot model)
)

*/


$control = fopen($PATH_RULES."/temporary_rules","w+");
if($control == false){
  die("No se ha podido crear el archivo.");
}
else fclose($control)


// header("Location: alter.php?table=$t") ;


	
//include('header.php');
//include('footer.php');

?>
