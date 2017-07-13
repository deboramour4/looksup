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
        //id do usuario guardado na sessão
        int id_user = (Integer) session.getAttribute("id");
        boolean result2=false;
        
        //dados do usuario
        String name = request.getParameter("name");
        String birth = request.getParameter("birth");
        String phone = request.getParameter("phone");
        int phoneInt = 0;       
        if (phone != ""){
            phoneInt =  Integer.parseInt(request.getParameter("phone"));
        }
        
        //dados da conta
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        //atualizando dados da conta    
        UsuarioDAO daoU = new UsuarioDAO();
        boolean result1 = daoU.updateUser(id_user, name, email, birth, phoneInt, password);
               
        
        //dados do endereço
        String way = request.getParameter("way");
        int number =  Integer.parseInt(request.getParameter("number"));
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");      
        
            
        //adiciona novo endereço
        AddressDAO daoAd = new AddressDAO();
        Address ad = new Address();
        ad = daoAd.getAddressByUserId(id_user);
        //checa se o usuário já possui um endereço ou não
        if(ad == null ){
            result2 = daoAd.addAddress(way, number, city, state, country, id_user);
        } else {
            result2 = daoAd.updateAddress(way, number, city, state, country, id_user);
        }  
        
                            
        if(result1 && result2){
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
