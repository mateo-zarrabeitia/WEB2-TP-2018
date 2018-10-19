<!-- Product Details Area Start -->
      <div class="single-product-area section-padding-100 clearfix">
          <div class="container-fluid">

              <div class="row">
                  <div class="col-12 col-lg-7">
                    {foreach from=$productos item=producto}
                      <div class="single_product_thumb">
                          <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                              <ol class="carousel-indicators">
                                  <!-- <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(img/product-img/{$producto['imagenes']});">
                                  </li> -->
                                  <!-- <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(img/product-img/pro-big-2.jpg);">
                                  </li>
                                  <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(img/product-img/pro-big-3.jpg);">
                                  </li>
                                  <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(img/product-img/pro-big-4.jpg);">
                                  </li> -->
                              </ol>
                              <div class="carousel-inner">
                                  <div class="carousel-item active">
                                          <img class="d-block w-100" src="img/product-img/{$producto['imagenes']}" alt="First slide">
                                  </div>
                                  <!-- <div class="carousel-item">
                                      <a class="gallery_img" href="img/product-img/pro-big-2.jpg">
                                          <img class="d-block w-100" src="img/product-img/pro-big-2.jpg" alt="Second slide">
                                      </a>
                                  </div>
                                  <div class="carousel-item">
                                      <a class="gallery_img" href="img/product-img/pro-big-3.jpg">
                                          <img class="d-block w-100" src="img/product-img/pro-big-3.jpg" alt="Third slide">
                                      </a>
                                  </div>
                                  <div class="carousel-item">
                                      <a class="gallery_img" href="img/product-img/pro-big-4.jpg">
                                          <img class="d-block w-100" src="img/product-img/pro-big-4.jpg" alt="Fourth slide">
                                      </a>
                                  </div> -->
                              </div>
                          </div>
                      </div>
                      {/foreach}
                  </div>
                  <div class="col-12 col-lg-5">
                      <div class="single_product_desc">
                          <!-- Product Meta Data -->
                          <div class="product-meta-data">
                              <div class="line"></div>
                              <p class="product-price">${$producto['precio']}</p>

                                  <h6>{$producto['nombre']}</h6>

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
                            <p>{$producto['descripcion']}</p>
                          </div>

                          <!-- Add to Cart Form -->


                      </div>
                  </div>
              </div>
          </div>
      </div>
      <!-- Product Details Area End -->
