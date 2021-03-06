<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title></title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/login.css">
</head>
<body>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/pizzeria.js"></script>
<script type="text/javascript" src="js/mustache.min.js"></script>
<script src="js/jquery.min.js"></script>
</body>
</html>
