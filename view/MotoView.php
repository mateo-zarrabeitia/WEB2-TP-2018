<?php
  class MotoView extends View {

    function __construct()
    {
      parent::__construct();
      $this->smarty->assign('session', 'out');
    }

    function mostrarIndex($titulo) {
      session_start();
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
      $this->smarty->assign('Titulo',$titulo);
      $this->smarty->assign('active',"index");
      return $this->smarty->display('templates/index.tpl');
    }


    function mostrarProductos($titulo,$productos) {
      session_start();
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
      $this->smarty->assign('Titulo',$titulo);
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('active',"productos");
      $this->smarty->assign('home',"http://".$_SERVER["SERVER_NAME"] . dirname($_SERVER["PHP_SELF"]));
      return $this->smarty->display('templates/productos.tpl');
    }

    function mostrarDetalleProducto($titulo,$productos) {
      $this->smarty->assign('Titulo',$titulo);
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('active',"productos");
      $this->smarty->assign('home',"http://".$_SERVER["SERVER_NAME"] . dirname($_SERVER["PHP_SELF"]));
      // $this->smarty->debugging = true;
      return $this->smarty->display('templates/detalleProducto.tpl');
    }

    function mostrarHome()
    {
      return $this->smarty->display('templates/home.tpl');
    }
    function mostrarFiltros($marcas)
    {
      session_start();
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
      $this->smarty->assign('marcas',$marcas);
      return $this->smarty->display('templates/menuFiltros.tpl');
    }

    function mostrarAnuncio()
    {
      return $this->smarty->display('templates/anuncio.tpl');
    }
  }
 ?>
