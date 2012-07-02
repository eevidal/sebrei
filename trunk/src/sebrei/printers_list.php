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
?>
<fieldset>
 <h2>Las caracteristicas por defecto son</h2>
	<ul>
		<li>Uso</li>
		<li>Tipo (impresora, multifunción)</li>
		<li>Tecnologia (laser, inkjet, etc)</li>
		<li>Color (si/no)</li>
		<li>Duplex automótico (si/no)</li>
		<li>A3 (si/no)</li>
		<li>Conexitividad (usb, ethernet, etc)</li>
		 <li>Funciones (copiar, escanear, imprimir, etc)</li>
	</ul>

 <h2>Elegir caracteristicas adiccionales<br>
		Recuerde agregar las reglas correspondientes!!!</h2>   
 <form  action="printers_list_gen.php" method="GET"  >

        <p>
<input type="checkbox" name="direct" value="1">	Conectividad Directa <br>
<input type="checkbox" name="paper" value="1">  Tipo de papel  <br>
<input type="checkbox" name="sheet" value="1">  Tamaños de papel <br>
<input type="checkbox" name="so" value="1">	Sistemas Operativos <br>
<!--<input type="checkbox" name="qual" value="1">	Maxima calidad de Impresion en Blanco y Negro <br>
<input type="checkbox" name="cqual" value="1">	Maxima calidad de Impresion a Color <br>
<input type="checkbox" name="vel" value="1">	Maxima velocidad en blanco y negro <br>
<input type="checkbox" name="cvel" value="1">	Maxima velocidad a Color <br>-->
<input type="checkbox" name="mem" value="1">    Memoria <br>
<input type="checkbox" name="war" value="1">	Período de garantía <br>
<input type="checkbox" name="lcd" value="1">	LCD <br>
<input type="checkbox" name="pro" value="1">	Protocolos de comunicación <br>
<input type="checkbox" name="spro" value="1">	Protocolos de seguridad Wifi <br>
<input type="checkbox" name="cap" value="1">	Capacidad Bandeja Standart <br>
<input type="checkbox" name="ocap" value="1">	Capacidad Bandeja Salida <br>
<input type="checkbox" name="tcap" value="1">	Capacidad total de bandejas  <br>
<input type="checkbox" name="pdl" value="1">	Lenguajes de descripcion de páginas<br>
        </p>
	<input type="submit" name="enviar" value="Enviar Seleccion" />
 </form>
</fieldset>
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

/*
$control = fopen($PATH_RULES."/temporary_rules","w+");
if($control == false){
  die("No se ha podido crear el archivo.");
}
else fclose($control)

*/
// header("Location: alter.php?table=$t") ;


	
//include('header.php');
include('footer.php');

?>
