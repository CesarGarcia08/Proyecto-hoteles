<?php require 'crud.php'; ?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body >
    <?php include '../includes/nav.php'; ?>
    <div class="container mt-5">
    <?php if (!empty($mensaje)): ?>
        <div class="alert alert-info"><?= $mensaje ?></div>
    <?php endif; ?>

    <hr>
    <h3><?= $modo === 'editar' ? 'Editar Usuario' : 'Agregar Usuario' ?></h3>

<div class="container mt-4 d-flex justify-content-center">
    <div class="card shadow rounded" style="max-width: 500px; width: 100%;">
        <div class="card-header bg-primary text-white text-center">
            <?= $modo === 'editar' ? 'Editar Usuario' : 'Registrar Usuario' ?>
        </div>
        <div class="card-body">
            <form method="POST" action="listar.php">
                <input type="hidden" name="id" value="<?= $usuario['id'] ?>">

                <div class="mb-3">
                    <label class="form-label">Nombre:</label>
                    <input type="text" name="nombre" class="form-control" required value="<?=($usuario['nombre']) ?>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Rol:</label>
                    <select name="rol" class="form-select" required>
                        <option value="admin" <?= ($usuario['rol'] ?? '') === 'admin' ? 'selected' : '' ?>>Administrador</option>
                        <option value="usuario" <?= ($usuario['rol'] ?? '') === 'usuario' ? 'selected' : '' ?>>Usuario</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email:</label>
                    <input type="email" name="email" class="form-control" required value="<?=($usuario['email']) ?>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Cédula:</label>
                    <input type="text" name="cedula" class="form-control" required value="<?=($usuario['cedula'] ?? '') ?>">
                </div>

                <div class="mb-3">
                    <label class="form-label"><?= $modo === 'editar' ? 'Nueva Contraseña (opcional):' : 'Contraseña:' ?></label>
                    <input type="password" name="password" class="form-control" <?= $modo === 'crear' ? 'required' : '' ?>>
                </div>

                <button type="submit" name="<?= $modo === 'editar' ? 'actualizar' : 'guardar' ?>" class="btn btn-success w-100">
                    <?= $modo === 'editar' ? 'Actualizar Usuario' : 'Guardar Usuario' ?>
                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>