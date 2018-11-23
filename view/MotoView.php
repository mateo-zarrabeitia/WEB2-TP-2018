<?php
  class MotoView extends View {

    function __construct()
    {
      parent::__construct();
      $this->smarty->assign('session', 'out');
      $this->smarty->assign('home',"http://".$_SERVER["SERVER_NAME"] . ":". $_SERVER['SERVER_PORT'] . dirname($_SERVER["PHP_SELF"]));
    }

    function mostrarIndex($titulo) {
      session_start();
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
      $this->smarty->assign('Titulo',$titulo);
      $this->smarty->assign('inicio',"index");
      return $this->smarty->display('templates/index.tpl');
    }


    function mostrarProductos($titulo,$productos,$imagenes,$marcas) {
      session_start();
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
      $this->smarty->assign('Titulo',$titulo);
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('marcas',$marcas);
      $this->smarty->assign('imagenes',$imagenes);
      $this->smarty->assign('producto',"index");
      // $this->smarty->debugging = true;
      return $this->smarty->display('templates/productos.tpl');
    }

    function mostrarProductosMarca($titulo,$productos,$imagenes,$marcas) {
      session_start();
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
      $this->smarty->assign('Titulo',$titulo);
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('marcas',$marcas);
      $this->smarty->assign('imagenes',$imagenes);
      $this->smarty->assign('active',"productos");
      // $this->smarty->debugging = true;
      return $this->smarty->display('templates/productosFiltrados.tpl');
    }


    function mostrarDetalleProducto($titulo,$productos,$imagenes) {
      session_start();
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
      $this->smarty->assign('Titulo',$titulo);
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('imagenes',$imagenes);
      $this->smarty->assign('active',"productos");
      return $this->smarty->display('templates/detalleProducto.tpl');
    }

  }
 ?>
