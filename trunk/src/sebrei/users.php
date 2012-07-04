<? 

require('members.php');




include('header.php');


function protect($string)
{
	$string = pg_escape_string($string);
//	$string = strip_tags($string);
//	$string = addslashes($string);
	return $string;
}

if(!$_POST['submit'])
{
	echo "<fieldset>";
	echo "<table border=\"0\" cellspacing=\"3\" cellpadding=\"3\" align=\"center\">\n";
	echo "<form method=\"post\" action=\"".$self."\">\n";
	echo "<tr><td colspan=\"2\"><h2>Registro de nuevos usuarios</h2></td></tr>\n";

	echo "<tr><td>Nombre de usuario</td><td><input type=\"text\" name=\"username\"></td></tr>\n";
	echo "<tr><td>Nombre</td><td><input type=\"text\" name=\"realname\"></td></tr>\n";
	echo "<tr><td>Password</td><td><input type=\"password\" name=\"password\"></td></tr>\n";
	echo "<tr><td>Confirmar Password</td><td><input type=\"password\" name=\"passconf\"></td></tr>\n";
	echo "<tr><td>E-Mail</td><td><input type=\"text\" name=\"email\"></td></tr>\n";
	echo "<tr><td align=\"left\"><input type=\"submit\" name=\"submit\" value=\"Registrar\"></table></fieldset>";
}
else 
{

	$username = protect($_POST['username']);
	$realname = protect($_POST['realname']);
	$password = protect($_POST['password']);
	$confirm = protect($_POST['passconf']);
	$email = protect($_POST['email']);
	$errors = array();
	if(empty($username)){
		$errors[] = "Faltó definir el usuario!";
	}
	if(!$password){
		$errors[] = "Faltó ingresar la password!";
	}
	if($password)
	{
		if(!$confirm)
		{
			$errors[] = "Falto ingresar la confirmación de password!";
		}
	}
	if(!$email)
	{
		$errors[] = "Falto el E-mail!";
	}
	if($username)
	{
		if(!ctype_alnum($username))
		{
			$errors[] = "El nombre de usuario sólo puede contener letras y números!";
		}
		$range = range(1,32);
		if(!in_array(strlen($username),$range))
		{
			$errors[] = "El nombre de usuario sólo puede tener entre 1 y 32 caracteres!";
		}
	}
	if($password && $confirm){
		if($password != $confirm){
			$errors[] = "Las password no coinciden!";
		}
	}
	if($email){
		$checkemail = "/^[a-z0-9]+([_\\.-][a-z0-9]+)*@([a-z0-9]+([\.-][a-z0-9]+)*)+\\.[a-z]{2,}$/i";
		if(!preg_match($checkemail, $email)){
			$errors[] = "E-mail no válido, debe ser del tipo name@server.ccc!";
		}
	}
	if($username){
		$sql = "SELECT * FROM users WHERE user_name='$username'";
		$res = pg_query($sql) or die("Error");
		if(pg_num_rows($res) > 0){
		$errors[] = "El nombre de usuario ya está en uso!";
	}
	}
	if($email){
		$sql2 = "SELECT * FROM users WHERE email='$email'";
		$res2 = pg_query($sql2) or die("error");
		if(pg_num_rows($res2) > 0){
			$errors[] = "El e-mail ya está en uso por otro usuario!";
		}
	}
	if(count($errors) > 0){
		foreach($errors AS $error){
			echo $error . "<br>\n";
		}
	}
	else 
	{
		$sql4 = "INSERT INTO users (user_name,user_pw,email,user_real_name)
		VALUES ('$username','".md5($password)."','$email','$realname')";
		$res4 = pg_query($sql4) or die("Error");
		echo "<font align=\"center\"><br><br>Usuario registrado con éxito: <b>".$username."</b> </font>";
	}
}







include('footer.php');

?>
