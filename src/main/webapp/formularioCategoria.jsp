<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.util.*, global.models.Categoria" %>
<%
  Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
  if (errores == null) {
    errores = new HashMap<>();
  }

  Categoria categoria = (Categoria) request.getAttribute("categoria");
  if (categoria == null) {
    categoria = new Categoria();
  }
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Formulario Categoría</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/formularioCategoria.css">
</head>
<body>
<div class="form-container">
  <h1>Formulario Categoría</h1>

  <form action="<%=request.getContextPath()%>/categoria" method="post" class="categoria-form">
    <input type="hidden" name="idCategoria" value="<%= categoria.getIdCategoria() != null ? categoria.getIdCategoria() : "" %>">

    <div class="form-group">
      <label for="nombre">Ingrese el nombre de categoría *</label>
      <input type="text"
             id="nombre"
             name="nombre"
             value="<%= categoria.getNombre() != null ? categoria.getNombre() : "" %>"
             class="<%= errores.get("nombre") != null ? "input-error" : "" %>">
      <% if(errores.get("nombre") != null) { %>
      <span class="error-msg"><%= errores.get("nombre") %></span>
      <% } %>
    </div>

    <div class="form-group">
      <label for="descripcion">Ingrese la descripción *</label>
      <input type="text"
             id="descripcion"
             name="descripcion"
             value="<%= categoria.getDescripcion() != null ? categoria.getDescripcion() : "" %>"
             class="<%= errores.get("descripcion") != null ? "input-error" : "" %>">
      <% if(errores.get("descripcion") != null) { %>
      <span class="error-msg"><%= errores.get("descripcion") %></span>
      <% } %>
    </div>

    <div class="form-group">
      <input type="submit"
             value="<%=(categoria.getIdCategoria() != null && categoria.getIdCategoria() > 0) ? "Editar" : "Crear" %>"
             class="btn-submit">
    </div>
  </form>
</div>
</body>
</html>
