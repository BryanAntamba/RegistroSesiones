<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel="stylesheet" href="CSS/login.css">
</head>
<body>
<div class="login-container">
  <h2>Login de usuario</h2>
  <form action="/RegistroSesiones/login" method="post">
    <div class="form-group">
      <label for="username">Nombre de usuario:</label>
      <input type="text" name="username" id="username" required>
    </div>

    <div class="form-group">
      <label for="pass">Contraseña:</label>
      <input type="password" name="password" id="pass" required>
    </div>

    <button type="submit">Iniciar Sesión</button>

  </form>
</div>
</body>
</html>
