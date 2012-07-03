<?

include('members.php');
include('header.php');
?>


<div id="content-inner">
        
        <div id="content-right">
   
            <div id="page-title">
                 <h1 align="center"> Menú Principal</h1>
            </div>
    

<div class="maincontent">
<table>
<tr>
<th align="center">Agregar / Modificar</th>  <!--<th align="center">Modify</th>-->
<th align="center">Mantenimiento</th>
</tr>


<tr><td  width="380px">

<fieldset style="width: 260px; height: 450px; margin-left: 55px; " >
  <p>      
	<ul>
		<li><a href="alter.php?table=quality">Calidad</a></li>
		<li><a href="alter.php?table=cartridge">Cartuchos</a></li>
		 <li><a href="alter.php?table=tag">Categorías de uso</a></li>

		<li><a href="alter.php?table=conectivity">Conexiones</a></li>
                <li><a href="alter.php?table=direct">Conexiones directas</a></li>
		<li><a href="printer.php">Equipos</a></li>

		<li><a href="alter.php?table=function">Funciones</a></li>

                <li><a href="alter.php?table=vendor">Marcas</a></li>

                <li><a href="alter.php?table=language">Printer description Languajes</a></li>
                <li><a href="alter.php?table=protocol">Protocolos de red</a></li>
		<li><a href="alter.php?table=security_protocol">Seguridad Wifi</a></li>

		<li><a href="alter.php?table=so">SO</a></li>
		
		 <li><a href="alter.php?table=tagp">Tag precio</a></li>
		<li><a href="alter.php?table=sheet">Tamaños de papel</a></li>

                <li><a href="alter.php?table=tecnology">Tecnología</a></li>

		<li><a href="alter.php?table=type">Tipo de equipos</a></li>

		<li><a href="alter.php?table=paper">Tipos de papel</a></li>
		<li>--------------------------</li>
		<li><a href="users.php">Usuarios</a></li>

	</ul>
  </p>





</fieldset></td>

<td width="380px">
<fieldset style="width: 260px; height: 450px; margin-left: 40px; " >

  <p>
        <ul>

	
                <li><a href="printers_categories.php?t=tag">Actualizar categorías de uso</a></li>
                <li><a href="printers_categories.php?t=tagp">Actualizar catagorías de precio</a></li>
                <li><a href="printers_list.php">Generar impresoras</a></li>
                <li><a href="printers_rule_use.php">Actualizar reglas de uso</a></li>
		 <li><a href="printers_rule_price.php">Actualizar reglas de precio</a></li>


        </ul>
  </p>

</fieldset>
  </td>

</tr></table>

</div>





                    </div>



                </div>




<?
include('footer.php');
?>
