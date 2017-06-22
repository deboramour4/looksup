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
public class UsuarioDAO {
    
    public List<Usuario> getAll() {
        List<Usuario> resultado = new ArrayList<Usuario>();
        try {
            Class.forName("org.postgresql.Driver");
            Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/looksup", "postgres", "debora123");
            
            Statement s = c.createStatement();
            ResultSet r = s.executeQuery("SELECT * FROM user");
            
            while (r.next()) {
                Usuario p = new Usuario();
                p.setId(r.getInt("id"));
                p.setNome(r.getString("name"));
                p.setEmail(r.getString("email"));
                p.setSenha(r.getString("password"));
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
    
    public boolean addUser(String nome, String email, String senha) { //SOMENTE E-MAIL QUE NAO ESTEJA CADASTRADO
        try {
            Class.forName("org.postgresql.Driver");
            Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/looksup", "postgres", "debora123");
            
            String query = "INSERT INTO \"user\" (name , email, password) VALUES (?, ?, ?)";
            PreparedStatement pstmt = c.prepareStatement(query);

            pstmt.setString(1, nome);
            pstmt.setString(2, email);
            pstmt.setString(3, senha);
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
       
    public Usuario getUserByEmail(String email){
        Usuario p = new Usuario();
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/looksup", "postgres", "debora123");
            
            String query = "SELECT * FROM \"user\" WHERE email = ?";
            PreparedStatement pstmt = c.prepareStatement(query);
            
            pstmt.setString(1, email);
            System.out.println(query);//sasasasasasasdasdasdasdasdasdasd
            ResultSet r = pstmt.executeQuery();
            
            while(r.next()){
                p.setId(r.getInt("id"));
                p.setNome(r.getString("name"));
                p.setEmail(r.getString("email"));
                p.setSenha(r.getString("password"));
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
    
    
    
}
