<div class="">
    <!-- ##### Single Widget ##### -->
    <div class="widget catagory mb-50">
        <!-- Widget Title -->
        <h6 class="widget-title mb-30">Marcas</h6>

        <!--  Catagories  -->
        <div class="catagories-menu">
            <ul>
                <li class="todas active"><a class="navegacionFiltrado" href="productos/todas">Todas</a></li>
                {foreach from=$marcas item=marca}
                <li><a class="navegacionFiltrado" name="no" href="productos/{$marca['id_marca']}">{$marca['nombre']}</a>
                  {if ({$usuario['ADMIN']} == 1)}
                   <a href="borrarMarca/{$marca['id_marca']}" name="borrar" class="user-nav navegacionFiltrado "><i class="fas fa-trash-alt fa-xs"></i></a>
                   <a href="editarMarca/{$marca['id_marca']}" name="inicio" class="user-nav navegacionFiltrado "><i class="fas fa-pencil-alt fa-xs"></i></a>
                  {/if}
                </li>
                {/foreach}
            </ul>
        </div>
    </div>
</div>
