$(document).ready(function() {
  "uses strict"

  $(".navegacionFiltrado").on("click", function(event){
    event.preventDefault();
    $('.navegacionFiltrado').removeClass('active');
    let dir = $(this).attr("href");
    $.ajax({
      "url" : dir,
      "method" : "GET",
      "data-type" : "HTML",
      success: function(textoCargado, status){
        console.log(textoCargado);
        $(".filtrado").html(textoCargado);
        $(".detalleProducto").on("click", function(event){
          let name = $(this).attr("name");
          getComentarios(name);
        });
      }
    });
  });

  $(".detalleProducto").on("click", function(event){
    let name = $(this).attr("name");
    getComentarios(name);
  });



});
