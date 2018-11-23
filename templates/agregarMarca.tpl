{include file="header.tpl"}
{include file="navegacion.tpl"}

<div class="cart-table-area section-padding-100">
  <div class="container-fluid">
    <div class="row">
      <div class="col-12 col-lg-8">
        <div class="checkout_details_area mt-50 clearfix">
          <div class="wrapper">
            <form id="crearMarca" action="{$home}/guardarMarca" method="post" class="form-signin">
              {foreach from=$marcas item=marca}
              <h2 class="form-signin-heading text-center">{if isset($marca) && !empty($marca)}Actualizar Marca{else}Crear Marca{/if}</h2>
              <div class="form-group">
                        <label for="nombre">Nombre de Marca</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Marca" value="{if isset($marca) && !empty($marca)}{$marca['nombre_marca']}{/if}"required>
              </div>
              <div class="form-group">
                        <label for="descripcion">Descripcion</label>
                        <input type="text" class="form-control" id="nombre" name="descripcion" placeholder="La numero 1"  value="{if isset($marca) && !empty($marca)}{$marca['descripcion_marca']}{/if}"required>
              </div>
              <input type="hidden" name="actualizar" value="{if isset($marca) && !empty($marca)}{$marca['id_marca']}{else} 0 {/if}">
              {/foreach}
              <button class="btn btn-lg btn-primary btn-block login" type="submit">{if isset($marca) && !empty($marca)}Actualizar Marca{else}Crear Marca{/if}</button>
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
