<?

ini_set("display_errors", 1);  
session_start();

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
//	print_r($result);
        return $result;
}






$table=pg_escape_string($_GET['table']);
$id=$_GET['id'];

if(!is_numeric($id)) header("Location error.php?mes='Consulta incorrecta'");

else {

$sql= "SELECT * FROM $table WHERE ".$table."_id='$id'";
$res = pg_query($sql);
$row = pg_fetch_assoc($res);



include('header.php');


echo("<h2>  ".$table."</h2>");
echo("<form action=\"modify_printer.php\" method=\"GET\">");
echo("<input type=\"hidden\" name=\"table\" value=\"$table\">");
echo("<input type=\"hidden\" name=\"id\" value=\"$id\">");



$p=$table;



?>

<p>	<a href="index.php">Menu Principal</a>
 |      <a href="manual.php">Manual</a>
 |	<strong><a href="alter_printer.php?table=printer">Modificar un equipo ya existente</a></strong>
 |	<a href="logout.php">Logout</a>
</p>





<?


/*        {
                echo("<p>Nombre del tag");
                echo("<input type=\"text\" name=\"new\" class=\"input\" value=".$row[$t.'_name']." size=\"20\" style=\"margin-left: 40px;\" /></p>");
                $a=explode(',' , $row[$t.'_range']);
                $min1=explode('{' , $a[0]);
                $max1=explode('}' , $a[1]);

                echo("<p>Valor mínimo:");
                echo("<input type=\"text\" name=\"min\" class=\"input\"  value=".$min1[1]." size=\"10\" style=\"margin-left: 40px;\" /></p>");
                echo("<p>Valor máximo:");
                echo("<input type=\"text\" name=\"max\" class=\"input\" value=".$max1[0]."  size=\"10\" style=\"margin-left: 40px;\" /></p>");
        }

*/
	if($row['printer_valid']=='t')
                echo("<p><strong>Impresora Activa <input type=\"checkbox\" name=\"valid\" value=\"1\" checked  ></strong>") ;
           else
                echo("<p><strong>Impresora Activa <input type=\"checkbox\" name=\"valid\" value=\"1\" ></strong>") ;

	$v='vendor';
        $ven=pg_query("SELECT * FROM $v ORDER BY ".$v."_id ");
	echo("<p>Marca</p><select name=\"ven\"  >");
                while($row2=pg_fetch_array($ven))
                        if($row['vendor_id']==$row2['vendor_id'])
                                echo("<option  selected=\"selected\" value=\"".$row2['vendor_id']."\">".$row2['vendor_name']."</option>");
                        else
                                echo("<option   value=\"".$row2['vendor_id']."\">".$row2['vendor_name']."</option>");
         echo("</select>");


	echo(" <strong> Modelo </strong>");
	echo("<input type=\"text\" name=\"mod\" class=\"input\" value=".$row[$table.'_model']." size=\"20\" style=\"margin-left: 40px;\" />");
	echo("<strong> Precio (pesos)</strong>");
	echo("<input type=\"text\" name=\"pre\" class=\"input\" value=".$row[$table.'_price']." size=\"20\" style=\"margin-left: 40px;\" /></p>");



	$t='type';
	$ty=pg_query("SELECT * FROM $t ORDER BY ".$t."_id ");
	echo("<p><strong> Tipo  </strong><select name=\"type\">");
        while($type=pg_fetch_array($ty))
		if ($row['type_id']==$type['type_id'])
			echo("<option  selected=\"selected\" value=\"".$type['type_id']."\">".$type['type_name']."</option>");
		else
		       	echo("<option value=\"".$type['type_id']."\">".$type['type_name']."</option>");
        echo("</select>");
	$tecno=$row['tecnology_id'];
	$t1='tecnology';
	$te=pg_query("SELECT * FROM $t1 ORDER BY ".$t1."_id ");
        echo("<strong> Tipo de técnologia de impresión </strong> <select name=\"tec\">");
        while($tec=pg_fetch_array($te))
                if ($tecno==$tec['tecnology_id'])
                        echo("<option  selected=\"selected\" value=\"".$tec[$t1.'_id']."\">".$tec[$t1.'_name']."</option>");
		else
		        echo("<option value=\"".$tec['tecnology_id']."\">".$tec['tecnology_name']."</option>");
	
	echo("</select></p><strong> Memoria (MB) </strong><input type=\"text\" name=\"mem\" class=\"input\"  size=\"20\" value=\"".
		$row['printer_memory']."\"/>
		</fieldset><fieldset>");
	//echo($tecno);	

	$c='conectivity';
	$co=pg_query("SELECT * FROM $c");
	echo("<p><strong> Conectividad </strong></p>");
        while($con=pg_fetch_array($co))
		if (in_array($con[$c.'_id'], make_arr($row['printer_conectivities']))) echo($con[$c.'_name']."   <input type=\"checkbox\" name=\"con[]\" value=\"".$con[$c.'_id']."\" checked >");
		else echo($con[$c.'_name']."   <input type=\"checkbox\" name=\"con[]\" value=\"".$con[$c.'_id']."\">");
        echo("</p></fieldset><fieldset>");

	$d='direct';
        $di=pg_query("SELECT * FROM $d");
	echo("<p><strong> Conectividad directa </strong></p>");
        while($dir=pg_fetch_array($di))
		 if (in_array($dir[$d.'_id'], make_arr($row['printer_direct_con'])))
			echo($dir[$d.'_name']."   <input type=\"checkbox\" name=\"dir[]\" value=\"".$dir[$d.'_id']."\"checked >");
		else
                	echo($dir[$d.'_name']."   <input type=\"checkbox\" name=\"dir[]\" value=\"".$dir[$d.'_id']."\">");
        echo("</p></fieldset><fieldset>");


	$f='function';
        $fu=pg_query("SELECT * FROM $f");
	echo("<p><strong> Funciones </strong></p>");
        while($fun=pg_fetch_array($fu))
		 if (in_array($fun[$f.'_id'], make_arr($row['printer_functions'])))
	                echo($fun[$f.'_name']."   <input type=\"checkbox\" name=\"fun[]\" value=\"".$fun[$f.'_id']."\"checked >");
		else
			echo($fun[$f.'_name']."   <input type=\"checkbox\" name=\"fun[]\" value=\"".$fun[$f.'_id']."\">");
        echo("</p></fieldset><fieldset>");
	
	$s='sheet';
        $sh=pg_query("SELECT * FROM $s");
        echo("<p><strong> Tamaños de papel</strong> </p>");
        while($she=pg_fetch_array($sh))
		if (in_array($she[$s.'_id'], make_arr($row['printer_sheet'])))
			echo($she[$s.'_name']."   <input type=\"checkbox\" name=\"she[]\" value=\"".$she[$s.'_id']."\" checked >");
		else
        	        echo($she[$s.'_name']."   <input type=\"checkbox\" name=\"she[]\" value=\"".$she[$s.'_id']."\">");
        echo("</p></fieldset><fieldset>");

	$t='paper';
        $ti=pg_query("SELECT * FROM $t");
        echo("<p><strong> Tipos de papel </strong></p>");
        while($tip=pg_fetch_array($ti))
		if (in_array($tip[$t.'_id'], make_arr($row['printer_papers'])))
			echo($tip[$t.'_name']."   <input type=\"checkbox\" name=\"pap[]\" value=\"".$tip[$t.'_id']."\"checked >");
		else
        	        echo($tip[$t.'_name']."   <input type=\"checkbox\" name=\"pap[]\" value=\"".$tip[$t.'_id']."\">");
        echo("</p></fieldset><fieldset>");

	$o='so';
        $os=pg_query("SELECT * FROM $o");
        echo("<p><strong> Sistemas operativos soportados según fabricante</strong> </p>");
        while($sos=pg_fetch_array($os))
		if (in_array($sos[$o.'_id'], make_arr($row['printer_so'])))
			echo($sos[$o.'_name']."   <input type=\"checkbox\" name=\"sos[]\" value=\"".$sos[$o.'_id']."\" checked >");
		else
        	        echo($sos[$o.'_name']."   <input type=\"checkbox\" name=\"sos[]\" value=\"".$sos[$o.'_id']."\">");
        echo("</p></fieldset><fieldset>");

	$q='quality';
        $qu=pg_query("SELECT * FROM $q");
        echo("<p><strong> Calidades en impresión a color</strong> </p>");
        while($qua=pg_fetch_array($qu))
		if (in_array($qua[$q.'_id'], make_arr($row['printer_quality_color'])))
			echo($qua[$q.'_name']."   <input type=\"checkbox\" name=\"qua[]\" value=\"".$qua[$q.'_id']."\" checked >");
		else
        	        echo($qua[$q.'_name']."   <input type=\"checkbox\" name=\"qua[]\" value=\"".$qua[$q.'_id']."\">");

	$q='quality';
        $qu=pg_query("SELECT * FROM $q");
        echo("<p><br></p><p><strong> Calidades en impresión negro</strong> </p>");
        while($qua=pg_fetch_array($qu))
		if (in_array($qua[$q.'_id'], make_arr($row['printer_quality'])))
			echo($qua[$q.'_name']."   <input type=\"checkbox\" name=\"quan[]\" value=\"".$qua[$q.'_id']."\" checked>");
		else
	   	        echo($qua[$q.'_name']."   <input type=\"checkbox\" name=\"quan[]\" value=\"".$qua[$q.'_id']."\">");

        echo("<p><br></p><p><strong> Velocidades en negro</strong>(ingresarlas separadas por coma) 
        <input type=\"text\" name=\"vel\" class=\"input\"  maxlength=\"300\" size=\"70\" style=\"margin-left: 20px;\"  value=\"".trim($row['printer_velocity'],"{}") ."\"  /></p>");

// $var = trim($var, "{}");
	
	echo("<p><strong> Velocidades en color</strong>(ingresarlas separadas por coma) 
        <input type=\"text\" name=\"vel1\" class=\"input\"  maxlength=\"300\" size=\"70\" style=\"margin-left: 20px;\" value=\"".trim($row['printer_velocity_color'],"{}") ."\"  /></p>");	

	echo("</p></fieldset><fieldset>");

	echo("<p>Ciclo mensual de trabajo");
		echo("<input type=\"text\" name=\"cic\" class=\"input\"  size=\"10\" style=\"margin-left: 40px;\"  value=\"".
                $row['printer_mmdc']. "\" /></p>");
	$vol=make_arr($row['printer_vol']);	
	echo("<p>Volumen mínimo de páginas al mes recomendado");
        echo("<input type=\"text\" name=\"min\" class=\"input\"  size=\"10\" style=\"margin-left: 40px;\" value=\"".$vol[0] ."\" /></p>");
        echo("<p>Volumen máximo de páginas al mes recomendado");
        echo("<input type=\"text\" name=\"max\" class=\"input\"  size=\"10\" style=\"margin-left: 40px;\" value=\"".$vol[1] ."\"  /></p></fieldset><fieldset>");

	$l='language';
        $la=pg_query("SELECT * FROM $l");
        echo("<p><strong> Lenguajes de impresión / emulación</strong> </p>");
        while($lan=pg_fetch_array($la))
		if (in_array($lan[$l.'_id'], make_arr($row['printer_languages'])))
	                echo($lan[$l.'_name']."   <input type=\"checkbox\" name=\"lan[]\" value=\"".$lan[$l.'_id']."\" checked>");
		else
       			echo($lan[$l.'_name']."   <input type=\"checkbox\" name=\"lan[]\" value=\"".$lan[$l.'_id']."\">");

        $pr='protocol';
        $pro=pg_query("SELECT * FROM $pr");
	echo("<p><strong> Protocolos de red soportados</strong> </p>");
        while($prot=pg_fetch_array($pro))
		if (in_array($prot[$pr.'_id'], make_arr($row['printer_protocols'])))
	        	echo($prot[$pr.'_name']."   <input type=\"checkbox\" name=\"prot[]\" value=\"".$prot[$pr.'_id']."\"checked >");
		else
        	        echo($prot[$pr.'_name']."   <input type=\"checkbox\" name=\"prot[]\" value=\"".$prot[$pr.'_id']."\">");


	$spr='security_protocol';
        $spro=pg_query("SELECT * FROM $spr");
        echo("<p><strong> Seguridad Wifi</strong> </p>");
        while($sprot=pg_fetch_array($spro))
		if (in_array($sprot[$spr.'_id'], make_arr($row['printer_security_protocols'])))
	                echo($sprot[$spr.'_name']."   <input type=\"checkbox\" name=\"sprot[]\" value=\"".$sprot[$spr.'_id']."\" checked>");
		else
        	        echo($sprot[$spr.'_name']."   <input type=\"checkbox\" name=\"sprot[]\" value=\"".$sprot[$spr.'_id']."\">");

?>
	 </p></fieldset>
	<fieldset>
	
	

	<p><strong>Otras características</strong></p>
	<? if($row['printer_duplex']=='t')
		echo("<p>Duplex automático <input type=\"checkbox\" name=\"duplex\" value=\"1\" checked  >") ;
	   else
		echo("<p>Duplex automático <input type=\"checkbox\" name=\"duplex\" value=\"1\" >") ;
	  if($row['printer_color']=='t')
		echo("	Impresión a color<input type=\"checkbox\" name=\"color\" value=\"1\" checked>");
	  else
	 	echo("  Impresión a color<input type=\"checkbox\" name=\"color\" value=\"1\"> ");
	  if($row['printer_lcd']=='t')
		echo("LCD<input type=\"checkbox\" name=\"lcd\"  value=\"1\" checked >");
	  else echo("LCD<input type=\"checkbox\" name=\"lcd\"  value=\"1\">");
	
	     if($row['printer_a3']=='t')
                echo("Impresión enA3<input type=\"checkbox\" name=\"a3\"  value=\"1\" checked >");
          else echo("Impresión en A3<input type=\"checkbox\" name=\"a3\"  value=\"1\">");
	
	 

	?> 
	</p>
	<p>Garantía(en meses) <input type="text"  name="gar" size="10" style="margin-left: 40px" value="<?echo($row['printer_warranty']);?>"/></p>
	<p>Capacidad (bandeja standart) <input type="text" name="cap"  size="10" style="margin-left: 40px" value="<?echo($row['printer_capacity_standart']);?>"  /></p>
      <p> Capacidad Total(standart + adicionales posibles) <input type="text" name="capt" size="10" style="margin-left: 40px" value="<?echo($row['printer_capacity_total']);?>"  /></p>
       <p> Capacidad Bandeja de salida <input type="text" name="capo" size="10" style="margin-left: 40px" value="<?echo($row['printer_capacity_output']);?>"  />


	</p>
	</fieldset>
	<fieldset> <strong> Link del folleto</strong><br>
	<input type="text" name="link" class="input"  maxlength="300" size="70" value="<?echo($row['printer_link']);?>"/></p>
	 <strong> Descripción o comentarios sobre el modelo</strong><br>
	<textarea name="des" class="input"  rows="10" cols="90" value=""> 
	<?print $row['printer_description'];?>
	 </textarea>
	<input type="submit" name="send" class="button-primary" value="Siguiente" />
	</fieldset>
</form>
  
      
<?

include('footer.php');
}
?>
