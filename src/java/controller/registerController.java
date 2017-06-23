package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UsuarioDAO;

/**
 *
 * @author Débora
 */

public class registerController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String password = request.getParameter("password");
        
        UsuarioDAO dao = new UsuarioDAO();
        
        boolean result = dao.addUser(name, email, birth, phone, password);
                
        if(result){
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("404.jsp");
        }
        
        
    }

}
