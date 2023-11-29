/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;
import model.Usuario;
import dao.UsuarioDAO;

/**
 *
 * @author Bruno Oliveira
 */
public class ControleUsuario {
        // Métodos
    public boolean logar(String login, String senha) throws ClassNotFoundException{
        Usuario usuario = new Usuario();
        usuario.setLogin(login);
        usuario.setSenha(senha);
        
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        if (usuarioDAO.consultar(usuario)==null){
            return false;
        }else{
            return true;
        }        
    }   
}
