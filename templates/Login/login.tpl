<div class="wrapper">
  <form id="login"action="verificarUsuario" method="post" class="form-signin">
    <h2 class="form-signin-heading text-center">Loguearse</h2>
    <div class="form-group">
              <label for="usuario">Usuario</label>
              <input type="email" class="form-control" id="usuario" name="usuario" placeholder="juan.perez@mail.com" required>
    </div>
    <div class="form-group">
              <label for="password">Contraseña</label>
              <input type="password" class="form-control" id="password" name ="password" placeholder="Password" required>
    </div>
    {if !empty($error) }
             <div class="alert alert-danger" role="alert">{$error}</div>
     {/if}
    <button class="btn btn-lg btn-primary btn-block login" type="submit">Iniciar Sesion</button>
    <p class="message">¿No esta Registrado? <a href="register" class="administracion">Crear una Cuenta</a></p>
  </form>
</div>
