package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Debora
 */
public class LoginServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UsuarioDAO dao = new UsuarioDAO();
        List<Usuario> pessoas = dao.getAll();
        request.setAttribute("pessoas", pessoas);
        request.getRequestDispatcher("listarPessoas.jsp").forward(request, response);
    }

}
