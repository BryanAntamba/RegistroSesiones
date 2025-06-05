<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.util.*, global.models.Articulo" %>
<%
    List<Articulo> articulos = (List<Articulo>) request.getAttribute("articulos");
    Optional<String> username = (Optional<String>) request.getAttribute("username");
%>
<html>
<head>
    <title>Listado Artículo</title>
    <style>
        .inactivo { background-color: #ffebee; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .acciones { white-space: nowrap; }
        .acciones a { margin-right: 10px; }
    </style>
</head>
<body>
    <h1>Listado Artículo</h1>

    <% if (username.isPresent()) { %>
        <div style="color: blue;">Hola, <%=username.get()%> bienvenido</div>
        <div style="margin: 20px 0;">
            <a href="${pageContext.request.contextPath}/articulo/form">Añadir Artículo</a>
        </div>
    <% } %>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Categoría</th>
                <th>Código</th>
                <th>Nombre</th>
                <th>Stock</th>
                <th>Descripción</th>
                <th>Imagen</th>
                <th>Estado</th>
                <% if (username.isPresent()) { %>
                    <th>Acciones</th>
                <% } %>
            </tr>
        </thead>
        <tbody>
            <% for (Articulo art : articulos) { %>
                <tr class="<%= art.getCondicion() == 0 ? "inactivo" : "" %>">
                    <td><%= art.getIdArticulo() %></td>
                    <td><%= art.getIdCategoria() %></td>
                    <td><%= art.getCodigo() %></td>
                    <td><%= art.getNombre() %></td>
                    <td><%= art.getStock() %></td>
                    <td><%= art.getDescripcion() %></td>
                    <td><%= art.getImagen() %></td>
                    <td><%= art.getCondicion() == 1 ? "Activo" : "Inactivo" %></td>
                    <% if (username.isPresent()) { %>
                        <td class="acciones">
                            <a href="${pageContext.request.contextPath}/articulo/form?id=<%= art.getIdArticulo() %>">Editar</a>
                            |
                            <a href="${pageContext.request.contextPath}/articulo/eliminar?idArticulo=<%= art.getIdArticulo() %>">
                                <%= art.getCondicion() == 1 ? "Desactivar" : "Activar" %>
                            </a>
                        </td>
                    <% } %>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>