package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Debora
 */
public class deleteItemController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
                    
        Cookie[] cookies = request.getCookies();
            
        for (Cookie c : cookies) {
            if (c.getName().equals("pCart")) { 
                //pega os valores do cookie
                System.out.print(c.getValue()+" VALOR DO COOKIE ---------------------------------------\n");
                String arrayProd[] = c.getValue().split("@");
                
                
                String arrayPValues[][] = new String[50][50];               
                for(int i=0  ; i < arrayProd.length ; i++){
                    arrayPValues[i] = arrayProd[i].split("-");
                }
                
                /*for(int i=0  ; i < arrayProd.length ; i++){
                    for(int j=0  ; j < 2 ; j++){
                        System.out.print(arrayPValues[i][j]+" DADADA ");
                    }
                    System.out.print("\n DEDEDE");
                }*/
                
                //percorre a matriz com os valores do cookie                
                for(int i=0  ; i < arrayProd.length ; i++){
                    for(int j=0  ; j < 2 ; j++){
                        //System.out.print(arrayPValues[i][j]+" ");

                        //encontra o elemento o com o id recebido
                        if(j==0 && arrayPValues[i][0].equals(id)){
                           
                           String row = null;
                           for(int a=0; a < arrayProd.length ; a ++){
                               if (arrayPValues[a][0].equals(id)){
                                   if(a==0){
                                       row = "";
                                   } else {
                                   row = row+ "";
                                   }
                               } else {
                                   if(a==0){
                                       row = arrayPValues[a][0]+"-"+arrayPValues[a][1];
                                   } else {
                                   row = row + "@"+arrayPValues[a][0]+"-"+arrayPValues[a][1];
                                   }
                               }
                           }
                           System.out.print(row+" ROWWWW\n");
                           //c.setValue(row);
                           //c.setMaxAge(Integer.MAX_VALUE);
                           //response.addCookie(c);
                       }   
                    }
                    //System.out.print("\n");
                    
                }
                
            }
        }

        //response.sendRedirect("cart");    
            

            
            
    }
}