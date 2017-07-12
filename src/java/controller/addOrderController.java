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
import model.Item;
import model.ItemDAO;
import model.Pedido;
import model.PedidoDAO;
import model.Produto;
import model.ProdutoDAO;

/**
 *
 * @author Débora
 */
public class addOrderController extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        if (session.getAttribute("id") == null){
            response.sendRedirect("login.jsp?addOrder=1");
        } else {
            int id_user = (int)session.getAttribute("id"); //id do usuario na sessão
        
        
            ItemDAO daoItem = new ItemDAO();
            PedidoDAO daoPed = new PedidoDAO();


            int id_order = daoPed.addOrder(id_user,  (float)session.getAttribute("totalCart") ); // cria um pedido para o usuario e retorna seu id(order)


            // desmanchando os cookies
            Cookie[] cookies = request.getCookies();

            if (cookies == null){
                System.out.println("cookies null");
            } else  { // se existem cookies, achar o cookie com a chave pCart
                List<Produto> cookiesProd = new ArrayList<Produto>() ; // lista com os produtos que serão colocados na sessão
                int qntProd[] = new int[50]; // lista com a quantidade de cada produto


                for (Cookie c : cookies) {
                    if (c.getName().equals("pCart")) { // se encontrou o cookie, mostrar os dados

                        if(c.getValue() != "" && c.getValue() != null){
                            String arrayProd[] = c.getValue().split("@");
                            String arrayPValues[][] = new String[50][50];

                            for(int i=0  ; i < arrayProd.length ; i++){
                                arrayPValues[i] = arrayProd[i].split("-");
                            }

                            for(int i=0  ; i < arrayProd.length ; i++){
                                boolean addI = daoItem.addItem( Integer.parseInt(arrayPValues[i][0]), id_order,  Integer.parseInt(arrayPValues[i][1]));
                                if(!addI) {
                                    System.out.println("Deu ruim");
                                }
                            } 
                            
                        } else {
                            System.out.println("pCart empty");
                        }
                    }
                }
                
                response.sendRedirect("account.jsp#tab2");
            } 
        
        }
        
    }

}
