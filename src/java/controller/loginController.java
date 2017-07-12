/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class loginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
         
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int order;
        
        if (request.getParameter("addOrder") != null && request.getParameter("addOrder") != "" ){
            order = Integer.parseInt(request.getParameter("addOrder"));
        } else {
            order =0 ;
        }
        
        UsuarioDAO dao = new UsuarioDAO();
        Usuario user = dao.getUserByEmail(email);
                
        if(password.equals(user.getPassword())){           
            HttpSession session = request.getSession(true);
            session.setAttribute("nome", user.getName());
            session.setAttribute("id", user.getId());
            
            if (order == 1){
                response.sendRedirect("addOrder");
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("404.jsp");
        }
        
        
        //request.getRequestDispatcher("listarPessoas.jsp").forward(request, response);
    }
}
