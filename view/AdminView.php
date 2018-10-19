<?php
  class AdminView extends View
  {
    function __construct()
    {
      parent::__construct();
      $this->smarty->assign('session', 'out');
    }

    function mostrarAdmin($productos,$marcas)
    {
      $this->smarty->assign('home',"http://".$_SERVER["SERVER_NAME"] . dirname($_SERVER["PHP_SELF"]));
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('marcas',$marcas);
      return $this->smarty->display('templates/Admin/Admin.tpl');
    }

    public function mostrarAgregarMarcas($marcas = '')
    {
      $this->smarty->assign('marcas',$marcas);
      return $this->smarty->display('templates/Admin/AdminAgregarMarca.tpl');
    }

    public function mostrarAgregarProducto($marcas = '', $producto = '')
    {
  		$this->smarty->assign('marcas',$marcas);
      $this->smarty->assign('productos',$producto);
      // $this->smarty->debugging = true; 

      return $this->smarty->display('templates/Admin/AdminAgregarProducto.tpl');
    }
    public function mostrarListarProducto($productos,$marcas)
    {
  		$this->smarty->assign('productos',$productos);
      $this->smarty->assign('marcas',$marcas);
      return $this->smarty->display('templates/Admin/AdminListarProductos.tpl');
    }

    public function mostrarListarMarca($marcas = '')
    {
  		$this->smarty->assign('marcas',$marcas);
      return $this->smarty->display('templates/Admin/AdminListarMarcas.tpl');
    }
    function mostrarUsuarios($usuarios)
    {
      $this->smarty->assign('usuarios',$usuarios);
      $this->smarty->display('templates/Admin/Usuarios.tpl');
    }

    function mostrarProducto($productos)
    {
      $this->smarty->assign('productos',$productos);
      $this->smarty->display('templates/Admin/admin.tpl');
    }

    // function mostrarModificarProducto($id_Marca,$productos){
    //   $this->smarty->assign('productos', $productos);
    //   $this->smarty->assign('id_Marcas', $id_Marca);
    //   $this->smarty->display('templates/admin/modificarProducto.tpl');
    // }


  }
 ?>
