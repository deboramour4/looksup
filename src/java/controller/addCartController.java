package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Debora
 */
public class addCartController extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
       
       Cookie[] cookies = request.getCookies();
       
        if (cookies == null) { // não existem cookies
            Cookie c = new Cookie("pCart", id);
            c.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(c);
        } else { // se existe algum cookie
            Cookie c = null;
            for (Cookie temp : request.getCookies()) {
                if (temp.getName().equals("pCart")) { // procura por um cookie já armazenado
                    c = temp;
                    break;
            }
        }
        if (c == null) { // se não existe, é a primeira vez
            c = new Cookie("pCart", id);
            c.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(c);
        } else { // se já existe, só atualiza
            c.setValue(c.getValue() + "@" + id);
            c.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(c);
            }
        }
        
        HttpSession session = request.getSession();
        //String listCart = (String) session.setAttribute("login");
        
    }
}
