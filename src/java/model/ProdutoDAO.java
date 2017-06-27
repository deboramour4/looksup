package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Debora
 */
public class ProdutoDAO {
    
    public List<Produto> getAll() {
        List<Produto> resultado = new ArrayList<Produto>();
                        
        try {
            Class.forName("org.postgresql.Driver");
            //Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/looksup", "postgres", "debora123");
            Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/looksup", "postgres", "ufc123");
            
            Statement s = c.createStatement();
            ResultSet r = s.executeQuery("SELECT * FROM product");
            
            while (r.next()) {
                Produto p = new Produto();
                p.setId(r.getInt("id"));
                p.setName(r.getString("name"));
                p.setPrice(r.getInt("price"));
                p.setCategory(r.getString("category"));
                p.setSubcategory(r.getString("subcategory"));
                p.setDescription(r.getString("description"));
                p.setImage(r.getString("image"));
                p.setQuantity(r.getInt("quantity"));
                resultado.add(p);
            }
                        
            r.close();
            s.close();
            c.close();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultado;
    }
       
}
