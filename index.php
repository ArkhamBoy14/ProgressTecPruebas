<?php
 $conn = mysqli_connect('localhost','root','3039646363','desarrollatec');
?>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <html lang="es">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Selección de materias por semestre</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div class="card">
        <div class="card-header">
            <h2 class="mb-0">Selección de materias por semestre</h2>
        </div>
        <div class="card-body">
            <p class="card-text">En este apartado se seleccionara las materias que se llevarán a cabo por semestre</p>
        </div>
    </div>
    <div class="table-responsive table-bordered">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Materias</th>
                    <th>Semestre</th>
                    <th>Agregar</th>
                </tr>
            </thead>
            <?php
            $SQL = "SELECT cat_materias.Nombre, cat_semestre.Semestre FROM cat_materias INNER JOIN cat_semestre on cat_materias.Cve_Semestre = cat_semestre.Cve_Semestre where cat_materias.Cve_Semestre = 1";
            $result =  mysqli_query($conn,$SQL);
            while($mostrar=mysqli_fetch_array($result)){
            ?>
            <tbody>
                <tr>
                    <td><?php echo $mostrar['Nombre'] ?></td>
                    <td><?php echo $mostrar['Semestre'] ?></td>
                    <td><input type="checkbox"></td>
                </tr>
            </tbody>
            <?php
            }
            ?>
        </table>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>