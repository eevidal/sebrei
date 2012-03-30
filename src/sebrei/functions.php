<?
include('config.php');


//function connect(){
 if (function_exists("pg_pconnect")) {


	$string="host=".$DB_HOST." port=$DB_PORT"." dbname=".$DB_NAME." user=".$DB_USER." password=".$DB_PASSWORD;
	$pconn=pg_connect($string);

	if (!$pconn) {
                        print " Could Not Connect to Database: ".db_error();
                        exit;
                }
    define('SYS_DB_PRIM', $pconn);

  } else {
        print("function pg_pconnect doesn't exist: no postgresql interface");
        exit;
        }
 
//}
	
?>

