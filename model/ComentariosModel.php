<?php

class ComentariosModel extends Model {

	function getComentarios() {
		$sentencia = $this->db->prepare('SELECT * FROM comentario');
		$sentencia->execute();
		return $sentencia->fetchAll(PDO::FETCH_ASSOC);
	}

	function getComentariosProducto($fk_id_moto) {
		$sentencia = $this->db->prepare('SELECT `comentario`.*, `usuario`.`email`
			FROM `comentario`
			LEFT JOIN `usuario` ON `comentario`.`fk_id_usuario` = `usuario`.`id_usuario`
			WHERE (`comentario`.`fk_id_moto` =? )');
			$sentencia->execute([$fk_id_moto]);
			return $sentencia->fetchAll(PDO::FETCH_ASSOC);

			// $sentencia = $this->db->prepare('SELECT * FROM comentario WHERE fk_id_producto = ?');
			// $sentencia->execute([$fk_id_producto]);
			// return $sentencia->fetchAll(PDO::FETCH_ASSOC);
		}

		function getComentariosAscendente($id_moto){
			$sentencia = $this->db->prepare('SELECT `comentario`.*, `usuario`.`email`
				FROM `comentario`
				LEFT JOIN `usuario` ON `comentario`.`fk_id_usuario` = `usuario`.`id_usuario`
				WHERE (`comentario`.`fk_id_moto` = ?)
				ORDER BY `comentario`.`puntaje` ASC

				');
				$sentencia->execute([$id_moto]);
				return $sentencia->fetchAll(PDO::FETCH_ASSOC);
			}

			function getComentariosDescendente($id_moto){
				$sentencia = $this->db->prepare('SELECT `comentario`.*, `usuario`.`email`
					FROM `comentario`
					LEFT JOIN `usuario` ON `comentario`.`fk_id_usuario` = `usuario`.`id_usuario`
					WHERE (`comentario`.`fk_id_moto` = ?)
					ORDER BY `comentario`.`puntaje` DESC

					');
					$sentencia->execute([$id_moto]);
					return $sentencia->fetchAll(PDO::FETCH_ASSOC);
				}

				function getComentariosUsuario($fk_id_usuario) {
					$sentencia = $this->db->prepare('SELECT * FROM comentario WHERE fk_id_usuario = ?');
					$sentencia->execute([$fk_id_usuario]);
					return $sentencia->fetchAll(PDO::FETCH_ASSOC);
				}

				function getComentario($id_comentario) {
					$sentencia = $this->db->prepare('SELECT * FROM comentario WHERE id_comentario = ?');
					$sentencia->execute([$id_comentario]);
					return $sentencia->fetch(PDO::FETCH_ASSOC);
				}

				function setComentario($fk_id_moto, $fk_id_usuario, $textocomentario, $puntaje) {
					$sentencia = $this->db->prepare('INSERT INTO comentario(fk_id_moto,fk_id_usuario,comentario,puntaje) VALUES(?,?,?,?)');
					$sentencia->execute([$fk_id_moto, $fk_id_usuario, $textocomentario, $puntaje]);
				}

				function deleteComentario($id_comentario) {
					$sentencia = $this->db->prepare('DELETE FROM comentario WHERE id_comentario = ?');
					$sentencia->execute([$id_comentario]);
				}
			}
			?>
