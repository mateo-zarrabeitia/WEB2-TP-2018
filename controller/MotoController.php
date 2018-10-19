<?php
  require_once 'view/MotoView.php';
  require_once 'model/MarcaModel.php';
  require_once 'model/ProductoModel.php';


  class MotoController extends Controller
  {
    function __construct()
    {
      $this->view = new MotoView();
      $this->modelMarca = new MarcaModel();
      $this->modelProducto = new ProductoModel();

    }

    public function index()
    {
      $titulo = "Motos - Casa Blanca | Inicio";
      $this->view->mostrarIndex($titulo);
    }

    public function home()
    {
      $this->view->mostrarHome();
    }
    public function anuncio()
    {
      $this->view->mostrarAnuncio();
    }
    public function filtros()
    {
        $marcas = $this->modelMarca->getMarcas();
      $this->view->mostrarFiltros($marcas);
    }

    public function productos($params = '')
    {
      $titulo = "Motos - Casa Blanca | Productos";
      if ($params[0] != "todas" ) {
        $id_marca = $params[0];
        $marcas = $this->modelMarca->getMarcas();
        $productos = $this->modelProducto->getProductosMar($id_marca);
      } else {
        $productos = $this->modelProducto->getProductos();
        $marcas = $this->modelMarca->getMarcas();
      }
      $this->view->mostrarProductos($titulo,$productos);
    }

    public function detalleProducto($params)
    {
        $titulo = "Motos - Casa Blanca | Productos";
      $id_moto = $params[0];
      $marcas = $this->modelMarca->getMarcas();
      $productos = $this->modelProducto->getProducto($id_moto);
      $this->view->mostrarDetalleProducto($titulo,$productos);
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
