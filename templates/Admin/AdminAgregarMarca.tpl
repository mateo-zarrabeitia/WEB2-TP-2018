<div class="wrapper">
  <form id="crearMarca" action="guardarMarca" method="post" class="form-signin">
    {foreach from=$marcas item=marca}
    <h2 class="form-signin-heading text-center">Agregar Marca</h2>
    <div class="form-group">
              <label for="nombre">Nombre de Marca</label>
              <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Marca" value="{if isset($marca) && !empty($marca)}{$marca['nombre']}{/if}"required>
    </div>
    <div class="form-group">
              <label for="descripcion">Descripcion</label>
              <input type="text" class="form-control" id="nombre" name="descripcion" placeholder="La numero 1"  value="{if isset($marca) && !empty($marca)}{$marca['descripcion']}{/if}"required>
    </div>
    <input type="hidden" name="actualizar" value="{if isset($marca) && !empty($marca)}{$marca['id_marca']}{else} 0 {/if}">
    {/foreach}
    <button class="btn btn-lg btn-primary btn-block login" type="submit">Crear Marca</button>
  </form>
</div>
