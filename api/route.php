<?php

define('RESOURCE', 0);
define('PARAMS', 1);

  require_once 'config/Router.php';
  require_once '../model/Model.php';
  require_once 'controller/ComentariosApiController.php';

  $router = new Router();
  //url, verb, controller, method

  $router->AddRoute("comentarios", "GET", "ComentariosApiController", "getComentarios");
  $router->AddRoute("comentarios/producto/:id", "GET", "ComentariosApiController", "getComentariosProducto");
  $router->AddRoute("comentarios/usuario/:id", "GET", "ComentariosApiController", "getComentariosUsuario");
  $router->AddRoute("comentarios/:id", "GET", "ComentariosApiController", "getComentario");
  $router->AddRoute("comentarios", "POST", "ComentariosApiController", "createComentario");
  $router->AddRoute("comentarios/:id", "DELETE", "ComentariosApiController", "deleteComentario");
  $router->AddRoute("comentarios/producto/ordenados/:orden/:id", "GET", "ComentariosApiController", "getComentariosOrdenados");


  $route = $_GET['resource'];
  $array = $router->Route($route);

  if(sizeof($array) == 0)
    echo "404";
  else
  {
    $controller = $array[0];
    $metodo = $array[1];
    $url_params = $array[2];
    echo (new $controller())->$metodo($url_params);
  }

?>
