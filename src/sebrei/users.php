<? include('header.php');
?>
<fieldset>
<form action="register.php" method=get>
<h1>Registro de nuevos usuarios</h1>
<br>
<table >
<tr>
<td>Nombre de usuario :</td><td><input name="regname" type="text" size"20"></input></td>
</tr>

<tr>
<td>Nombre real :</td><td><input name="realname" type="text" size"20"></input></td>
</tr>

<tr>
<td>Email :</td><td><input name="regemail" type="text" size"20"></input></td>
</tr>
<tr>
<td>Password :</td><td><input name="regpass1" type="password" size"20"></input></td>
</tr>
<tr>
<td>Repetir password :</td><td><input name="regpass2" type="password" size"20"></input></td>
</tr>
</table>
 <input type="submit" value="Registrar"></input>
</form>
</fieldset>
<?
include('footer.php');

?>
