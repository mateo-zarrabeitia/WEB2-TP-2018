{include file="header.tpl"}
{include file="navegacion.tpl"}
{include file="menuFiltros.tpl"}

<div class="amado_product_area section-padding-100">
  <div class="container-fluid">
    <div class="row filtrado">
                    <!-- Single Product Area -->
                    {foreach from=$productos item=producto}
                    <div class="producto col-12 col-sm-6 col-md-12 col-xl-6">
                        <div class="single-product-wrapper">
                            <!-- Product Image -->
                            <div class="product-img">
                              {foreach from=$imagenes item=imagen}
                                {if $producto["id_moto"] == $imagen["fk_id_moto"]}
                                <a class="detalleProducto" name ="{$producto['id_moto']}" href="{$home}/detalleProducto/{$producto['id_moto']}"><img src="{$imagen['ruta']}" alt=""></a>
                                {/if}
                              {/foreach}

                                <!-- Hover Thumb -->
                                <!-- <img class="hover-img" src="img/product-img/honda-wave2.jpg" alt=""> -->
                            </div>

                            <!-- Product Description -->
                            <div class="product-description d-flex align-items-center justify-content-between">
                                <!-- Product Meta Data -->
                                <div class="product-meta-data">
                                    <div class="line"></div>
                                    <p class="product-price">${$producto['precio']}</p>
                                    <h6>Categoria: {$producto['nombre_marca']}</h6>
                                    <a class="detalleProducto" href="{$home}/detalleProducto/{$producto['id_moto']}" name ="{$producto['id_moto']}">
                                        <h6>Ver detalle de {$producto['nombre_producto']}</h6>
                                    </a>
                                </div>
                                <!-- Ratings & Cart -->
                                {if ({$usuario['ADMIN']} == 1)}
                                <div class="cart">
                                    <a href="{$home}/borrarProducto/{$producto['id_moto']}" name= "borrar" class="user-nav administracion "><i class="fas fa-trash-alt fa-lg"></i></a>
                                    <a href="{$home}/editarProducto/{$producto['id_moto']}" name= "inicio" class="user-nav administracion "><i class="fas fa-pencil-alt fa-lg"></i></a>
                                </div>
                                  {/if}
                            </div>
                        </div>
                    </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>

{include file="footer.tpl"}
