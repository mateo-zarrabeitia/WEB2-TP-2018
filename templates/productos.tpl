

        <div class="">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div class="product-topbar d-xl-flex align-items-end justify-content-between">
                            <!-- Total Products -->

                            <!-- Sorting -->

                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- Single Product Area -->
                    {foreach from=$productos item=producto}
                    <div class="producto col-12 col-sm-6 col-md-12 col-xl-6">
                        <div class="single-product-wrapper">
                            <!-- Product Image -->
                            <div class="product-img">
                                <img src="img/product-img/{$producto['imagenes']}" alt="">
                                <!-- Hover Thumb -->
                                <!-- <img class="hover-img" src="img/product-img/honda-wave2.jpg" alt=""> -->
                            </div>

                            <!-- Product Description -->
                            <div class="product-description d-flex align-items-center justify-content-between">
                                <!-- Product Meta Data -->
                                <div class="product-meta-data">
                                    <div class="line"></div>
                                    <p class="product-price">${$producto['precio']}</p>
                                    <a class="detalleProducto" href="detalleProducto/{$producto['id_moto']}">
                                        <h6>Ver detalle de {$producto['nombre']}</h6>
                                    </a>
                                </div>
                                <!-- Ratings & Cart -->
                                {if ({$usuario['ADMIN']} == 1)}
                                <div class="cart">
                                    <a href="borrarProducto/{$producto['id_moto']}" name= "borrar" class="user-nav administracion "><i class="fas fa-trash-alt fa-lg"></i></a>
                                    <a href="editarProducto/{$producto['id_moto']}" name= "inicio" class="user-nav administracion "><i class="fas fa-pencil-alt fa-lg"></i></a>
                                </div>
                                  {/if}
                            </div>
                        </div>
                    </div>
                    {/foreach}
                </div>
            </div>
        </div>
