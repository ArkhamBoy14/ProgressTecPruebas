<?php
 $conn = mysqli_connect('localhost','root','','desarrollatec');
?>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <html lang="es">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Lista de Materias Cursadas</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div class="card">
        <div class="card-header">
            <h2 class="mb-0">Lista de Materias Cursadas</h2>
        </div>
        <div class="card-body">
            <p class="card-text">En este apartado podrás observar las materias de este semestre</p>
        </div>
    </div>
    <div class="table-responsive table-bordered">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Materias</th>
                    <th>Nombre</th>
                    <th>Calificacion </th>
                    <th>Agregar</th>
                </tr>
            </thead>
            <?php
            $SQL = "SELECT cat_alumnos.Nombre as nombre_alumno,cat_alumnos.Apellido, cat_materias.Nombre, cat_alumnos_has_materia.Calificacion from cat_alumnos_has_materia INNER JOIN cat_alumnos on cat_alumnos.Cve_Alumnos = cat_alumnos_has_materia.Cve_Alumno INNER JOIN cat_materias on cat_alumnos_has_materia.Cve_Materia = cat_materias.Cve_Materia";
            $result =  mysqli_query($conn,$SQL);
            while($mostrar=mysqli_fetch_array($result)){
            ?>
            <tbody>
                <tr>
                    <td><?php echo $mostrar['nombre_alumno'] ?></td>
                    <td><?php echo $mostrar['Nombre'] ?></td>
                    <td><?php echo $mostrar['Calificacion'] ?></td>
                    <td><input type="checkbox"></td>
                </tr>
            </tbody>
            <?php
            }
            ?>
        </table>
        <center> 
     <button type='submit' class="btn btn-primary">Agregar</button>
        </center>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>