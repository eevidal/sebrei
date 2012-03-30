<?
include('members.php');

/*echo("<pre>");
print_r($_GET);
print("</pre>");
*/

//funciones necesarias
function make_arr($var)
{
        $str="";
        $cant=count($var);
        $i=1;
        foreach ($var as $value)
        {
                if ($i<$cant) { $str.= $value.',' ; $i+=1;}
                else $str.= $value;
        }
        return $str;
}


function make_arr_vel($var)
{
        $str="";
        $var=explode(',' ,$var );
        $cant=count($var);
        $i=1;
        foreach ($var as $value)
        {
                if ($i<$cant) { $str.= $value.',' ; $i+=1;}
                else $str.=  $value  ;
        }
        return $str;
}


$car='';
$sendc='';
$table = pg_escape_string($_GET['table']); // texto, nombre de la tabla
$car = $_GET['car'];  //ids de los cartuchos
$sendc = $_GET['sendc'];


if(!empty($sendc) && empty($car)) header("Location: error.php?mes='Error en la consulta'");

if (!empty($car)) 
{ 
	$id=$_GET['id'];
 	$car=make_arr($car);
	if (!empty($car)) $car="ARRAY[$car]";
	pg_query("UPDATE $table SET printer_cartridge='$car' WHERE printer_id=$id");
	header("Location: printer.php ");
	exit;

} 
else 
{
	$ven = $_GET['ven'];		// => int, id de vendor
	$mem = $_GET['mem'];		// => int, memoria
	$mod = pg_escape_string($_GET['mod']); //=> texto, modelo del equipo
	$pre = $_GET['pre'];		//=> int precio 
	$type = $_GET['type'];		//=>int  id de tipo
	$tec = $_GET['tec']; 		//=>  int id de tecnologia
	$con = $_GET['con']; 		// => Array de id de conexiones
	$dir = $_GET['dir']; 		// => Array de id de conexiones directas
	$fun = $_GET['fun']; 		// => Array de id de funciones
	$she = $_GET['she']; 		// => Array de id de sheet
	$pap = $_GET['pap']; 		// => Array de id de papers
	$sos = $_GET['sos'];		// => Array de id de so
	$qua = $_GET['qua'];		// => Array de is de calidades
	$quan = $_GET['quan'];		// => Array de is de calidades
	$vel = $_GET['vel'];		// => es un texto separado por comas con las velocidades, que debe ser guardado como (int,--)
	$vel1 = $_GET['vel1'];		// => es un texto separado por comas con las velocidades 
	$cic = $_GET['cic'];		// => int,  ciclo mensual
	$min = $_GET['min'];		// => int, minimo volumen de paginas 
	$max = $_GET['max'];		// => int, maximo columen de paginas 
	$lan = $_GET['lan'];		//=> Array de id de lenguajes de impresion
	$prot = $_GET['prot'];		//=> Array de id de protocolos
	$sprot = $_GET['sprot'];	//=> Array de id de prot. de seguridad 
	$duplex = $_GET['duplex'];	//=> //bool 
	$color = $_GET['color'];	// bool
	$lcd = $_GET['lcd'];		//bool
	$link = $_GET['link'];		//=> texto (link web)
	$des = pg_escape_string($_GET['des']); //=> texto 
	$send = $_GET['send'] ;
	$mem = $_GET['mem'] ;		//memoria



	//preparamos los tags 
	$sql1 = pg_fetch_row(pg_query("SELECT tag_id FROM tag WHERE  tag_range[2] >= $min AND tag_range[1] < $min"));
	$sql2 = pg_fetch_row(pg_query("SELECT tag_id FROM tag WHERE  tag_range[2] >= $max AND tag_range[1] < $max"));
	$tag1=$sql1[0];
	$tag2=$sql2[0];

	
	//contruimos los arrays que necesitamos
	$con=make_arr($con); $pap=make_arr($pap);
	$dir=make_arr($dir); $vel=make_arr_vel($vel); $vel1=make_arr_vel($vel1);
	$she=make_arr($she); $sos=make_arr($sos);
	$qua=make_arr($qua); $lan=make_arr($lan); $quan=make_arr($quan);
	$prot=make_arr($prot); $sprot=make_arr($sprot);
	$fun=make_arr($fun);

	//preparamos los valores booleanos
	if (!isset($color) || $color!=1) $color='false'; else $color='true';
	if (!isset($duplex) || $duplex!=1) $duplex='false'; else $duplex='true';
	if (!isset($lcd) ||$lcd!=1) $lcd='false'; else $lcd='true';

	//nos aseguramos que los valores obligatorios esten todos
	if (!empty($con)) $con="ARRAY[$con]"; else die("Error, debe haber al menos una conexión");
	if (!empty($pap)) $pap="ARRAY[$pap]"; else die("Error, debe haber al menos una tipo de papel");
	if (!empty($she)) $she="ARRAY[$she]"; else die("Error, debe haber al menos un tamaño de papel");
	if($color='true') {if (!empty($qua)) $qua="ARRAY[$qua]"; else die("Error, debe haber al menos una calidad en color");}
	else $qua="ARRAY[0]";
	if (!empty($fun)) $fun="ARRAY[$fun]"; else die("Error, debe haber al menos una funcion");


	//primero inserto sólo los campos que son obligatorios (NOT NULL)
	$sql = "INSERT INTO $table 
		(".$table."_model, vendor_id, tecnology_id, type_id, printer_conectivities, 
		    printer_functions, printer_papers, printer_sheet,
		    printer_color, printer_duplex, printer_mmdc, printer_vol, printer_tag,
		    printer_valid, printer_quality_color )  
		VALUES ('$mod', '$ven', '$tec', '$type', ".$con.",  ".$fun.", ".$pap.",
		 ".$she.",  '$color', '$duplex', '$cic',  ARRAY[$min,$max],  ARRAY[$tag1,$tag2],
		 true,".$qua.")";

	pg_query($sql) or die ("Error al cargar los datos"); 

	//obtengo el clave de la fila recién ingresada
	
	$res = pg_query("SELECT ".$table."_id FROM $table WHERE ".$table."_model='$mod'");
	$id = pg_fetch_array($res);
	$id = $id['printer_id'];


	//agrego los campos opcionales que están presentes
	
 	$update= pg_query("UPDATE $table SET printer_";
	$where="WHERE" .$table."_id=$id")  die ("Error:"; 	

	if (!empty($dir)) $update."_direct_con=ARRAY[$dir] ".$where.$dir);
	if (!empty($vel)) $update"_velocity=ARRAY[$vel] ".$where.$dir);
	if (!empty($vel1)) $update"_velocity_color=ARRAY[$vel1] ".$where.$dir);
	if (!empty($sos)) $update"_so=ARRAY[$sos] ".$where.$dir);
	if (!empty($prot)) $update"_protocols=ARRAY[$prot] ".$where.$dir);
	if (!empty($sprot)) $update."_protocols=ARRAY[$sprot] ".$where.$dir);
	if (!empty($quan)) $update."_quality=ARRAY[$quan] ".$where.$dir);
	if (!empty($lan)) $update."_languages=ARRAY[$lan] ".$where.$dir);
	if (!empty($lcd)) $update."_lcd=ARRAY[$lcd] ".$where.$dir);
	if (!empty($mem)) $update."_memory=ARRAY[$mem] ".$where.$dir);


	//consulto por los cartuchos 
	$sql_car = pg_query("SELECT * FROM cartridge WHERE cartridge_id='$ven'");
	
	include('header.php');

	//ahora el formulario para agregar los cartuchos 

        echo(" <h2>Agregar los cartuchos correspondientes</h2>");
        echo("<form action=\"addprinter.php\" method=\"GET\"> <fieldset>");
        echo("<input type=\"hidden\" name=\"table\" value=\"$p\">");
	echo("<input type=\"hidden\" name=\"id\" value=\"$id\">")
	while ($car = pg_fetch_array($sql_car))
                echo($car['cartridge_name']."   <input type=\"checkbox\" name=\"car[]\" value=\"".$car['cartridge_id']."\">");
        echo("</p></fieldset>");
	?>
	<input type="submit" name="sendc" class="button-primary" value="Siguiente" />
        </fieldset></form>

	<?

	include('footer.php');
}	
?>
