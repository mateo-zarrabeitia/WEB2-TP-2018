<?php
class ProductoModel extends Model
{
  function getProductos() {
    $sentencia = $this->db->prepare("SELECT `producto`.*, `marca`.`nombre_marca`
FROM `marca`
    LEFT JOIN `producto` ON `producto`.`fk_id_marca` = `marca`.`id_marca`"
    );
    $sentencia->execute();
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function getProducto($id_producto) {
    $sentencia = $this->db->prepare( "SELECT `producto`.*, `marca`.`nombre_marca`
FROM `producto`
    LEFT JOIN `marca` ON `producto`.`fk_id_marca` = `marca`.`id_marca`
WHERE `producto`.`id_moto` = ? ");
    $sentencia->execute([$id_producto]);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function getProductosMar($id_marca) {
    $sentencia = $this->db->prepare( " SELECT `producto`.*, `marca`.`nombre_marca`
FROM `producto`
    LEFT JOIN `marca` ON `producto`.`fk_id_marca` = `marca`.`id_marca`
WHERE (`producto`.`fk_id_marca` = ?)
");
    $sentencia->execute([$id_marca]);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function crearProducto($id_marca,$nombre,$precio,$descripcion) {
      $sentencia = $this->db->prepare('INSERT INTO producto(fk_id_marca,nombre_producto,descripcion_producto,precio) VALUES (?,?,?,?)');
      $sentencia->execute([$id_marca,$nombre,$descripcion,$precio]);
      return  $id_producto = $this->db->lastInsertId();
  }

  function actualizarProducto($id_marca,$nombre,$precio,$descripcion,$id_moto) {
      $sentencia = $this->db->prepare('UPDATE producto SET id_marca = ?, nombre_producto = ?, descripcion_producto = ?, precio = ? WHERE producto.id_moto = ?');
      $sentencia->execute(array($id_marca,$nombre,$descripcion,$precio,$id_moto));
  }

  function eliminarProducto($id_producto) {
    $sentencia = $this->db->prepare('DELETE FROM producto WHERE id_moto = ?');
    $sentencia->execute([$id_producto]);
  }



}
?>
