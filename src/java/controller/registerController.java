package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;
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
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        int phoneInt = 0;
        
        if (phone != ""){
            phoneInt =  Integer.parseInt(request.getParameter("phone"));
        }
        
        UsuarioDAO dao = new UsuarioDAO();
         
        boolean result = dao.addUser(name, email, birth, phoneInt, password);
                
        if(result){
            Usuario user = dao.getUserByEmail(email);
            
            if(password.equals(user.getPassword())){           
                HttpSession session = request.getSession(true);
                session.setAttribute("nome", user.getName());
                session.setAttribute("id", user.getId()); 
            }
            response.sendRedirect("register.jsp");
           
        } else {
            response.sendRedirect("404.jsp");
        }
        
        
    }

}
