<?

ini_set("display_errors", 1);  
session_start();

require_once('members.php');

$p="printer";
include('header2.php');

?>

<p>	<a href="index.php">Menu Principal</a>
 |      <a href="manual.php">Manual</a>
 |	<strong><a href="alter_printer.php?table=printer">Modificar un equipo ya existente</a></strong>
 |	<a href="logout.php">Logout</a>
</p>



<?


	echo(" <h2>Agregar un nuevo equipos de impresión</h2>");
	echo("<p>Atención: Luego deberá indicar los cartuchos que usa el equipo.</p>");
	echo("<form action=\"addprinter.php\" method=\"GET\"> <fieldset>");
	echo("<input type=\"hidden\" name=\"table\" value=\"$p\">");
	$v='vendor';
        $ven=pg_query("SELECT * FROM $v ORDER BY ".$v."_name ");
        echo("<p><strong> Marca</strong>  <select name=\"ven\"><option selected=\"selected\">Seleccionar </option>");
        while($vendor=pg_fetch_array($ven))
        	echo("<option value=\"".$vendor['vendor_id']."\">".$vendor['vendor_name']."</option>");
        echo("</select>");
	echo(" <strong> Modelo <span class=\"require\">*</span> </strong><input type=\"text\" name=\"mod\" class=\"input\"  size=\"20\" />
	<strong> Precio aproximado (pesos) <span class=\"require\">*</span> </strong><input type=\"text\" name=\"pre\" class=\"input\"  size=\"5\" />
	</p>");
	$t='type';
	$ty=pg_query("SELECT * FROM $t ORDER BY ".$t."_name ");
	echo("<p><strong> Tipo <span class=\"require\">*</span> </strong><select name=\"type\"><option selected=\"selected\">Seleccionar </option> ");
        while($type=pg_fetch_array($ty))
        	echo("<option value=\"".$type['type_id']."\">".$type['type_name']."</option>");
        echo("</select>");
	$t1='tecnology';
	$te=pg_query("SELECT * FROM $t1 ORDER BY ".$t1."_name ");
        echo("<strong> Tipo de técnologia de impresión <span class=\"require\">*</span> </strong> <select name=\"tec\">
		<option selected=\"selected\">Seleccionar </option> ");
        while($tec=pg_fetch_array($te))
        echo("<option value=\"".$tec['tecnology_id']."\">".$tec['tecnology_name']."</option>");
	echo("</select></p><strong> Memoria (MB) </strong><input type=\"text\" name=\"mem\" class=\"input\"  size=\"20\" />
		</fieldset><fieldset>");
	

	$c='conectivity';
	$co=pg_query("SELECT * FROM $c");
	echo("<p><strong> Conectividad <span class=\"require\">*</span> </strong></p><p>");
        while($con=pg_fetch_array($co))
		echo($con[$c.'_name']."   <input type=\"checkbox\" size=\"10\" name=\"con[]\" value=\"".$con[$c.'_id']."\"><br>");
        echo("</p></fieldset><fieldset>");

	$d='direct';
        $di=pg_query("SELECT * FROM $d");
	echo("<p><strong> Conectividad directa </strong></p><p>");
        while($dir=pg_fetch_array($di))
                echo($dir[$d.'_name']."   <input type=\"checkbox\" name=\"dir[]\" value=\"".$dir[$d.'_id']."\"><br>");
        echo("</p></fieldset><fieldset>");


	$f='function';
        $fu=pg_query("SELECT * FROM $f");
	echo("<p><strong> Funciones <span class=\"require\">*</span> </strong></p><p>");
        while($fun=pg_fetch_array($fu))
                echo($fun[$f.'_name']."   <input type=\"checkbox\" name=\"fun[]\" value=\"".$fun[$f.'_id']."\"><br>");
        echo("</p></fieldset><fieldset>");
	
	$s='sheet';
        $sh=pg_query("SELECT * FROM $s");
        echo("<p><strong> Tamaños de papel</strong> </p><p>");
        while($she=pg_fetch_array($sh))
                echo($she[$s.'_name']."   <input type=\"checkbox\" name=\"she[]\" value=\"".$she[$s.'_id']."\"><br>");
        echo("</p></fieldset><fieldset>");

	$t='paper';
        $ti=pg_query("SELECT * FROM $t");
        echo("<p><strong> Tipos de papel </strong></p><p>");
        while($tip=pg_fetch_array($ti))
                echo($tip[$t.'_name']."   <input type=\"checkbox\" name=\"pap[]\" value=\"".$tip[$t.'_id']."\"><br>");
        echo("</p></fieldset><fieldset>");

	$o='so';
        $os=pg_query("SELECT * FROM $o");
        echo("<p><strong> Sistemas operativos soportados según fabricante</strong> </p><p>");
        while($sos=pg_fetch_array($os))
                echo($sos[$o.'_name']."   <input type=\"checkbox\" name=\"sos[]\" value=\"".$sos[$o.'_id']."\"><br>");
        echo("</p></fieldset><fieldset>");

	$q='quality';
        $qu=pg_query("SELECT * FROM $q");
        echo("<p><strong> Calidades en impresión a color</strong> </p><p>");
        while($qua=pg_fetch_array($qu))
                echo($qua[$q.'_name']."   <input type=\"checkbox\" name=\"qua[]\" value=\"".$qua[$q.'_id']."\"><br>");

	$q='quality';
        $qu=pg_query("SELECT * FROM $q");
        echo("<p><br></p><p><strong> Calidades en impresión negro</strong> </p><p>");
        while($qua=pg_fetch_array($qu))
                echo($qua[$q.'_name']."   <input type=\"checkbox\" name=\"quan[]\" value=\"".$qua[$q.'_id']."\"><br>");

        echo("<p><br></p><p><strong> Velocidades en negro</strong>(ingresarlas separadas por coma) 
        <input type=\"text\" name=\"vel\" class=\"input\"  maxlength=\"300\" size=\"70\" style=\"margin-left: 20px;\" /></p>");

	
	echo("<p><strong> Velocidades en color</strong>(ingresarlas separadas por coma) 
        <input type=\"text\" name=\"vel1\" class=\"input\"  maxlength=\"300\" size=\"70\" style=\"margin-left: 20px;\" /></p>");	

	echo("</p></fieldset><fieldset>");

	echo("<p>Ciclo mensual de trabajo <span class=\"require\">*</span> ");
		echo("<input type=\"text\" name=\"cic\" class=\"input\"  size=\"10\" style=\"margin-left: 40px;\" /></p>");
	echo("<p>Volumen mínimo de páginas al mes recomendado <span class=\"require\">*</span> ");
        echo("<input type=\"text\" name=\"min\" class=\"input\"  size=\"10\" style=\"margin-left: 40px;\" /></p>");
        echo("<p>Volumen máximo de páginas al mes recomendado <span class=\"require\">*</span> ");
        echo("<input type=\"text\" name=\"max\" class=\"input\"  size=\"10\" style=\"margin-left: 40px;\" /></p></fieldset><fieldset>");

	$l='language';
        $la=pg_query("SELECT * FROM $l");
        echo("<p><strong> Lenguajes de impresión / emulación</strong> </p>");
        while($lan=pg_fetch_array($la))
                echo($lan[$l.'_name']."   <input type=\"checkbox\" name=\"lan[]\" value=\"".$lan[$l.'_id']."\"><br>");
       

        $pr='protocol';
        $pro=pg_query("SELECT * FROM $pr");
	echo("<p><strong> Protocolos de red soportados</strong> </p>");
        while($prot=pg_fetch_array($pro))
        	echo($prot[$pr.'_name']."  <input type=\"checkbox\" name=\"prot[]\" value=\"".$prot[$pr.'_id']."\"><br>");


	$spr='security_protocol';
        $spro=pg_query("SELECT * FROM $spr");
        echo("<p><strong> Seguridad Wifi</strong> </p>");
        while($sprot=pg_fetch_array($spro))
                echo($sprot[$spr.'_name']."   <input type=\"checkbox\" name=\"sprot[]\" value=\"".$sprot[$spr.'_id']."\"><br>");
?>
	 </p></fieldset>
	<fieldset>
	
	

	<p><strong>Otras características</strong></p>
	<p>Duplex automático <span class="require">*</span> <input type="checkbox" name="duplex" value="1"><br> 
	Impresión a color <span class="require">*</span> <input type="checkbox" name="color" value="1"> <br>
	LCD<input type="checkbox" name="lcd"  value="1">
	</p> 

	 
	<p>Garantía(en meses) <input type="text"  name="gar" size="10" style="margin-left: 40px" /></p>
	<p>Capacidad (bandeja standart) <input type="text" name="cap"  size="10" style="margin-left: 40px" /></p>
      <p> Capacidad Total(standart + adicionales posibles) <input type="text" name="capt" size="10" style="margin-left: 40px" /></p>
       <p> Capacidad Bandeja de salida <input type="text" name="capo" size="10" style="margin-left: 40px" />


	</p>
	</fieldset>
	<fieldset> <strong> Link del folleto</strong><br>
	<input type="text" name="link" class="input"  maxlength="300" size="70"  /></p>
	 <strong> Descripción o comentarios sobre el modelo</strong><br>
	<textarea name="des" class="input"  rows="10" cols="90" /></textarea>
	<input type="submit" name="send" class="button-primary" value="Siguiente" />
	</fieldset>
</form>
  
      
<?

include('footer.php');

?>
