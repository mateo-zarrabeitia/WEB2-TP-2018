{include file="header.tpl"}
{include file="navegacion.tpl"}

<div class="cart-table-area section-padding-100">
          <div class="container-fluid">
              <div class="row">
                  <div class="col-12 col-lg-8 center">
                      <div class="checkout_details_area mt-50 clearfix">

<div class="wrapper">
<table class="table table-striped">
   <thead>
     <tr>
       <th>Nombre</th>
       <th>Email</th>
       <th>Administrador</th>
       <th>Permisos Admin</th>
       <th>Eliminar</th>
     </tr>
   </thead>
   <tbody>
     {foreach from=$usuarios item=usuario}
     <tr>
       <td>{$usuario['nombre']}</td>
       <td>{$usuario['email']}</td>
       <td>{if {$usuario['rol']} == 1} SI {else} NO {/if}</td>
        <td>
          <!-- <button class="btn btn-lg btn-primary btn-block login" type="submit">{if isset($producto) && !empty($producto)}Actualizar Producto {else} Crear Producto{/if}</button> -->
            <a href="{$home}/darPermisoAdmin/{$usuario['id_usuario']}/1" name="users" class="btn btn-default administracion">Dar</a>
            <a href="{$home}/darPermisoAdmin/{$usuario['id_usuario']}/0" name="users" class="btn btn-default administracion">Quitar</a>
        </td>
        <td><a href="{$home}/eliminarUsuario/{$usuario['id_usuario']}" name="users" class="btn btn-default administracion">Eliminar</a></td>
     </tr>
     {/foreach}
   </tbody>
 </table>
 </div>

 </div>
 </div>
 </div>
 </div>
 </div>
 </div>
 {include file="anuncio.tpl"}
 {include file="footer.tpl"}
