/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Address;
import model.AddressDAO;
import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Débora
 */
public class accountController extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        
        String way = request.getParameter("way");
        int number =  Integer.parseInt(request.getParameter("number"));
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        int id_user = (Integer) session.getAttribute("id");
        
        AddressDAO dao = new AddressDAO();
        
        boolean result = dao.addAddress(way, number, city, state, country, id_user);
                
        if(result){
            response.sendRedirect("account.jsp");
        } else {
            response.sendRedirect("404.jsp");
        }
    }
    
    public Usuario getUserData(int id){
        UsuarioDAO dao = new UsuarioDAO();
        return dao.getUserById(id);
    }
    public Address getAddressData(int id){
        AddressDAO dao = new AddressDAO();
        return dao.getAddressByUserId(id);
    }
}
