<?php
include("dbconnection.php");
$con=dbconnection();

$query="SELECT `uid`,`username`,`email`,`password`from `user_table1`";
$exe=mysqli_query($con,$query);

$arr=[];

while($row=mysqli_fetch_array($exe)){
    $arr[]=$row;
}

print(json_encode($arr));

 
?>
