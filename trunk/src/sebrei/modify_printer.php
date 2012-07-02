<?


ini_set("display_errors", 1);  
session_start();   

//include('header.php');
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

/*
$car='';
$sendc='';*/
$table = pg_escape_string($_GET['table']); // texto, nombre de la tabla
$car = $_GET['car'];  //ids de los cartuchos
$sendc = $_GET['sendc'];


//if(!empty($sendc) && empty($car)) header("Location: error.php?mes='Error en la consulta'");
/*
if (!empty($car)) 
{ 
	$id=$_GET['id'];
 	$car=make_arr($car);
	if (!empty($car)) $car="ARRAY[$car]";
	pg_query("UPDATE $table SET printer_cartridge='$car' WHERE printer_id=$id");
		//header("Location: printer.php ");
	exit;

	} ;
else 
{*/
	$id = $_GET['printer_id'];
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
	$qua = $_GET['qua'];		// => Array de ids de calidades
	$quan = $_GET['quan'];		// => Array de ids de calidades
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
	$send = $_GET['send'];
	$mem = $_GET['mem'];		//memoria
	$gar = $_GET['gar']; 		//garant'ia
	$cap = $_GET['cap']; 		//capacidad
	$capt = $_GET['capt']; 		//capacidad total
	$capo = $_GET['capo'];          //capacidad bandeja salida

	//preparo los tags de volumnen
	$sql1 = pg_fetch_row(pg_query("SELECT tag_id FROM tag WHERE  tag_range[2] >= $min AND tag_range[1] < $min"));
	$sql2 = pg_fetch_row(pg_query("SELECT tag_id FROM tag WHERE  tag_range[2] >= $max AND tag_range[1] < $max"));
	$tag1=$sql1[0];
	$tag2=$sql2[0];
	
	//preparo los tag de precios

	$sql1p = pg_fetch_row(pg_query("SELECT tagp_id FROM tagp WHERE  tagp_range[2] >= $pre AND tagp_range[1] < $pre"));
        $sql2p = pg_fetch_row(pg_query("SELECT tagp_id FROM tagp WHERE  tagp_range[2] >= $pre AND tagp_range[1] < $pre"));
        $tag1p=$sql1p[0];
        $tag2p=$sql2p[0];

	     //prepararo los valores booleanos
        if (!isset($color) || $color!=1) $color="false"; else $color="true";
        if (!isset($duplex) || $duplex!=1) $duplex='false'; else $duplex='true';
        if (!isset($lcd) ||$lcd!=1) $lcd='false'; else $lcd='true';



	
	//contruyo los arrays que necesito
	$con=make_arr($con); $pap=make_arr($pap);
	$dir=make_arr($dir); $vel=make_arr_vel($vel); $vel1=make_arr_vel($vel1);
	$she=make_arr($she); $sos=make_arr($sos);
	if(($color=="true")&&(!(empty($qua)))) $qua=make_arr($qua); 
	$lan=make_arr($lan); $quan=make_arr($quan);
	$prot=make_arr($prot); $sprot=make_arr($sprot);
	$fun=make_arr($fun);

	//prepararo los valores booleanos
//	if (!isset($color) || $color!=1) $color='false'; else $color='true';
//	if (!isset($duplex) || $duplex!=1) $duplex='false'; else $duplex='true';
//	if (!isset($lcd) ||$lcd!=1) $lcd='false'; else $lcd='true';

	//me aseguro que los valores obligatorios esten todos
	if (!empty($con)) $con="ARRAY[$con]" ; else die("Error, debe haber al menos una conexión");
	if (!empty($pap)) $pap="ARRAY[$pap]" ; else die("Error, debe haber al menos una tipo de papel");
	if (!empty($she)) $she="ARRAY[$she]"; else die("Error, debe haber al menos un tamaño de papel");
	if($color=="true") { if (!empty($qua)) $qua="ARRAY[$qua]"; else die("Error, debe haber al menos una calidad en color");}
		else $qua="ARRAY[0]";
	if (!empty($fun)) $fun="ARRAY[$fun]" ; else die("Error, debe haber al menos una funcion");


	//primero inserto sólo los campos que son obligatorios (NOT NULL)



