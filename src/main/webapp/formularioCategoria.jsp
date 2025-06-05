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
<html>
<head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styles.css">
  <title>Formulario Categoria</title>
</head>
<body>
<h1>Formulario Categoria</h1>

<form action="<%=request.getContextPath()%>/categoria" method="post">
  <input type="hidden" name="idCategoria" value="<%= categoria.getIdCategoria() != null ? categoria.getIdCategoria() : "" %>">

  <div>
    <label for="nombre">Ingrese el nombre de categoría *</label><br>
    <input type="text"
           id="nombre"
           name="nombre"
           value="<%= categoria.getNombre() != null ? categoria.getNombre() : "" %>">
    <br>
    <% if(errores.get("nombre") != null) { %>
    <span style="color: red"><%= errores.get("nombre") %></span>
    <% } %>
  </div>
  <br>
  <div>
    <label for="descripcion">Ingrese la descripción *</label><br>
    <input type="text"
           id="descripcion"
           name="descripcion"
           value="<%= categoria.getDescripcion() != null ? categoria.getDescripcion() : "" %>">
    <br>
    <% if(errores.get("descripcion") != null) { %>
    <span style="color: red"><%= errores.get("descripcion") %></span>
    <% } %>
  </div>
  <br>
  <div>
    <input type="submit" value="<%=(categoria.getIdCategoria() != null && categoria.getIdCategoria() > 0) ? "Editar" : "Crear" %>">
  </div>
</form>
</body>
</html>