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
        boolean notEnought = false;
        boolean orderCreate = true;
        int id_order = 0;
        
        if (session.getAttribute("id") == null){
            response.sendRedirect("login.jsp?addOrder=1");
        } else {
            int id_user = (int)session.getAttribute("id"); //id do usuario na sessão
        
        
            ItemDAO daoItem = new ItemDAO();
            PedidoDAO daoPed = new PedidoDAO();
            ProdutoDAO daoProd = new ProdutoDAO();

          
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
                                
                                //checa se tem estoque disponivel do produto
                                Produto pr = daoProd.getProductById(Integer.parseInt(arrayPValues[i][0]));
                                int qntP = pr.getQuantity();
                                 System.out.println("QUANTIDADE DO PRODUTO: "+qntP);
                                
                                 //se a quantidade de produtos no estoque é menor que a quantidade do pedido
                                if(qntP < Integer.parseInt(arrayPValues[i][1])){ 
                                    System.out.println("Era mais que tinha no estoque");
                                    notEnought = true;
                                } else { //se a quantidade de produtos no estoque é maior ou igual que a quantidade do pedido, cria o pedido e adiciona os itens
                                    if(orderCreate){
                                         id_order = daoPed.addOrder(id_user,  (float)session.getAttribute("totalCart") ); // cria um pedido para o usuario e retorna seu id(order)
                                         orderCreate = false;
                                    }
                                    daoProd.setProductQuantity(Integer.parseInt(arrayPValues[i][0]), pr.getQuantity()-Integer.parseInt(arrayPValues[i][1]));
                                    System.out.println("QUANTIDADE NOVA DO PRODUTO: "+ (pr.getQuantity()-Integer.parseInt(arrayPValues[i][1])));
                                    boolean addI = daoItem.addItem( Integer.parseInt(arrayPValues[i][0]), id_order,  Integer.parseInt(arrayPValues[i][1]));
                                }
                                
                            }                            
                            c.setValue(""); // esvazia o carrinho
                        } else {
                            System.out.println("pCart empty");
                        }
                    }
                }
                if(!notEnought){
                    response.sendRedirect("sucess.jsp?resultOrder=true");
                } else {
                    response.sendRedirect("sucess.jsp?resultOrder=false");
                }
            } 
        
        }
        
    }

}
