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
    private List<Produto> cookiesProd = new ArrayList<Produto>() ;

    public List<Produto> getCookiesProd() {
        return cookiesProd;
    }

     
     protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        ProdutoDAO daoP = new ProdutoDAO();
        
        if (cookies != null) { // se existem cookies, achar o cookie com a chave pCart
            for (Cookie c : cookies) {
                if (c.getName().equals("pCart")) { // se encontrou o cookie, mostrar os dados
                    String arrayProd[] = c.getValue().split("@");
                    for(int i=0  ; i < arrayProd.length ; i++){
                        int idTemp = Integer.parseInt(arrayProd[i]);
                        Produto p = daoP.getProductById(idTemp);
                        cookiesProd.add(p);
                    }
                }
        }
            
        System.out.println(cookies+"  ---------------------------------------------");
        System.out.println(cookiesProd+"  ---------------------------------------------");
        
        }
        System.out.println("A LISTA DE COOKIES N EXISTE---------------------------------------------");
                        
        response.sendRedirect("cart.jsp");
    }
}
