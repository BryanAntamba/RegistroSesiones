package global.controllers;
import com.google.protobuf.DescriptorProtos;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import global.service.LoginService;
import global.service.LoginServiceSessionImplement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

// Definición del Servlet que manejará las rutas /login y /login.html
//path o anotación
@WebServlet({"/login","/login.html"})
public class LoginServlet extends HttpServlet {
    final static String USERNAME = "admin";
    final static String PASSWORD = "12345";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //implementamos el objeto de tipo sesion
        LoginService auth=new LoginServiceSessionImplement();
        //creamos una variable opcional
        //para obtener el nombre del usuario
        Optional<String> usernameOptional = auth.getUserName(req);


        if (usernameOptional.isPresent()) {
            resp.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = resp.getWriter()) {
                out.print("<!DOCTYPE html>");
                out.println("<html lang='es'>");
                out.println("<head>");
                out.println("<meta charset='utf-8'>");
                out.println("<title>Bienvenido " + usernameOptional.get() + "</title>");
                out.println("<link rel='stylesheet' href='" + req.getContextPath() + "/CSS/LoginServlet.css'>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class='card'>");
                out.println("<h1>¡Hola, " + usernameOptional.get() + "!</h1>");
                out.println("<p class='mensaje'>Has iniciado sesión correctamente.</p>");
                out.println("<a class='btn-zoom' href='" + req.getContextPath() + "/index.html'>Volver al inicio</a>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            }
        }else{
            getServletContext().getRequestDispatcher("/login.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if (username.equals(USERNAME) && password.equals(PASSWORD)) {

            //creamo la sesión
            HttpSession session = req.getSession();
            //Seteo lo valores de la sesion
            session.setAttribute("username", username);

            resp.sendRedirect(req.getContextPath()+"/login.html");
        } else {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Lo sentimos no tiene acceso");
        }
    }
}