<!-- Header Area Start -->
<header class="header-area clearfix">
    <!-- Close Icon -->
    <div class="nav-close">
        <i class="fa fa-close" aria-hidden="true"></i>
    </div>
    <!-- Logo -->
    <div class="logo">
        <a  class="navegacion" href="{$home}/home"><img src="{$home}/img/core-img/logoMoto.png" alt=""></a>
    </div>
    <!-- Amado Nav -->
    <nav class="amado-nav">
        <ul>
          <li class="{if isset($inicio)} active{/if}" id="inicio"><a class="navegacion inicio" href="{$home}/home">Inicio</a></li>
          <li class="{if isset($producto)} active {/if}" id="productos"><a class="navegacion productos" href="{$home}/productos">Productos</a></li>
        </ul>
    </nav>
    <!-- Button Group -->

    <!-- Cart Menu -->
    <div class="cart-fav-search mb-100">
      {if !isset($usuario)}
        <a href="{$home}/login" class="user-nav navegacion"><i class="fas fa-user"> </i>    Login</a>
      {else}
            <a href="#" class="user-nav"><i class="fas fa-user-check"></i>    {$usuario['NOMBRE']}</a>
            {if ({$usuario['ADMIN']} == 1)}
              <a href="{$home}/agregarMarca" class="user-nav navegacion "> <i class="fas fa-plus"></i> Marca</a>
              <a href="{$home}/agregarProducto" class="user-nav navegacion "> <i class="fas fa-plus"></i> Producto</a>
              <a href="{$home}/adminUsuarios" class="user-nav navegacion "> <i class="fas fa-plus"></i> Usuarios</a>
            {/if}
            <a href="{$home}/logout" class="user-nav"> Cerrar Sesion</a>
      {/if}
    </div>
    <!-- Social Button -->
    <div class="social-info d-flex justify-content-between">
        <a href="https://ar.pinterest.com/"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
        <a href="https://instagram.com/"><i class="fa fa-instagram" aria-hidden="true"></i></a>
        <a href="https://facebook.com/"><i class="fa fa-facebook" aria-hidden="true"></i></a>
        <a href="https://twitter.com/"><i class="fa fa-twitter" aria-hidden="true"></i></a>
    </div>
</header>
