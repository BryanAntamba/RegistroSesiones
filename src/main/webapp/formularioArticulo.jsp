<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.util.*, global.models.Articulo" %>
<%
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
    if (errores == null) {
        errores = new HashMap<>();
    }

    Articulo articulo = (Articulo) request.getAttribute("articulo");
    if (articulo == null) {
        articulo = new Articulo();
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Formulario Artículo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/formularioArticulo.css" />
</head>
<body>
<div class="form-container">
    <h1>Formulario Artículo</h1>

    <% if(errores.get("db") != null) { %>
    <div class="error-msg"><%= errores.get("db") %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/articulo" method="post" class="articulo-form">
        <input type="hidden" name="idArticulo"
               value="<%= articulo.getIdArticulo() != null ? articulo.getIdArticulo() : "" %>">

        <div class="form-group">
            <label for="idCategoria">ID Categoría: *</label>
            <input type="number" id="idCategoria" name="idCategoria"
                   value="<%= articulo.getIdCategoria() != null ? articulo.getIdCategoria() : "" %>"
                   class="<%= errores.get("idCategoria") != null ? "input-error" : "" %>">
            <% if(errores.get("idCategoria") != null) { %>
            <div class="error-msg"><%= errores.get("idCategoria") %></div>
            <% } %>
        </div>

        <div class="form-group">
            <label for="codigo">Código: *</label>
            <input type="text" id="codigo" name="codigo"
                   value="<%= articulo.getCodigo() != null ? articulo.getCodigo() : "" %>"
                   class="<%= errores.get("codigo") != null ? "input-error" : "" %>">
            <% if(errores.get("codigo") != null) { %>
            <div class="error-msg"><%= errores.get("codigo") %></div>
            <% } %>
        </div>

        <div class="form-group">
            <label for="nombre">Nombre: *</label>
            <input type="text" id="nombre" name="nombre"
                   value="<%= articulo.getNombre() != null ? articulo.getNombre() : "" %>"
                   class="<%= errores.get("nombre") != null ? "input-error" : "" %>">
            <% if(errores.get("nombre") != null) { %>
            <div class="error-msg"><%= errores.get("nombre") %></div>
            <% } %>
        </div>

        <div class="form-group">
            <label for="stock">Stock: *</label>
            <input type="number" id="stock" name="stock"
                   value="<%= articulo.getStock() != null ? articulo.getStock() : "" %>"
                   class="<%= errores.get("stock") != null ? "input-error" : "" %>">
            <% if(errores.get("stock") != null) { %>
            <div class="error-msg"><%= errores.get("stock") %></div>
            <% } %>
        </div>

        <div class="form-group">
            <label for="descripcion">Descripción:</label>
            <input type="text" id="descripcion" name="descripcion"
                   value="<%= articulo.getDescripcion() != null ? articulo.getDescripcion() : "" %>">
        </div>

        <div class="form-group">
            <label for="imagen">Imagen:</label>
            <input type="text" id="imagen" name="imagen"
                   value="<%= articulo.getImagen() != null ? articulo.getImagen() : "" %>">
        </div>

        <div class="form-group">
            <input type="submit"
                   value="<%= articulo.getIdArticulo() != null && articulo.getIdArticulo() > 0 ? "Modificar" : "Crear" %>"
                   class="btn-submit">
        </div>
    </form>
</div>
</body>
</html>
