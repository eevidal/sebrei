 <?php 

//ini_set("display_errors", 1);     // for debug 
//session_start();

 // Connects to your Database 

include('functions.php');
 
 //checks cookies to make sure they are logged in 

 if(isset($_COOKIE['ID_my_site'])) 

 { 

 	$username = $_COOKIE['ID_my_site']; 
 	$pass = $_COOKIE['Key_my_site']; 
 	$check = pg_query("SELECT * FROM users WHERE user_name = '$username'"); 
 	while($info = pg_fetch_array( $check )) 	 
 		{ 

 //if the cookie has the wrong password, they are taken to the login page 

 		if ($pass != $info['user_pw']) 

 			{ 			header("Location: login.php"); 

 			} 

 //otherwise they are shown the admin area	 
 		
 		} 
} 

 else 
 //if the cookie does not exist, they are taken to the login screen 
 { header("Location: login.php"); } 

 ?> 
