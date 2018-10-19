<?php
class MarcaModel extends Model
{
  function getMarcas() {
    $sentencia = $this->db->prepare('SELECT * FROM marca ORDER BY nombre');
    $sentencia->execute();
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }
  function getMarca($marca) {
    $sentencia = $this->db->prepare('SELECT * FROM marca WHERE id_marca = ?');
    $sentencia->execute([$marca]);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function eliminarMarca($id_marca) {
    $sentencia = $this->db->prepare('DELETE FROM marca WHERE id_marca = ?');
    $sentencia->execute([$id_marca]);
  }
  function guardarMarca($nombre,$descripcion) {
    $sentencia = $this->db->prepare("INSERT INTO marca (nombre,descripcion) VALUES (?,?)");
    $sentencia->execute([$nombre,$descripcion]);
  }

  function actualizarMarca($nombre,$descripcion,$id_marca) {
      $sentencia = $this->db->prepare('UPDATE marca SET nombre = ?, descripcion WHERE marca.id_marca = ?');
      $sentencia->execute(array($$nombre,$descripcion,$id_marca));
  }
}
?>
