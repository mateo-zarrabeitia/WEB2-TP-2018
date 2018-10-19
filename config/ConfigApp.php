<?php
class ConfigApp{

  public static $ACTION = "action";
  public static $PARAMS = "params";
  public static $ACTIONS = [

      '' =>  'MotoController#index',
      'index' =>  'MotoController#index',
      'home' =>  'MotoController#home',
      'anuncio' =>  'MotoController#anuncio',
      'filtros' =>  'MotoController#filtros',
      'productos' => 'MotoController#productos',
      'detalleProducto' => 'MotoController#detalleProducto',
      'filtrarMarca' => 'MotoController#filtrarMarca',
      'login' =>  'LoginController#login',
      'register' => 'LoginController#registrar',
      'crearUsuario' => 'LoginController#crear',
      'verificarUsuario' => 'LoginController#verify',
      'logout' => 'LoginController#destroy',
      'admin' => 'AdminController#home',
      'adminLista' => 'AdminController#home',
      'adminAgregarMarca' => 'AdminController#agregarMarca',
      'adminAgregarProducto' => 'AdminController#agregarProducto',
      'adminListaProductos' => 'AdminController#listaProducto',
      'adminListaMarcas' => 'AdminController#listaMarca',
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
