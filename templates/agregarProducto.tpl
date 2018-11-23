{include file="header.tpl"}
{include file="navegacion.tpl"}

<div class="cart-table-area section-padding-100">
          <div class="container-fluid">
              <div class="row">
                  <div class="col-12 col-lg-8 center">
                      <div class="checkout_details_area mt-50 clearfix">

<div class="wrapper">
  <form id="crearProducto" action="{$home}/guardarProducto" method="post" class="form-signin" enctype="multipart/form-data">
    {foreach from=$productos item=producto}
    <h2 class="form-signin-heading text-center">Agregar Producto</h2>
    <div class="form-group">
      <label for="nombre">Nombre del Producto</label>
      <input type="text" class="form-control" id="nombre" name="nombre" value="{if isset($producto) && !empty($producto)}{$producto['nombre_producto']}{/if}"placeholder="Modelo ..." required>
    </div>
    <div class="form-group">
      <label for="nombre">Marca</label>
      <select name="id_marca" class="form-control">
        <option value=""{if !isset($producto) && empty($producto)} selected {/if}>Seleccionar Marca</option>
        {foreach from=$marcas item=marca}
        <option value="{$marca['id_marca']}" {if isset($producto) && !empty($producto) && {$producto['fk_id_marca'] == {$marca['id_marca']}}} selected {/if}>{$marca['nombre_marca']}</option>
        {/foreach}
      </select>
    </div>
    <div class="form-group">
      <label for="precio">Precio</label>
      <div class="input-group">
        <!-- <span class="input-group-addon">$</span> -->
        <i class="fas fa-dollar-sign"></i><input type="text" class="form-control" value="{if isset($producto) && !empty($producto)}{$producto['precio']}{/if}" id="precio" name="precio" placeholder="100" required>
      </div>
    </div>
    <div class="form-group">
      <label for="descripcion">Descripcion</label>
      <input type="textarea" class="form-control" id="descripcion" name="descripcion" value="{if isset($producto) && !empty($producto)}{$producto['descripcion_producto']} {/if}"placeholder="Contiene...." required>
    </div>
    <div class="">
    {if isset($imagenes) && !empty($imagenes)}
      {foreach from=$imagenes item=imagen}
        {if $producto["id_moto"] == $imagen["fk_id_moto"]}
          <img src="{$home}/{$imagen['ruta']}" alt="" class="img-thumbnail">
          <a href="{$home}/borrarImagen/{$producto["id_moto"]}/{$imagen['id_imagen']}" name= "borrar" class="user-nav administracion "><i class="fas fa-trash-alt fa-lg"></i></a>
        {/if}
      {/foreach}
    {/if}
    </div>
    <div class="form-group">
              <label for="imagen">Imagen</label>
              <input type="file" id="imagenes" name="imagenes[]" multiple>
    </div>
    <!-- <div class="form-group">
      <label for="imagen">Imagen</label>
      <input type="text" class="form-control" id="imagen" name="imagen" placeholder="foto.png" value="{if isset($producto) && !empty($producto)}{$producto['imagenes']} {/if}"required>
    </div> -->
    <input type="hidden" name="actualizar" value="{if isset($producto) && !empty($producto)}{$producto['id_moto']}{else} 0 {/if}">
    <!-- <div class="form-group">
    <label for="imagen">Imagen</label>
    <input type="file" id="imagenes" name="imagenes[]" multiple>
  </div>
-->
<button class="btn btn-lg btn-primary btn-block login" type="submit">{if isset($producto) && !empty($producto)}Actualizar Producto {else} Crear Producto{/if}</button>
{/foreach}
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
{include file="anuncio.tpl"}
{include file="footer.tpl"}
