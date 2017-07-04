package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Produto;
import model.ProdutoDAO;

/**
 *
 * @author Debora
 */
public class cartController extends HttpServlet {
    
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        
        
        
        if (cookies != null) { // se existem cookies, achar o cookie com a chave app.smd
            for (Cookie c : cookies) {
                if (c.getName().equals("app.smd")) { // se encontrou o cookie, mostrar os dados
                    //out.println("<p>Últimos Logins: <b>" + c.getValue().replaceAll("@", "<br/>") + "</b></p>");
                    break;
                }
            }
        }
    }
}
