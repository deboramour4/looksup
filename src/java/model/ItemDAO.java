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
public class ItemDAO {
    
    public List<Item> getAll() {
        List<Item> resultado = new ArrayList<Item>();
                
        return resultado;
    }
    
    public boolean addItem(int id_product, int id_order ,int quantity) {
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            String query = "INSERT INTO item (id_product, id_order , quantity) VALUES (?, ?, ?)";
            PreparedStatement pstmt = c.prepareStatement(query);

            pstmt.setInt(1, id_product);
            pstmt.setInt(2, id_order);
            pstmt.setInt(3, quantity);
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
