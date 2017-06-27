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
 * @author Débora
 */
public class AddressDAO {
    
    public boolean addAddress(String way, int number, String city, String state, String country, int id_user) {
        try {
            Class.forName("org.postgresql.Driver");
            //Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/looksup", "postgres", "debora123");
            Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/looksup", "postgres", "ufc123");
            
            String query = "INSERT INTO address (way , number, city, state, country, id_user) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = c.prepareStatement(query);

            pstmt.setString(1, way);
            pstmt.setInt(2, number);
            pstmt.setString(3, city);
            pstmt.setString(4, state);
            pstmt.setString(5, country);
            pstmt.setInt(6, id_user);
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
    
    public Address getAddressByUserId(int id){
        Address a = new Address();
        
        try {
            Class.forName("org.postgresql.Driver");
            //Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/looksup", "postgres", "debora123");
            Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/looksup", "postgres", "ufc123");
            
            String query = "SELECT * FROM address WHERE id_user = ?";
            PreparedStatement pstmt = c.prepareStatement(query);
            
            pstmt.setInt(1, id);
            ResultSet r = pstmt.executeQuery();
            
            while(r.next()){
                a.setId(r.getInt("id"));
                a.setWay(r.getString("way"));
                a.setNumber(r.getInt("number"));
                a.setCity(r.getString("city"));
                a.setState(r.getString("state"));
                a.setCountry(r.getString("country"));
                a.setId_user(r.getInt("id_user"));
            }
            pstmt.close();
            r.close();
            c.close();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   
        return a;
    }
}
