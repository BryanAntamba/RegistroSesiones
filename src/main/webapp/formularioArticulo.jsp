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
<html>
<head>
    <title>Formulario Artículo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styles.css">
    <style>
        .error {
            color: red;
            font-size: 0.8em;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <h1>Formulario Artículo</h1>

    <% if(errores.get("db") != null) { %>
        <div class="error"><%= errores.get("db") %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/articulo" method="post">
        <input type="hidden" name="idArticulo" 
               value="<%= articulo.getIdArticulo() != null ? articulo.getIdArticulo() : "" %>">
        
        <div>
            <label for="idCategoria">ID Categoría: *</label>
            <input type="number" id="idCategoria" name="idCategoria" 
                   value="<%= articulo.getIdCategoria() != null ? articulo.getIdCategoria() : "" %>">
            <% if(errores.get("idCategoria") != null) { %>
                <div class="error"><%= errores.get("idCategoria") %></div>
            <% } %>
        </div>

        <div>
            <label for="codigo">Código: *</label>
            <input type="text" id="codigo" name="codigo" 
                   value="<%= articulo.getCodigo() != null ? articulo.getCodigo() : "" %>">
            <% if(errores.get("codigo") != null) { %>
                <div class="error"><%= errores.get("codigo") %></div>
            <% } %>
        </div>

        <div>
            <label for="nombre">Nombre: *</label>
            <input type="text" id="nombre" name="nombre" 
                   value="<%= articulo.getNombre() != null ? articulo.getNombre() : "" %>">
            <% if(errores.get("nombre") != null) { %>
                <div class="error"><%= errores.get("nombre") %></div>
            <% } %>
        </div>

        <div>
            <label for="stock">Stock: *</label>
            <input type="number" id="stock" name="stock" 
                   value="<%= articulo.getStock() != null ? articulo.getStock() : "" %>">
            <% if(errores.get("stock") != null) { %>
                <div class="error"><%= errores.get("stock") %></div>
            <% } %>
        </div>

        <div>
            <label for="descripcion">Descripción:</label>
            <input type="text" id="descripcion" name="descripcion" 
                   value="<%= articulo.getDescripcion() != null ? articulo.getDescripcion() : "" %>">
        </div>

        <div>
            <label for="imagen">Imagen:</label>
            <input type="text" id="imagen" name="imagen" 
                   value="<%= articulo.getImagen() != null ? articulo.getImagen() : "" %>">
        </div>

        <div>
            <input type="submit" 
                   value="<%= articulo.getIdArticulo() != null && articulo.getIdArticulo() > 0 ? "Modificar" : "Crear" %>">
        </div>
    </form>
</body>
</html>