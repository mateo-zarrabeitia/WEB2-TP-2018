function enabledSubmit(response) {
  $('#comentar').removeAttr("disabled");
}

$(document).ready(function() {
  "uses strict"
  let intervaloComentarios;
  let orden = "default";
  let name = $('.productoId').attr("name");
  if(name != ''){
    getComentarios(orden,name);
  }

  $('select#ordenComentarios').on('change',function(){
    orden = $(this).val();
    getComentarios(orden,name);
    clearInterval(intervaloComentarios);
  });

  //COMENTARIOS

  let templateComentarios;
  let json = 0;
  fetch(getAbsolutePath()+'/js/templates/comentarios.handlebars')
  .then(response => response.text())
  .then(template => {
    templateComentarios = Handlebars.compile(template);
  });

  function getAbsolutePath() {
    let pathArray = window.location.pathname.split('/');
    return (window.location.origin+'/'+pathArray[1]+'/'+pathArray[2]);
  }


  function getComentarios(orden,id_moto) {
    if (orden != "default"){
      fetch(getAbsolutePath()+"/api/comentarios/producto/ordenados/"+orden+"/"+id_moto)
      .then(response => response.json())
      .then(jsonComentarios => {
        if (Object.keys(jsonComentarios).length === 0){
          document.querySelector("#comentarios-container").innerHTML = "<p>Este producto no tiene comentarios aun</p>";
        }
        if (JSON.stringify(jsonComentarios) === JSON.stringify(json)) {
        } else {
          cargarComentarios(jsonComentarios);
          json = jsonComentarios;
        }
      })
    } else {
    fetch(getAbsolutePath()+"/api/comentarios/producto/"+id_moto)
    .then(response => response.json())
    .then(jsonComentarios => {
      if (Object.keys(jsonComentarios).length === 0){
        document.querySelector("#comentarios-container").innerHTML = "<p>Este producto no tiene comentarios aun</p>";
      }
      if (JSON.stringify(jsonComentarios) === JSON.stringify(json)) {
      } else {
        cargarComentarios(jsonComentarios);
        json = jsonComentarios;
      }
    })
  }
  }

  function cargarComentarios(jsonComentarios) {
    clearInterval(intervaloComentarios);
    intervaloComentarios = setInterval(() =>  getComentarios(orden,name) , 2000);

    let context = { // como el assign de smarty
      comentarios: jsonComentarios
    }
    let html = templateComentarios(context);
    document.querySelector("#comentarios-container").innerHTML = html;
    $(".administracion").on("click", function(event){
      event.preventDefault();
      let id_comentario = $(".idComentario").attr("name");
      let id_usuarioSesion = $(".idUsuario").attr("name");
      let id_usuarioComentario = $(".administracion").attr("name");
      let userRol = $(".userRol").attr("name");

      if ((id_usuarioSesion === id_usuarioComentario)|| userRol == 1 ) {
                $.ajax({
                      method: "DELETE",
                      url: getAbsolutePath()+"/api/comentarios/"+id_comentario,
                      data:"HTML"
                    })
                  .done(function(data) {
                    alert("Se elimino correctamente");
                  })
                  .fail(function(data) {
                      alert("No se ha podido eliminar el comentario");
                  });
              } else {
                alert("No tiene permisos para borrar comentarios de otros Usuarios")
              }
    });
  }

  function guardarComentario() {
    let comentario ={
      "fk_id_moto": $('.id_moto').val(),
      "email": $('.usuario').val(),
      "comentario": $('.textocomentario').val(),
      "puntaje": $('.puntaje').val()
    }
    $.ajax({
      method: "POST",
      url: getAbsolutePath()+"/api/comentarios",
      data: JSON.stringify(comentario)
    })
    .done(function(data) {
      document.getElementById("formComentario").reset();
      let name = $('.productoId').attr("name");
      getComentarios(orden,name);
    })
    .fail(function(data) {
      alert("No se ha podido crear el comentario");
    });
  }



  $(".comentar").submit(function(event){
    event.preventDefault();
    guardarComentario();
  });

});
