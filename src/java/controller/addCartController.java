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
        int qnt = Integer.parseInt(request.getParameter("qnt"));
        boolean find = false;
        
        Cookie[] cookies = request.getCookies();
       
        if (cookies == null) { // não existem cookies
            System.out.println("Não existem cookies  ---------------------------------------------");
            Cookie c = new Cookie("pCart", id+"-"+qnt);
            c.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(c);
        } else { // se existe algum cookie
            System.out.println("Ja existe lista de cookies  ---------------------------------------------");
            Cookie c = null;
            for (Cookie temp : request.getCookies()) {
                if (temp.getName().equals("pCart")) { // procura por um cookie já armazenado
                    c = temp;
                    break;
            }
        }
        if (c == null || c.getValue().equals("")) { // se não existe, é a primeira vez
            System.out.println("Não existem cookie com o nome pcart  ---------------------------------------------");
            c = new Cookie("pCart", id+"-"+qnt);
            c.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(c);
        } else { // se já existe, só atualiza
            System.out.println("Ja existe cookie com o nome pCart e ele adc  ---------------------------------------------");
            
            //pesquisa o id do produto na lista já existente
            String arrayProd[] = c.getValue().split("@");
            String arrayPValues[][] = new String[50][50];

            for(int i=0  ; i < arrayProd.length ; i++){
                arrayPValues[i] = arrayProd[i].split("-");
            }
            for(int i=0  ; i < arrayProd.length ; i++){
                for(int j=0  ; j < 2 ; j++){
                     System.out.print(arrayPValues[i][j]+" ");
                    
                     //se ele já existir, adiciona a quantidade recebida com a quantidade atual
                     if(j==0 && Integer.parseInt(arrayPValues[i][0]) == Integer.parseInt(id) && !find){
                        qnt = qnt + Integer.parseInt(arrayPValues[i][1]); 
                       
                        String row = null;
                        for(int a=0; a < arrayProd.length ; a ++){
                            if (Integer.parseInt(arrayPValues[a][0]) == Integer.parseInt(id)){
                                if(a==0){
                                    row = arrayPValues[a][0]+"-"+qnt;
                                } else {
                                row = row + "@"+arrayPValues[a][0]+"-"+qnt;
                                }
                            } else {
                                if(a==0){
                                    row = arrayPValues[a][0]+"-"+arrayPValues[a][1];
                                } else {
                                row = row + "@"+arrayPValues[a][0]+"-"+arrayPValues[a][1];
                                }
                            }
                        }
                        c.setValue(row);
                        c.setMaxAge(Integer.MAX_VALUE);
                        response.addCookie(c);
                        find = true;
                    }   
                }
                System.out.print("\n");
            }   
            
           // se não existir produto com o id recebido, é adicionado com a quantidade recebida 
            if(!find){
                System.out.println("VEIO FOI PRA CÁ  ---------------------------------------------");
                c.setValue(c.getValue() + "@" + id + "-" + qnt);
                c.setMaxAge(Integer.MAX_VALUE);
                response.addCookie(c);
            }
        }
    }
       
        response.sendRedirect("cart");
    }
}
