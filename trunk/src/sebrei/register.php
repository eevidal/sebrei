<?php

require('members.php');

$regname=$_GET["regname"];
$regemail= $_GET["regemail"];
$regepass=  $_POST["regpass1"];
$realname= $_GET["realname"];



        $sql="insert into users (name,email,password)values('$_GET[regname]','$_GET[regemail]','$_GET[regpass1]')";
        $result=mysql_query($sql,$conn) or die(mysql_error());          
        print "<h1>you have registered sucessfully</h1>";
 
        print "<a href='index.php'>go to login page</a>";
        }
        else print "passwords doesnt match";
}
else print"invaild data";
?>
