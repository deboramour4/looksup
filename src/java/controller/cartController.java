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
     
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        ProdutoDAO daoP = new ProdutoDAO();
        boolean find = false;
        
        if (cookies == null){
            response.sendRedirect("cart.jsp");
        } else  { // se existem cookies, achar o cookie com a chave pCart
            List<Produto> cookiesProd = new ArrayList<Produto>() ; // lista com os produtos que serão colocados na sessão
            int qntProd[] = new int[50]; // lista com a quantidade de cada produto
            
            HttpSession session = request.getSession();
            
            for (Cookie c : cookies) {
                if (c.getName().equals("pCart")) { // se encontrou o cookie, mostrar os dados
                    
                    String arrayProd[] = c.getValue().split("@");
                    String arrayPValues[][] = new String[50][50];
                    
                    for(int i=0  ; i < arrayProd.length ; i++){
                        arrayPValues[i] = arrayProd[i].split("-");
                    }
                    
                    for(int i=0  ; i < arrayProd.length ; i++){
                        for(int j=0  ; j < 2 ; j++){
                            if(j==0){
                                int idTemp = Integer.parseInt(arrayPValues[i][j]);

                                Produto p = daoP.getProductById(idTemp);
                                cookiesProd.add(p);
                            } 
                            if (j==1){
                                qntProd[i] = Integer.parseInt(arrayPValues[i][j]);
                            }   
                        }
                    }
                    session.setAttribute("cookiesProd", cookiesProd);
                    session.setAttribute("qntProd", qntProd);
                    find = true;
                    response.sendRedirect("cart.jsp");
                }
            }
            
            if(!find){
                response.sendRedirect("cart.jsp");
            }
        }      
    }
    
    
    public void deleteItemCart(int id){
        
    }
}
