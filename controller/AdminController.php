<?php
  require_once 'view/AdminView.php';
  require_once 'model/ProductoModel.php';
  require_once 'model/MarcaModel.php';
  require_once 'model/UsuarioModel.php';

  class AdminController extends SecuredController {
    function __construct()  {
      parent::__construct();
      $this->view = new AdminView();
      $this->modelMarca = new MarcaModel();
      $this->modelProducto = new ProductoModel();
      $this->modelUsuario = new UsuarioModel();

    }

    public function home()
    {
      $productos = $this->modelProducto->getProductos();
      $marcas = $this->modelMarca->getMarcas();
      // $imagenes = $this->model->getImagenes();
      $this->view->mostrarAdmin($productos,$marcas);
      //header('Location: '. HOME .'admin');
    }

    public function listarAdmin(){
      home();
      header('Location: '. HOME .'admin');
    }



    public function agregarMarca()
    {
      $this->view->mostrarAgregarMarcas();
    }

    public function editarMarca($params)
    {
      $id_marca = $params[0];
      $marcas = $this->modelMarca->getMarca($id_marca);
      $this->view->mostrarAgregarMarcas($marcas);
    }

    public function agregarProducto()
    {
  		$marcas = $this->modelMarca->getMarcas();
      $this->view->mostrarAgregarProducto($marcas);
    }

    public function listaProducto()
    {
      $productos = $this->modelProducto->getProductos();
      $marcas = $this->modelMarca->getMarcas();
      // $imagenes = $this->model->getImagenes();
      $this->view->mostrarListarProducto($productos,$marcas);
    }

    public function listaMarca(){
      $marcas = $this->modelMarca->getMarcas();
      $this->view->mostrarListarMarca($marcas);

    }

    public function adminUsuarios(){
      $usuarios = $this->modelUsuario->getUsuarios();
      $this->view->mostrarUsuarios($usuarios);
    }
    public function darPermisoAdmin($params){
      $id_usuario = $params[0];
      $permiso = $params[1];
      $usuarios = $this->modelUsuario->setPermisoAdmin($id_usuario,$permiso);
      header('Location: '. HOME .'admin');
    }
    public function eliminarUsuario($params){
      $id_usuario = $params[0];
      $usuarios = $this->modelUsuarios->deleteUsuario($id_usuario);
      header('Location: '. HOME .'admin');
    }

    public function guardarMarca(){
      $nombre = $_POST['nombre'];
      $descripcion = $_POST['descripcion'];
      $id_marca= $_POST['actualizar'];
      if ($id_marca != 0) {
        $this->modelMarca->actualizarMarca($nombre,$descripcion,$id_marca);
      } else {
        $this->modelMarca->guardarMarca($nombre,$descripcion);
      }
      header('Location: '. HOME);
    }


    private function sonExtValida($imagenesTipos){
      foreach ($imagenesTipos as $tipo) {
        if(($tipo == 'image/jpeg') || ($tipo == 'image/png')) {
          return true;
        }
      }
      return false;
    }

    public function guardarProducto(){
      $nombre = $_POST['nombre'];
      $id_marca = $_POST['id_marca'];
      $precio = $_POST['precio'];
      $descripcion = $_POST['descripcion'];
      $imagenes= $_POST['imagen'];
      $id_moto= $_POST['actualizar'];
      if ($id_moto != 0) {
        echo "LALALALLAASAS";
        $this->modelProducto->actualizarProducto($id_marca,$nombre,$precio,$descripcion,$imagenes,$id_moto);
      } else {
        $this->modelProducto->crearProducto($id_marca,$nombre,$precio,$descripcion,$imagenes);
      }
      header('Location: '. HOME);
    }

    public function eliminarMarca($params){
      $id_marca = $params[0];
      //echo ($id_Marca);
			$this->modelMarca->eliminarMarca($id_marca);
      // header('Location: '. HOME);
    }

    public function eliminarProducto($params){
      $id_producto = $params[0];
      //echo ($id_Marca);
			$this->modelProducto->eliminarProducto($id_producto);
      // header('Location: '. HOME);
    }

    public function eliminarImagen($params){
      $id_imagen = $params[0];
      //echo ($id_Marca);
			$this->model->deleteImagen($id_imagen);
      header('Location: '. HOME);
    }

    public function actualizarProducto($params = []){
      $id_producto = $params[0];
      $productos = $this->model->getProductos();
			$this->modelProductos->actualizarProducto($id_producto,$productos);
      header('Location: '. HOME);
    }

    public function editarProducto($params)
    {
      $id_producto = $params[0];
      $producto = $this->modelProducto->getProducto($id_producto);
      $marcas = $this->modelMarca->getMarcas();
      $this->view->mostrarAgregarProducto($marcas,$producto);
    }



  }
?>
