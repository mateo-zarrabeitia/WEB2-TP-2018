$(document).ready(function() {
  $(".navegacionAdmin").on("click", function (event) {
    event.preventDefault();
    let dir = $(this).attr("href")
    alert(window.location.origin + window.location.pathname+dir);
    $.ajax({
      "url" : window.location.origin + window.location.pathname+dir,
      "method" : "GET",
      "data-type" : "HTML",
      success: function(textoCargado, status){
        $(".contenidoAdmin").html(textoCargado);
        console.log(textoCargado);

      }
    });
  });


  $(".navegacion").on("click", function (event) {
    event.preventDefault();
    let dir = $(this).attr("href");
    if (dir == "home") {
      $('#inicio,#inicio2').addClass('active');
      $('#productos,#productos2').removeClass('active');
      $(".filtros").hide();
      $(".anuncio").show();
      $('#contenido').removeClass('amado_product_area section-padding-100');
      $('#contenido').addClass('products-catagories-area clearfix');
    } else if (dir == "productos/todas") {
      $('#productos,#productos2').addClass('active');
      $('#inicio,#inicio2').removeClass('active');
      $('#contenido').removeClass('products-catagories-area clearfix');
      $('#contenido').addClass('amado_product_area section-padding-100');
      $(".filtros").show();
      //AJAX PARA LAS CATEGORIAS
      $.ajax({
        "url" : window.location.origin + window.location.pathname+"filtros",
        "method" : "GET",
        "data-type" : "HTML",
        success: function(textoCargado, status){
          $("#filtro").html(textoCargado);
          //AJAX PARA LOS PRODUCTOS
          $.ajax({
            "url" : window.location.origin + window.location.pathname+"productos/todas",
            "method" : "GET",
            "data-type" : "HTML",
            success: function(textoCargado, status){
              $("#contenido").html(textoCargado);
              $(".anuncio").hide();
              //AJAX PARA DETALLE DE PRODUCTOS
              $(".administracion").on("click", function(event){
                event.preventDefault();
                let dir = $(this).attr("href");
                let name = $(this).attr("name");
                $.ajax({
                  "url" : window.location.origin + window.location.pathname+dir,
                  "method" : "GET",
                  "data-type" : "HTML",
                  success: function(textoCargado, status){
                    if (name == "borrar") {
                      location.reload();
                    }
                    $(".filtros").hide();
                    $("#contenido").html(textoCargado);
                  }
                });
              });
              $(".detalleProducto").on("click", function(event){
                event.preventDefault();
                $('.todas').removeClass('active');
                let dir = $(this).attr("href");
                $.ajax({
                  "url" : window.location.origin + window.location.pathname+dir,
                  "method" : "GET",
                  "data-type" : "HTML",
                  success: function(textoCargado, status){
                    $("#contenido").html(textoCargado);
                  }
                });
              });
            }
          });
          $(".filtros").html(textoCargado);
          $('.filtros').addClass('shop_sidebar_area');
          $(".navegacionFiltrado").on("click", function(event){
            event.preventDefault();
            $('.todas').removeClass('active');
            let dir = $(this).attr("href");
            let name = $(this).attr("name");
            $.ajax({
              "url" : window.location.origin + window.location.pathname+dir,
              "method" : "GET",
              "data-type" : "HTML",
              success: function(textoCargado, status){
                if (name == "borrar") {
                  location.reload();
                }
                $("#contenido").html(textoCargado);
                $(".administracion").on("click", function(event){
                  event.preventDefault();
                  let dir = $(this).attr("href");
                  let name = $(this).attr("name");
                  $.ajax({
                    "url" : window.location.origin + window.location.pathname+dir,
                    "method" : "GET",
                    "data-type" : "HTML",
                    success: function(textoCargado, status){
                      if (name == "borrar") {
                        location.reload();
                      }
                      $(".filtros").hide();
                      $("#contenido").html(textoCargado);
                    }
                  });
                });
                // DETALLE DE PRODUCTO
                $(".detalleProducto").on("click", function(event){
                  event.preventDefault();
                  let dir = $(this).attr("href");
                  $.ajax({
                    "url" : window.location.origin + window.location.pathname+dir,
                    "method" : "GET",
                    "data-type" : "HTML",
                    success: function(textoCargado, status){
                      $("#contenido").html(textoCargado);
                    }
                  });
                });
              }
            });

          });
        }
      });
    }
    $.ajax({
      "url" : window.location.origin + window.location.pathname+dir,
      "method" : "GET",
      "data-type" : "HTML",
      success: function(textoCargado, status){
        $("#contenido").html(textoCargado);
        if (dir == "login" || dir == "register" || dir == "adminAgregarProducto" || dir == "adminAgregarMarca"){
          $(".filtros").hide();
        }

        $(".administracion").on("click", function(event){
          event.preventDefault();
          let dir = $(this).attr("href");
          mostrarLogin(dir);
        });

      }
    });
  });

  function mostrarLogin(dir) {
    alert(dir);
    $.ajax({
      "url" : window.location.origin + window.location.pathname+dir,
      "method" : "GET",
      "data-type" : "HTML",
      success: function(textoCargado, status){
        $(".filtros").hide();
        $("#contenido").html(textoCargado);
        $(".administracion").on("click", function(event){
          event.preventDefault();
          let dir = $(this).attr("href");
          mostrarLogin(dir);
        });
      }
    });
  }






  mostrarInicio();
  function mostrarInicio() {
    event.preventDefault();
    $.ajax({
      "url" : window.location.origin + window.location.pathname+"home",
      "method" : "GET",
      "data-type" : "HTML",
      success: function(textoCargado, status){
        $("#contenido").html(textoCargado);
      }
    });
    $.ajax({
      "url" : window.location.origin + window.location.pathname+"anuncio",
      "method" : "GET",
      "data-type" : "HTML",
      success: function(textoCargado, status){
        $(".anuncio").html(textoCargado);
      }
    });
  }


});
