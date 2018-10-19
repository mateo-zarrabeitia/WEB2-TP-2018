<div class="wrapper">
  <form id="crearProducto" action="guardarProducto" method="post" class="form-signin" enctype="multipart/form-data">
    {foreach from=$productos item=producto}
    <h2 class="form-signin-heading text-center">Agregar Producto</h2>
    <div class="form-group">
      <label for="nombre">Nombre del Producto</label>
      <input type="text" class="form-control" id="nombre" name="nombre" value="{if isset($producto) && !empty($producto)}{$producto['nombre']}{/if}"placeholder="Modelo ..." required>
    </div>
    <div class="form-group">
      <label for="nombre">Marca</label>
      <select name="id_marca" class="form-control" value="{$producto['id_marca']}">
        <option value="{$producto['id_marca']}" selected disabled hidden>Seleccionar Marca</option>
        {foreach from=$marcas item=marca}
        <option value="{$marca['id_marca']}"    {if isset($producto) && !empty($producto) && $marca['id_marca'] == $producto['id_marca']} selected  {/if}>{$marca['nombre']}</option>
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
      <input type="textarea" class="form-control" id="descripcion" name="descripcion" value="{if isset($producto) && !empty($producto)}{$producto['descripcion']} {/if}"placeholder="Contiene...." required>
    </div>
    <div class="form-group">
      <label for="imagen">Imagen</label>
      <input type="text" class="form-control" id="imagen" name="imagen" placeholder="foto.png" value="{if isset($producto) && !empty($producto)}{$producto['imagenes']} {/if}"required>
    </div>
    <input type="hidden" name="actualizar" value="{if isset($producto) && !empty($producto)}{$producto['id_moto']}{else} 0 {/if}">
    <!-- <div class="form-group">
    <label for="imagen">Imagen</label>
    <input type="file" id="imagenes" name="imagenes[]" multiple>
  </div>
-->
<button class="btn btn-lg btn-primary btn-block login" type="submit">Guardar Producto</button>
{/foreach}
</form>
</div>
