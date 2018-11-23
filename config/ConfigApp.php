<?php
class ConfigApp{

  public static $ACTION = "action";
  public static $PARAMS = "params";
  public static $ACTIONS = [

      '' =>  'MotoController#index',
      'index' =>  'MotoController#index',
      'home' =>  'MotoController#index',
      'productos' => 'MotoController#productos',
      'detalleProducto' => 'MotoController#detalleProducto',
      'productosMarca' => 'MotoController#productosMarca',
      'login' =>  'LoginController#login',
      'register' => 'LoginController#registrar',
      'crearUsuario' => 'LoginController#crear',
      'verificarUsuario' => 'LoginController#verify',
      'logout' => 'LoginController#destroy',
      'agregarMarca' => 'AdminController#agregarMarca',
      'agregarProducto' => 'AdminController#agregarProducto',
      'adminUsuarios' => 'AdminController#adminUsuarios',
      'eliminarUsuario' => 'AdminController#eliminarUsuario',
      'darPermisoAdmin' => 'AdminController#darPermisoAdmin',
      'guardarProducto' => 'AdminController#guardarProducto',
      'guardarMarca' => 'AdminController#guardarMarca',
      'borrarMarca' =>'AdminController#eliminarMarca',
      'editarMarca' => 'AdminController#editarMarca',
      'borrarProducto' =>'AdminController#eliminarProducto',
      'borrarImagen' => 'AdminController#eliminarImagen',
      'editarProducto' => 'AdminController#editarProducto',

    ];

}

 ?>
