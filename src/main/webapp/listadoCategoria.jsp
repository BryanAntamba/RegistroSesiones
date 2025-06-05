<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.util.*, global.models.Categoria" %>
<%
  List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
  Optional<String> username = (Optional<String>) request.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Listado Categoría</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/categorias.css" />
</head>
<body>

<h1>Listado Categoría</h1>

<%
  if (username.isPresent()) {
%>
<div class="welcome-msg">Hola, <%= username.get() %>, bienvenido</div>
<a href="${pageContext.request.contextPath}/categoria/form" class="btn-add">Añadir Categorías</a>
<% } %>

<table>
  <thead>
  <tr>
    <th>ID CATEGORIA</th>
    <th>NOMBRE</th>
    <th>DESCRIPCIÓN</th>
    <th>CONDICIÓN</th>
    <th>ACCIÓN</th>
  </tr>
  </thead>
  <tbody>
  <%
    for (Categoria cate : categorias) {
  %>
  <tr>
    <td><%= cate.getIdCategoria() %></td>
    <td><%= cate.getNombre() %></td>
    <td><%= cate.getDescripcion() %></td>
    <td><%= cate.getCondicion() == 1 ? "Activo" : "Inactivo" %></td>
    <td class="acciones">
      <% if (username.isPresent()) { %>
      <a href="<%= request.getContextPath() %>/categoria/form?id=<%= cate.getIdCategoria() %>">Editar</a>
      <a href="<%= request.getContextPath() %>/categoria/eliminar?idCategoria=<%= cate.getIdCategoria() %>">
        <%= (cate.getCondicion() == 1) ? "Desactivar" : "Activar" %>
      </a>
      <% } %>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>

<a href="<%= request.getContextPath() %>/index.html" class="btn-regresar">Regresar</a>

</body>
</html>
