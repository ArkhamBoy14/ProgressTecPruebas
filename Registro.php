<?php
include("conexion.php");

$Nombre= $_POST['Nombre'];
$Apellido_P= $_POST['ApellidoP'];
$Apellido_M=$_POST['ApellidoM'];
$Fecha_N=$_POST['FN'];
$Matricula=$_POST['Matricula'];
$Correo=$_POST['Correo'];
$Telefono=$_POST['Telefono'];


$query="INSERT INTO alumno(Nombre,Apellido_Paterno,Apellido_Materno,Fecha_Nacimiento,Matricula,Correo,Telefono) VALUES('$Nombre','$Apellido_P','$Apellido_M','$Fecha_N','$Matricula','$Correo','$Telefono')";
$resultado= $conn->query($query);

if ($resultado) {
	header('location:Consulta.php');
}
else{
	echo "Registro Invalido";
}
?>