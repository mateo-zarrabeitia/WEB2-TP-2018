{include file="header.tpl"}
{include file="navegacion.tpl"}
      <div class="single-product-area section-padding-100 clearfix">
          <div class="container-fluid">

              <div class="row">
                  <div class="col-12 col-lg-7">
                    {foreach from=$productos item=producto}
                      <div class="single_product_thumb">
                          <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                              <ol class="carousel-indicators">
                                {foreach from=$imagenes item=imagen}
                                {if $imagen@first}
                                  <li class="active" data-target="#product_details_slider" data-slide-to="{$imagen@index}" style="background-image: url({$home}/{$imagen['ruta']});">
                                    </li>
                                {else}
                                  <li data-target="#product_details_slider" data-slide-to="{$imagen@index}" style="background-image: url({$home}/{$imagen['ruta']});">
                                  </li>
                                  {/if}
                                {/foreach}
                              </ol>
                              <div class="carousel-inner">
                                {foreach from=$imagenes item=imagen}
                                  {if $imagen@first}
                                  <div class="carousel-item active">
                                          <img class="d-block w-100" src="{$home}/{$imagen['ruta']}" alt="First slide">
                                  </div>
                                  {else}
                                  <div class="carousel-item">
                                          <img class="d-block w-100" src="{$home}/{$imagen['ruta']}" alt="Second slide">
                                  </div>
                                  {/if}
                                  {/foreach}

                              </div>
                          </div>
                      </div>
                      {/foreach}
                  </div>
                  <div class="col-12 col-lg-5">
                      <div class="single_product_desc">
                        <span class="productoId" name= "{$producto['id_moto']}"></span>
                        {if isset($usuario) && !empty($usuario)}
                        <span class="idUsuario" name= "{$usuario['ID']}"></span>
                        <span class="userRol" name= "{$usuario['ADMIN']}"></span>
                        {/if}
                          <div class="product-meta-data">
                              <div class="line"></div>
                              <p class="product-price">${$producto['precio']}</p>

                                  <h6>Nombre: {$producto['nombre_producto']}</h6>
                                  <h6>Categoria: {$producto['nombre_marca']}</h6>
                              <!-- Ratings & Review -->
                              <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                  <div class="ratings">
                                      <i class="fa fa-star" aria-hidden="true"></i>
                                      <i class="fa fa-star" aria-hidden="true"></i>
                                      <i class="fa fa-star" aria-hidden="true"></i>
                                      <i class="fa fa-star" aria-hidden="true"></i>
                                      <i class="fa fa-star" aria-hidden="true"></i>
                                  </div>
                                  <!-- <div class="review">
                                      <a href="#">Write A Review</a>
                                  </div> -->
                              </div>
                              <!-- Avaiable -->
                              <p class="avaibility"><i class="fa fa-circle"></i> In Stock</p>
                          </div>

                          <div class="short_overview my-5">
                            <p>{$producto['descripcion_producto']}</p>
                          </div>

                          <!-- Add to Cart Form -->


                      </div>
                  </div>
              </div>
              <div class="row">
                <div class="col-md-12 centered">
                  <h3>Comentarios</h3>
                  <div class="product-sorting d-flex">
                                <div class="sort-by-date d-flex align-items-center mr-15">
                                    <p>Orden by</p>
                                    <form action="/form" method="post" class="ordenComentarios" >
                                        <select name="select" id="ordenComentarios">
                                            <option value="" disabled selected>Seleccione un orden...</option>
                                            <option value="ascendente">Ascendente</option>
                                            <option value="descendente">Descendente</option>
                                        </select>
                                    </form>
                                </div>
                            </div>
                    <div class="" id="comentarios-container">

                    </div>
                </div>
              </div>
              <div class="row">
        <div class="col-md-8">
          {if !isset($usuario)}
          <h5>Para comentar debe estar logueado</h5>
          {else}
          <h2>Comentar</h2>
            <label>Comentando como: <span class="user">{$usuario['USUARIO']}</span></label>
            <form id="formComentario" class="comentar" action="api/comentarios" method="POST">
              <select name="fk_puntaje" class="form-control puntaje" required>
                <option value="" selected>Puntaje</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
              {foreach from=$productos item=producto}
              <input class="form-control id_moto" type="hidden" name="fk_id_moto" value="{$producto['id_moto']}">
              {/foreach}
              <input class="form-control usuario" type="hidden" name="usuario"value="{$usuario['USUARIO']}">
              <textarea class="form-control textocomentario" cols="10" rows="5" name="textocomentario" placeholder="Comentario" required></textarea>
              <div class="g-recaptcha" data-sitekey="6Le2QDkUAAAAAO6MwmA-RdmjpfCcOV97d5Nx_KPp" data-callback="enabledSubmit">></div>

              <button class="btn btn-lg btn-primary btn-block comentar" id="comentar" type="submit" disabled  >Comentar</button>
              <script src='https://www.google.com/recaptcha/api.js?hl=es'></script>
            </form>
            {/if}
          </div>
      </div>
          </div>
      </div>
  </div>
  {include file="footer.tpl"}
