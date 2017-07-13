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
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author Debora
 */
public class PedidoDAO {
    
    public List<Pedido> getAll() {
        List<Pedido> resultado = new ArrayList<Pedido>();
                
        return resultado;
    }
    
    public int addOrder(int id_user, float value) {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Date d = new Date();
	String date = dateFormat.format(d);
        
        int id_order = 0;
        
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            String query = "INSERT INTO \"order\" (id_user, value , date) VALUES (?, ?, ?)";
            PreparedStatement pstmt = c.prepareStatement(query);

            pstmt.setInt(1, id_user);
            pstmt.setFloat(2, value);
            pstmt.setString(3, date);
            pstmt.executeUpdate();
            
            String query2 = "SELECT id from \"order\" WHERE  date = ?";
            PreparedStatement pstmt2 = c.prepareStatement(query2);

            pstmt2.setString(1, date);
            ResultSet r = pstmt2.executeQuery();
                     
            while(r.next()){
                id_order = (r.getInt("id"));
            }
            
            pstmt.close();
            pstmt2.close();
            c.close();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        return id_order;
    }
    
    
    public Pedido getOrderById(int id){
        Pedido p = new Pedido();
        
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            String query = "SELECT * FROM \"order\" WHERE id = ?";
            PreparedStatement pstmt = c.prepareStatement(query);
            
            pstmt.setInt(1, id);
            ResultSet r = pstmt.executeQuery();
            
            while(r.next()){
                p.setId(r.getInt("id"));
                p.setId_user(r.getInt("id_user"));
                p.setValue(r.getFloat("value"));
                p.setDate(r.getString("date"));
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
    
    public List<Pedido> getOrdersByUser(int id_user){
         List<Pedido> resultado = new ArrayList<Pedido>();
           
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            
            String query = ("SELECT * FROM \"order\" WHERE id_user = ?");
            PreparedStatement pstmt = c.prepareStatement(query);
            
            pstmt.setInt(1, id_user);
            ResultSet r = pstmt.executeQuery();
            
            while (r.next()) {
                Pedido p = new Pedido();
                p.setId(r.getInt("id"));
                p.setId_user(r.getInt("id_user"));
                p.setValue(r.getFloat("value"));
                p.setDate(r.getString("date"));
                resultado.add(p);
            }
                        
            r.close();
            pstmt.close();
            c.close();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         
        return resultado;       
    }
    
    public List<Item> getItensOrderById(int id_order){
         List<Item> resultado = new ArrayList<Item>();
           
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            
            String query = ("SELECT * FROM item WHERE id_order = ?");
            PreparedStatement pstmt = c.prepareStatement(query);
            
            pstmt.setInt(1, id_order);
            ResultSet r = pstmt.executeQuery();
            
            while (r.next()) {
                Item i = new Item();
                i.setId(r.getInt("id"));
                i.setId_product(r.getInt("id_product"));
                i.setId_order(r.getInt("id_order"));
                i.setQuantity(r.getInt("quantity"));

                resultado.add(i);
            }
                        
            r.close();
            pstmt.close();
            c.close();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         
        return resultado;       
    }
    

}

 