/*		    printer_valid, printer_quality_color,printer_tagp, printer_price, 
		    printer_capacity_standart, printer_capacity_total, printer_capacity_output )  
 		 true,".$qua.",ARRAY[$tag1p,$tag2p], '$pre', '$cap','$capt','$capo')";

	pg_query($sql) or die ("Error al cargar los datos"); 

*/
	//agrego los campos opcionales que están presentes
	
 	$update= "UPDATE $table SET printer" ;
	$update2= "UPDATE $table SET " ;
	$where="WHERE " .$table."_id=$id" ;
	$er="Error:"; 	


	if (!empty($mod))  pg_query($update."_model=$mod ".$where)or die($er.$mod);
	if (!empty($ven))  pg_query($update2."vendor_id=$ven ".$where)or die($er.$ven);
	if (!empty($tec)  pg_query($update2."tecnology_id=$tec ".$where)or die($er.$tec);
	if (!empty($type)  pg_query($update2."type_id=$type ".$where)or die($er.$type);
	if (!empty($con)) pg_query($update."_conectivities=$con ".$where)or die($er.$con);
	if (!empty($fun)) pg_query($update."_functions=$fun ".$where)or die($er.$fun);
	if (!empty($pap)) pg_query($update."_papers=$pap ".$where)or die($er.$pap);	
	if (!empty($she)) pg_query($update."_sheet=$sheet ".$where)or die($er.$she); 
	if (!empty($color)) pg_query($update."_color=$color ".$where)or die($er.$color);
	if (!empty($duplex)) pg_query($update."_duplex=$duplex ".$where)or die($er.$duplex);
	if (!empty($cic)) pg_query($update."_mmdc=$cic ".$where)or die($er.$cic);
	if (!empty($min)&&!empty($max)) pg_query($update."_vol=ARRAY[$min,$max] ".$where)or die($er."min-max");
	if (!empty($tag1)&&!empty($tag2)) pg_query($update."_tag=ARRAY[$tag1,$tag2] ".$where)or die($er."tag");
	//agregar el campo valid	
	if (!empty($qua)) pg_query($update."_quality_color=$qua ".$where)or die($er.$qua);
	if (!empty($tag1p)&&!empty($tag2p)) pg_query($update."_tagp=ARRAY[$tag1p,$tag2p] ".$where)or die($er."tagp");
	if (!empty($pre)) pg_query($update."_price=$pre ".$where)or die($er.$pre);


	if (!empty($dir)) pg_query($update."_direct_con=ARRAY[$dir] ".$where)or die($er.$dir);
	if (!empty($vel)) pg_query($update."_velocity=ARRAY[$vel] ".$where)or die($er .$vel);
	if (!empty($vel1)) pg_query($update."_velocity_color=ARRAY[$vel1]".$where )or die($er.$vel1);
	if (!empty($sos)) pg_query($update."_so=ARRAY[$sos] ".$where)or die($er .$sos);
	if (!empty($prot)) pg_query($update."_protocols=ARRAY[$prot] ".$where)or die($er .$prot);
	if (!empty($sprot)) pg_query($update."_protocols=ARRAY[$sprot] ".$where)or die($er .$sprot);
	if (!empty($quan)) pg_query($update."_quality=ARRAY[$quan] ".$where)or die($er .$quan);
	if (!empty($lan)) pg_query($update."_languages=ARRAY[$lan] ".$where)or die($er .$lan);
	if (!empty($lcd)) pg_query($update."_lcd=$lcd ".$where)or die($er .$lcd);
	if (!empty($mem)) pg_query($update."_memory=$mem ".$where)or die($er .$mem);
	if (!empty($gar)) pg_query($update."_warranty=$gar ".$where)or die($er .$gar);
	if (!empty($link)) pg_query($update."_link=$link ".$where)or die($er .$link);
	if (!empty($des)) pg_query($update."_description=$des ".$where)or die($er .$des);

	//consulto por los cartuchos 
	$sql_car = pg_query("SELECT * FROM cartridge WHERE vendor_id='$ven'");
	
include('header.php');
	
	//ahora el formulario para agregar los cartuchos 

        echo(" <h2>Agregar los cartuchos correspondientes</h2>");
        echo("<form action=\"addprinter2.php\" method=\"GET\"> <fieldset>");
        echo("<input type=\"hidden\" name=\"table\" value=\"printer\">");
	echo("<input type=\"hidden\" name=\"id\" value=\"$id\">");
	while ($car = pg_fetch_array($sql_car))
                echo($car['cartridge_name']."   <input type=\"checkbox\" name=\"car[]\" value=\"".$car['cartridge_id']."\"><br>");
        echo("</fieldset>");
	?>
	<input type="submit" name="sendc" class="button-primary" value="Siguiente" />
        </fieldset></form>

<?

	include('footer.php');
//}	
?>
