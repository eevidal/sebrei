<?

ini_set("display_errors", 1);
session_start();

require_once('members.php');

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




$t='';


$t=pg_escape_string($_GET['table']);

if(empty($t))  header("Location: error.php?mes='Error en el nombre de la tabla'");


$car = $_GET['car'];            // => Array de id de cartuchos
$id = $_GET['id'];      // id de la tabla



//Intento agregar la lista de cartuchos

$update= "UPDATE $t SET printer_";
$where=" WHERE " .$t."_id=$id";
$er="Error";
$car=make_arr($car);
$delete = "DELETE $table " ;


if (!empty($car))  pg_query($update."cartridges=ARRAY[$car]".$where )or die($er);
//si no hay cartuchos elimino la columna
else pg_query($delete.$where)or die("Error, no indico cartuchos");




include('header.php');
?>

<p>     <a href="index.php">Menu Principal</a>
 |      <a href="manual.php">Manual</a>
 |	<a href="printer.php">Agregar otro Equipo</a>
</p>

<p>Equipo Agregado correctamente</p>


<?
include('footer.php')

?>

