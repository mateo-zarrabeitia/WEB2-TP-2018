<?php
  require_once 'view/AdminView.php';
  require_once 'model/ProductoModel.php';
  require_once 'model/MarcaModel.php';
  require_once 'model/UsuarioModel.php';
  require_once 'model/ImagenesModel.php';

  class AdminController extends SecuredController {
    function __construct()  {
      parent::__construct();
      $this->view = new AdminView();
      $this->modelMarca = new MarcaModel();
      $this->modelProducto = new ProductoModel();
      $this->modelUsuario = new UsuarioModel();
      $this->modelImagenes = new ImagenesModel();

    }


    public function agregarMarca()
    {
      $titulo = "Motos - Casa Blanca | Agregar Marcas";
      $this->view->mostrarAgregarMarcas($titulo);
    }

    public function editarMarca($params)
    {
      $id_marca = $params[0];
      $titulo = "Motos - Casa Blanca | Editar Marca";
      $marcas = $this->modelMarca->getMarca($id_marca);
      $this->view->mostrarAgregarMarcas($titulo,$marcas);
    }

    public function agregarProducto()
    {
  		$marcas = $this->modelMarca->getMarcas();
      $titulo = "Motos - Casa Blanca | Agregar Producto";
      $this->view->mostrarAgregarProducto($titulo,$marcas,'','');
    }

    public function adminUsuarios(){
      $usuarios = $this->modelUsuario->getUsuarios();
      $titulo = "Motos - Casa Blanca | Usuarios";
      $this->view->mostrarUsuarios($titulo,$usuarios);
    }
    public function darPermisoAdmin($params){
      $id_usuario = $params[0];
      $permiso = $params[1];
      $usuarios = $this->modelUsuario->setPermisoAdmin($id_usuario,$permiso);
      $this->adminUsuarios();
    }
    public function eliminarUsuario($params){
      $id_usuario = $params[0];
      $usuarios = $this->modelUsuario->deleteUsuario($id_usuario);
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
        if(($tipo == 'image/jpeg') || ($tipo == 'image/jpg') || ($tipo == 'image/png')) {
          return true;
        }
      }
      return false;
    }



    public function eliminarMarca($params){
      $id_marca = $params[0];
      //echo ($id_Marca);
			$this->modelMarca->eliminarMarca($id_marca);
      // header('Location: '. HOME);
    }

    public function eliminarImagen($params){
      $id_moto = $params[0];
      $id_imagen = $params[1];
			$this->modelImagenes->deleteImagen($id_imagen);
      $this->editarProducto($params);
    }

    public function eliminarProducto($params){
      $id_producto = $params[0];
      //echo ($id_Marca);
			$this->modelProducto->eliminarProducto($id_producto);
      // header('Location: '. HOME);
    }

    public function editarProducto($params)
    {
      $id_producto = $params[0];
      $producto = $this->modelProducto->getProducto($id_producto);
      $marcas = $this->modelMarca->getMarcas();
      $imagenes = $this->modelImagenes->getImagenes();
      $this->view->mostrarAgregarProducto($marcas,$producto,$imagenes);
    }

    public function guardarProducto(){
      $rutaTempImagenes = $_FILES['imagenes']['tmp_name'];
      $nombre = $_POST['nombre'];
      $id_marca = $_POST['id_marca'];
      $precio = $_POST['precio'];
      $descripcion = $_POST['descripcion'];
      $id_moto= $_POST['actualizar'];
      if ($id_moto != 0) {
        if($this->sonExtValida($_FILES['imagenes']['type'])) {
        $this->modelProducto->actualizarProducto($id_marca,$nombre,$precio,$descripcion,$id_moto);
        $this->modelImagenes->subirImagenes($rutaTempImagenes,$id_moto);
        }
      } else {
        if($this->sonExtValida($_FILES['imagenes']['type'])) {
        $id_moto = $this->modelProducto->crearProducto($id_marca,$nombre,$precio,$descripcion);
        $this->modelImagenes->subirImagenes($rutaTempImagenes,$id_moto);
        }
      }
      header('Location: '. HOME);
    }



  }
?>
