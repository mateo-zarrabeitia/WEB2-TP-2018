  {include file="Admin/header.tpl"}
  {include file="Admin/adminNav.tpl"}

  <div class="container contenidoAdmin">
    <div class="wrapper">
      <h2>Productos</h2>
        {foreach from=$marcas item=marca}
            <h2>Marca: {$marca['nombre']} </h2>
                  {foreach from=$productos item=producto}
                    {if $producto["id_marca"] == $marca["id_marca"]}
                      <div class="panel panel-default">
                          <div class="panel-heading">
                                Nombre: {$producto['nombre']}
                                <a href="borrarProducto/{$producto['id_moto']}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                                <a class="navegacionAdmin" href="EditarProducto/{$producto['id_moto']}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                          </div>
                          <div class="panel-body"><strong>marca: </strong>{$marca['nombre']}</div>
                          <div class="panel-body"><strong>Precio: $ </strong>{$producto['precio']}</div>
                          <div class="panel-body"><strong>Descripcion: </strong>{$producto['descripcion']}</div>
                          <div class="panel-body">
                            <img src="img/product-img/{$producto['imagenes']}" class="img-rounded" alt="Cinque Terre" width="200" height="200">
                          </div>
                      </div>
                      {/if}
                  {/foreach}

        {/foreach}
      </div>

    </div>

  </div>

{include file="Admin/footer.tpl"}
