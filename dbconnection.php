<?php


function dbconnection()
{
    $con=mysqli_connect("localhost","root","","practice1");
    return $con;
}


?>