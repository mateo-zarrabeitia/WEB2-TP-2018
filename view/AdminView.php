<?php
  class AdminView extends View
  {
    function __construct()
    {
      parent::__construct();
      $this->smarty->assign('session', 'out');
      $this->smarty->assign('home',"http://".$_SERVER["SERVER_NAME"] . ":". $_SERVER['SERVER_PORT'] . dirname($_SERVER["PHP_SELF"]));
    }

    public function mostrarAgregarMarcas($titulo,$marcas = '')
    {
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
      $this->smarty->assign('marcas',$marcas);
      $this->smarty->assign('Titulo',$titulo);
      return $this->smarty->display('templates/agregarMarca.tpl');
    }

    public function mostrarAgregarProducto($titulo,$marcas = '', $producto = '', $imagenes = '')
    {
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
  		$this->smarty->assign('marcas',$marcas);
      $this->smarty->assign('productos',$producto);
      $this->smarty->assign('imagenes',$imagenes);
      $this->smarty->assign('Titulo',$titulo);
      return $this->smarty->display('templates/agregarProducto.tpl');
    }

    function mostrarUsuarios($titulo,$usuarios)
    {
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
      $this->smarty->assign('usuarios',$usuarios);
      $this->smarty->assign('Titulo',$titulo);
      $this->smarty->display('templates/Usuarios.tpl');
    }

  }
 ?>
