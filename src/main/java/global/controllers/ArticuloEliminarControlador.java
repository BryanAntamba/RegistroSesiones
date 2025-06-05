package global.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import global.models.Articulo;
import global.service.ArticuloService;
import global.service.ArticuloServiceJdbcImplements;

import java.io.IOException;
import java.sql.Connection;
import java.util.Optional;

@WebServlet("/articulo/eliminar")
public class ArticuloEliminarControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        // Obtener el ID del artículo
        String idParam = req.getParameter("idArticulo");

        // Validar que el parámetro no esté vacío
        if (idParam == null || idParam.trim().isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, 
                "Falta el parámetro idArticulo");
            return;
        }

        try {
            // Convertir el ID a Integer
            Integer idArticulo = Integer.parseInt(idParam.trim());

            // Obtener la conexión
            Connection conn = (Connection) req.getAttribute("conn");
            ArticuloService service = new ArticuloServiceJdbcImplements(conn);

            // Obtener el artículo actual
            Optional<Articulo> optionalArticulo = service.porId(idArticulo.longValue());

            if (optionalArticulo.isPresent()) {
                Articulo articulo = optionalArticulo.get();
                // Cambiar la condición (1 -> 0 o 0 -> 1)
                articulo.setCondicion(articulo.getCondicion() == 1 ? 0 : 1);
                
                // Guardar el cambio
                service.guardar(articulo);
            }

            // Redireccionar al listado de artículos
            resp.sendRedirect(req.getContextPath() + "/articulo");

        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, 
                "El idArticulo no es válido");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                "Error al cambiar el estado del artículo");
        }
    }
}