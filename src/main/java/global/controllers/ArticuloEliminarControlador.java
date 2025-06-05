
package global.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import global.service.ArticuloService;
import global.service.ArticuloServiceJdbcImplements;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/articulo/eliminar")
public class ArticuloEliminarControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("idArticulo");

        if (idParam == null || idParam.trim().isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el parámetro idArticulo");
            return;
        }

        try {
            Integer idArticulo = Integer.parseInt(idParam.trim());
            Connection conn = (Connection) req.getAttribute("conn");
            ArticuloService service = new ArticuloServiceJdbcImplements(conn);

            service.eliminar(idArticulo);
            resp.sendRedirect(req.getContextPath() + "/articulo");

        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "El idArticulo no es válido");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cambiar el estado del artículo");
        }
    }
}

