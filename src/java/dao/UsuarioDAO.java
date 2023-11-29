/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Usuario;
import java.sql.*;
import java.util.concurrent.locks.StampedLock;
import util.ConectaDB;

/**
 *
 * @author Bruno Oliveira
 */
public class UsuarioDAO {
        // Métodos
    public Usuario consultar(Usuario usuario) throws ClassNotFoundException{        
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * from usuario WHERE login = '" + usuario.getLogin() + "' and senha = '" + usuario.getSenha() + "'";
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return usuario;
            }
        } catch(SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }         
    }
}
