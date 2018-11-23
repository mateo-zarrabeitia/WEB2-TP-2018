<?php
  class ImagenesModel extends Model
  {
    function subirImagenes($imagenes,$id_producto){
      $rutas = [];
      foreach ($imagenes as $imagen) {
        $destino_final = 'img/product-img/' . uniqid();
        move_uploaded_file($imagen, $destino_final);
        $rutas[]=$destino_final;
      }
        $sentencia_imagenes = $this->db->prepare('INSERT INTO imagen(ruta,fk_id_moto) VALUES(?,?)');
        foreach ($rutas as $ruta) {
        $sentencia_imagenes->execute([$ruta,$id_producto]);
      }
    }
    function getImagenes() {
      $sentencia = $this->db->prepare( "SELECT * FROM imagen");
      $sentencia->execute();
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    function getImagen($id_moto) {
      $sentencia = $this->db->prepare( "SELECT * FROM imagen where fk_id_moto = ?");
      $sentencia->execute([$id_moto]);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    function deleteImagen($id_imagen) {
      $sentencia = $this->db->prepare('DELETE FROM imagen WHERE id_imagen = ?');
			$sentencia->execute([$id_imagen]);
    }

  }
?>
