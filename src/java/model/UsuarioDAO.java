/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class UsuarioDAO {
    
    public List<Usuario> getAll() {
        List<Usuario> resultado = new ArrayList<Usuario>();
        try {
            Class.forName("org.postgresql.Driver");
            Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/looksupbd", "postgres", "debora123");
            
            Statement s = c.createStatement();
            ResultSet r = s.executeQuery("SELECT * FROM pessoa");
            
            while (r.next()) {
                Usuario p = new Usuario();
                p.setId(r.getInt("id"));
                p.setNome(r.getString("nome"));
                p.setEmail(r.getString("email"));
                p.setSenha(r.getString("senha"));
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
