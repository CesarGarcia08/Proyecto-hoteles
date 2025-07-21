<?php
require_once '../clases/conexion.php';
require_once '../clases/hoteles.php';

$pdo = BD::conectar();
$hotel = new Hotel($pdo);

// Baja lógica
if (isset($_GET['cambiar'])) {
    $stmt = $pdo->prepare("SELECT activo FROM hoteles WHERE id = ?");
    $stmt->execute([$_GET['cambiar']]);
    $hotel = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($hotel) {
        $nuevoEstado = $hotel['activo'] ? 0 : 1;
        $stmt = $pdo->prepare("UPDATE hoteles SET activo = ? WHERE id = ?");
        $stmt->execute([$nuevoEstado, $_GET['cambiar']]);
    }

    header("Location: menu.php");
    exit;
}

// Buscar hoteles con filtros
$hoteles = $hotel->buscar($_GET['busqueda'] ?? '');

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Hoteles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<?php include '../includes/nav.php'; ?>
<div  class="container mt-4">
    <h2>Gestión de Hoteles</h2>
    <a href="agregarHotel.php" class="btn btn-primary mb-3">➕ Agregar Hotel</a>

    <form method="GET" class="row g-3 mb-4">
        <div class="col-md-8">
            <input type="text" name="busqueda" class="form-control" placeholder="Buscar por provincia, área o costo" value="<?= ($_GET['busqueda'] ?? '') ?>">
        </div>
        <div class="col-md-4">
            <button class="btn btn-secondary" type="submit">Buscar</button>
        </div>
    </form>


    <table class="table table-bordered">
        <thead>
            <tr><th>Título</th><th>Provincia</th><th>Costo</th><th>Activo</th><th>Acciones</th></tr>
        </thead>
        <tbody>
            <?php foreach ($hoteles as $h): ?>
            <tr>
                <td><?= ($h['titulo']) ?></td>
                <td><?= ($h['provincia']) ?></td>
                <td>$<?= number_format($h['costo'], 2) ?></td>
                <td><?= $h['activo'] ? 'Sí' : 'No' ?></td>
                <td>
                <a href="?cambiar=<?= $h['id'] ?>" 
                class="btn btn-sm <?= $h['activo'] ? 'btn-danger' : 'btn-success' ?>" 
                onclick="return confirm('¿Estás seguro de <?= $h['activo'] ? 'dar de baja' : 'activar' ?> este hotel?')">
                <?= $h['activo'] ? 'Dar de baja' : 'Activar' ?>
                </a>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
<?php include '../includes/footer.php'; ?>
</body>
</html>
