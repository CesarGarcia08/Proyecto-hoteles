<?php
class Hotel {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function agregar($datos, $imagenes) {
        try {
            $this->pdo->beginTransaction();

            $stmt = $this->pdo->prepare("
                INSERT INTO hoteles 
                (titulo, descripcion, ubicacion, provincia, costo, autor, publicar, tipos_habitacion, wifi, piscina, parking, gimnasio, restaurante, servicio_habitaciones, activo) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)
            ");

            $stmt->execute([
                $datos['titulo'],
                $datos['descripcion'],
                $datos['ubicacion'],
                $datos['provincia'],
                $datos['costo'],
                $datos['autor'],
                $datos['publicar'],
                $datos['tipos_habitacion'],   
                $datos['wifi'],
                $datos['piscina'],
                $datos['parking'],
                $datos['gimnasio'],
                $datos['restaurante'],
                $datos['servicio_habitaciones']
            ]);

            $hotel_id = $this->pdo->lastInsertId();

            // Resto del código de manejo de imágenes sin cambios
            $upload_dir = "../uploads/hoteles/" . $hotel_id . "/";
            if (!file_exists($upload_dir)) {
                mkdir($upload_dir, 0755, true);
            }

            $extensiones_permitidas = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
            $max_size = 5 * 1024 * 1024;
            $imagenes_procesadas = 0;

            foreach ($imagenes['tmp_name'] as $key => $tmp_name) {
                $nombre_original = $imagenes['name'][$key];
                $tamaño = $imagenes['size'][$key];
                $extension = strtolower(pathinfo($nombre_original, PATHINFO_EXTENSION));

                if (!in_array($extension, $extensiones_permitidas)) {
                    throw new Exception("Formato no permitido: $nombre_original");
                }
                if ($tamaño > $max_size) {
                    throw new Exception("Imagen muy grande: $nombre_original");
                }

                $nombre_nuevo = uniqid() . '_' . time() . '.' . $extension;
                $ruta_completa = $upload_dir . $nombre_nuevo;

                if (move_uploaded_file($tmp_name, $ruta_completa)) {
                    $stmt = $this->pdo->prepare("INSERT INTO imagenes_hoteles (hotel_id, ruta, nombre_original) VALUES (?, ?, ?)");
                    $stmt->execute([$hotel_id, $ruta_completa, $nombre_original]);
                    $imagenes_procesadas++;
                }
            }

            if ($imagenes_procesadas == 0) {
                throw new Exception("No se procesó ninguna imagen");
            }

            $this->pdo->commit();
            return [
                'ok' => true,
                'mensaje' => "✅ Hotel agregado correctamente con $imagenes_procesadas imagen(es)."
            ];
        } catch (Exception $e) {
            $this->pdo->rollback();
            return [
                'ok' => false,
                'error' => $e->getMessage()
            ];
        }
    }



    public function buscar($busqueda = '') {
        $sql = "SELECT * FROM hoteles WHERE 1=1";
        $param = [];

        if (!empty($busqueda)) {
            $sql .= " AND (
                provincia LIKE ? 
                OR ubicacion LIKE ? 
                OR costo <= ?
            )";
            $param[] = "%$busqueda%"; // Para provincia
            $param[] = "%$busqueda%"; // Para área/ubicación

            // Si el valor ingresado es numérico, lo usamos para costo
            if (is_numeric($busqueda)) {
                $param[] = $busqueda;
            } else {
                $param[] = 0; // Si no es número, evita filtrar por costo
            }
        }

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($param);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public function obtenerPublicados() {
    $stmt = $this->pdo->prepare("
        SELECT h.*, 
               (SELECT ruta FROM imagenes_hoteles 
                WHERE hotel_id = h.id 
                ORDER BY id ASC LIMIT 1) as imagen_principal
        FROM hoteles h 
        WHERE h.publicar = 1 AND h.activo = 1 
        ORDER BY h.id DESC
    ");
    $stmt->execute();
    $hoteles = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($hoteles as &$hotel) {
        if (!empty($hotel['imagen_principal'])) {
            $hotel['imagen_principal'] = str_replace('../uploads/', 'uploads/', $hotel['imagen_principal']);
        }
    }
    unset($hotel); // Limpia la referencia del foreach

    return $hoteles;
    }

    // Obtener hotel publicado y activo por ID
    public function obtenerHotelPorId($hotelId) {
        $stmt = $this->pdo->prepare("
            SELECT h.*
            FROM hoteles h
            WHERE h.id = ? AND h.publicar = 1 AND h.activo = 1
        ");
        $stmt->execute([$hotelId]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Obtener imágenes del hotel por ID
    public function obtenerImagenes($hotelId) {
        $stmt = $this->pdo->prepare("
            SELECT ruta
            FROM imagenes_hoteles
            WHERE hotel_id = ?
            ORDER BY id ASC
        ");
        $stmt->execute([$hotelId]);
        $imagenes = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Ajuste de rutas
        foreach ($imagenes as &$imagen) {
            $imagen['ruta'] = str_replace('../uploads/', 'uploads/', $imagen['ruta']);
        }

        return $imagenes;
    }

}
