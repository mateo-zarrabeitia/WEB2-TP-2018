<?php
class ProductoModel extends Model
{
  function getProductos() {
    $sentencia = $this->db->prepare( "SELECT * FROM producto ORDER BY nombre");
    $sentencia->execute();
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function getProducto($id_producto) {
    $sentencia = $this->db->prepare( "SELECT * FROM producto WHERE id_moto = ?");
    $sentencia->execute([$id_producto]);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function getProductosMar($marca) {
    $sentencia = $this->db->prepare( "SELECT * FROM producto WHERE id_marca = ?");
    $sentencia->execute([$marca]);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function crearProducto($id_marca,$nombre,$precio,$descripcion,$imagenes) {
      $sentencia = $this->db->prepare('INSERT INTO producto(id_marca,nombre,descripcion,precio,imagenes) VALUES (?,?,?,?,?)');
      $sentencia->execute([$id_marca,$nombre,$descripcion,$precio,$imagenes]);
  }

  function actualizarProducto($id_marca,$nombre,$precio,$descripcion,$imagenes,$id_moto) {
      $sentencia = $this->db->prepare('UPDATE producto SET id_marca = ?, nombre = ?, descripcion = ?, precio = ?, imagenes = ? WHERE producto.id_moto = ?');
      $sentencia->execute(array($id_marca,$nombre,$descripcion,$precio,$imagenes,$id_moto));
  }

  function eliminarProducto($id_producto) {
    $sentencia = $this->db->prepare('DELETE FROM producto WHERE id_moto = ?');
    $sentencia->execute([$id_producto]);
  }



}
?>
