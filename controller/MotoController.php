<?php
  require_once 'view/MotoView.php';
  require_once 'model/MarcaModel.php';
  require_once 'model/ProductoModel.php';
  require_once 'model/ImagenesModel.php';

  class MotoController extends Controller
  {
    function __construct()
    {
      $this->view = new MotoView();
      $this->modelMarca = new MarcaModel();
      $this->modelProducto = new ProductoModel();
      $this->modelImagenes = new ImagenesModel();

    }

    public function index()
    {
      $titulo = "Motos - Casa Blanca | Inicio";
      $this->view->mostrarIndex($titulo);
    }
    
    public function productos()
    {
      $titulo = "Motos - Casa Blanca | Productos";
      $productos = $this->modelProducto->getProductos();
      $imagenes = $this->modelImagenes->getImagenes();
      $marcas = $this->modelMarca->getMarcas();
      $this->view->mostrarProductos($titulo,$productos,$imagenes,$marcas);
    }

    public function productosMarca($params = '')
    {
      $titulo = "Motos - Casa Blanca | Productos";
      $id_marca = $params[0];
      $productos = $this->modelProducto->getProductosMar($id_marca);
      $imagenes = $this->modelImagenes->getImagenes();
      $marcas = $this->modelMarca->getMarcas();
      $this->view->mostrarProductosMarca($titulo,$productos,$imagenes,$marcas);
    }

    public function detalleProducto($params)
    {
        $titulo = "Motos - Casa Blanca | Productos";
      $id_moto = $params[0];
      $marcas = $this->modelMarca->getMarcas();
      $productos = $this->modelProducto->getProducto($id_moto);
      $imagenes = $this->modelImagenes->getImagen($id_moto);
      $this->view->mostrarDetalleProducto($titulo,$productos,$imagenes);
    }

    public function filtrarMarca($params)
    {
        $titulo = "Motos - Casa Blanca | Productos";
        $id_marca = $params[0];
        $marcas = $this->modelMarca->getMarcas();
        $productos = $this->modelProducto->getProductosMar($id_marca);
        $this->view->mostrarProductos($titulo,$productos,$marcas);
    }



  }
?>
