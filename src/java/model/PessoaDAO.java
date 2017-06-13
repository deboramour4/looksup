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
 * @author leoomoreira
 */
public class PessoaDAO {
    
    public List<Pessoa> getAll() {
        List<Pessoa> resultado = new ArrayList<Pessoa>();
        try {
            Class.forName("org.postgresql.Driver");
            Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/pessoabd", "postgres", "ufc123");
            
            Statement s = c.createStatement();
            ResultSet r = s.executeQuery("SELECT * FROM pessoa");
            
            while (r.next()) {
                Pessoa p = new Pessoa();
                p.setCodigo(r.getInt("codigo"));
                p.setNome(r.getString("nome"));
                p.setLogin(r.getString("login"));
                p.setSenha(r.getString("senha"));
                resultado.add(p);
            }
            
            r.close();
            s.close();
            c.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PessoaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PessoaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultado;
    }
    
}
