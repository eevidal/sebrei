<?
ini_set("display_errors", 1);  
session_start();

include('functions.php');


 if(isset($_COOKIE['ID_my_site']))


 //if there is, it logs you in and redirect to menu 

 { 
 	$username = $_COOKIE['ID_my_site']; 
 	$pass = $_COOKIE['Key_my_site'];
 	$check = pg_query("SELECT * FROM users WHERE user_name = '$username'");
 	while($info = pg_fetch_array( $check )) 	
 		{
 		if (md5($pass) != $info['user_pw']) 
 			{
			 			}
		else
 			{
			header("Location: index.php");
 			}
 		}
 }


 //if the login form is submitted 

 if (isset($_POST['submit'])) { // if form has been submitted

 // makes sure they filled it in
 	if(!$_POST['username'] | !$_POST['pass']) {
 		echo('You did not fill in a required field.');
 	}

   // checks it against the database

   $_POST['username'] = pg_escape_string($_POST['username']);
   $check = pg_query("SELECT * FROM users WHERE user_name = '".$_POST['username']."'");

   //Gives error if user dosen't exist

   $check2 = pg_num_rows($check);

   if ($check2 == 0) {

 		echo('That user does not exist.');
				}

   while($info = pg_fetch_array( $check )) 	
   {

    $_POST['pass'] = md5(stripslashes($_POST['pass']));
    $info['user_pw'] = stripslashes($info['user_pw']);
 //$_POST['pass'] = ($_POST['pass']);


 	//gives error if the password is wrong

 	if ($_POST['pass'] != $info['user_pw']) {
			echo('Incorrect password, please try again.');//.$_POST['pass']);

 	}
	 else 
 	{ 
 	 // if login is ok then we add a cookie 
	 $_POST['username'] = stripslashes($_POST['username']); 
	 $hour = time() + 360000; 
	 setcookie(ID_my_site, $_POST['username'], $hour); 
	 setcookie(Key_my_site, $_POST['pass'], $hour);	 
	 //then redirect them to the members area 
	 header("Location: index.php"); 

	 } 
   } 

 } //if submit

 else 

{	 

 
 // if they are not logged in 
include('header.php');
 ?> 

 <form action="<?php echo $_SERVER['PHP_SELF']?>" method="post"> 

<fieldset>


 <table border="0"> 

 <tr><td colspan=2><h1>Login</h1></td></tr> 

 <tr><td>Username:</td><td> 

 <input type="text" name="username" maxlength="40"> 

 </td></tr> 

 <tr><td>Password:</td><td> 

 <input type="password" name="pass" maxlength="50"> 

 </td></tr> 

 <tr><td colspan="2" align="right"> 

 <input type="submit" name="submit" value="Login"> 

 </td></tr> 

 </table> 

 </form> 
</fieldset>

 <?php 

 } 


?>

<!--
<div id="content-inner">
        
        <div id="content-right">
 
    

<div class="maincontent">

</div>





                    </div>



                </div>


-->

<?
include('footer.php');
?>
