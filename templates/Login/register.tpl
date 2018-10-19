<div class="wrapper">
  <form action="crearUsuario" method="post" class="form-signin">
    <h2 class="form-signin-heading text-center">Registrarse</h2>
    <div class="form-group">
              <label for="nombre">Nombre</label>
              <input type="text" class="form-control" id="nombre" name="nombre" placeholder="juan perez" required>
    </div>
    <div class="form-group">
              <label for="password">Contraseña</label>
              <input type="password" class="form-control" id="password" name ="password" placeholder="Password" required>
    </div>
    <div class="form-group">
              <label for="email">Email</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="juan.perez@mail.com" required>
    </div>
    {if !empty($error) }
             <div class="alert alert-danger" role="alert">{$error}</div>
     {/if}
    <label for=""></label>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Crear</button>
    <p class="message">¿Usted esta Registrado? <a href="login" class="administracion">Iniciar Sesion</a></p>
  </form>
</div>
