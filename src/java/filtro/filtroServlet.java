/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filtro;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author leoomoreira
 */
public class filtroServlet implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        String uri = ((HttpServletRequest) request).getRequestURI();
        System.out.println("Filter: URI filtrada " + uri);
        
        if ((uri == null)
                || (uri.equals("/LooksUp/account.jsp"))) {
            
            HttpSession session = ((HttpServletRequest) request).getSession();
            if (session.getAttribute("id") == null) {
                System.err.println("Filter: Você não tem acesso a esse recurso restrito");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                System.out.println("Filter: Você tem acesso a esse recurso restrito");
                chain.doFilter(request, response);
            }
            
                     
        } else {
            System.out.println("Filter: Esse recurso é livre de sessão");
            chain.doFilter(request, response);
                                             
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Filter: Filtro iniciado");
    }

    @Override
    public void destroy() {
        System.out.println("Filter: Filtro destruído");
    }

}
