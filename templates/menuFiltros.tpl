<div class="shop_sidebar_area">
    <!-- ##### Single Widget ##### -->
    <div class="widget catagory mb-50">
        <!-- Widget Title -->
        <h6 class="widget-title mb-30">Marcas</h6>

        <!--  Catagories  -->
        <div class="catagories-menu">
            <ul>
                <li class="todas active navegacionFiltrado"><a class="navegacionFiltrado" href="{$home}/productos">Todas</a></li>
                {foreach from=$marcas item=marca}
                <li><a class="navegacionFiltrado" name="no" href="{$home}/productosMarca/{$marca['id_marca']}">{$marca['nombre_marca']}</a>
                  {if ({$usuario['ADMIN']} == 1)}
                   <a href="{$home}/borrarMarca/{$marca['id_marca']}" name="borrar" class="user-nav  "><i class="fas fa-trash-alt fa-xs"></i></a>
                   <a href="{$home}/editarMarca/{$marca['id_marca']}" name="inicio" class="user-nav  "><i class="fas fa-pencil-alt fa-xs"></i></a>
                  {/if}
                </li>
                {/foreach}
            </ul>
        </div>
    </div>
</div>
