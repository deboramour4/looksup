package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
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
    
    public Produto getProductById(int id){
        Produto p = new Produto();
        
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            String query = "SELECT * FROM product WHERE id = ?";
            PreparedStatement pstmt = c.prepareStatement(query);
            
            pstmt.setInt(1, id);
            ResultSet r = pstmt.executeQuery();
            
            while(r.next()){
                p.setId(r.getInt("id"));
                p.setName(r.getString("name"));
                p.setPrice(r.getInt("price"));
                p.setCategory(r.getString("category"));
                p.setSubcategory(r.getString("subcategory"));
                p.setDescription(r.getString("description"));
                p.setImage(r.getString("image"));
                p.setQuantity(r.getInt("quantity"));
            }
            pstmt.close();
            r.close();
            c.close();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   
        return p;
    }
    
    public boolean setProductQuantity(int id, int quantity){
       
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            String query = "UPDATE product SET quantity = ? WHERE id = ?";
            PreparedStatement pstmt = c.prepareStatement(query);
            
            pstmt.setInt(1, quantity);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
            
            pstmt.close();
            c.close();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }   
        return true;
    }
       
}
