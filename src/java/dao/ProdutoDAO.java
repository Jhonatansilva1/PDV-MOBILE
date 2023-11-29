/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import model.Cliente;
import model.Produto;
import util.ConectaDB;

/**
 *
 * @author Bruno Oliveira
 */
public class ProdutoDAO {

    // método para cadastro de produtos inserindo na tabela produto
    public boolean cadastrarProduto(Produto produto) {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "INSERT into produto(codigoean, descricao, preco, qtd_estoque) "
                    + "values('" + produto.getCodigoean() + "','" + produto.getDescricao() + "','"
                    + produto.getPreco() + "','" + produto.getQtd_estoque() + "')";

            stmt.executeUpdate(sql);
            System.out.println("Registro Inserido!");
            conexao.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Exception ao cadastrar produto:");
            ex.printStackTrace(); // Imprime a pilha de exceções
            return false;
        }
    }

    //Método para consulta geral dos produtos na tabela
    public List consultarGeralProduto() {
        Connection conexao = null;

        List listaProdutos = new ArrayList<>();

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * from produto";
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                Produto produto = new Produto();

                produto.setCodigo(rs.getInt("codigo"));
                produto.setCodigoean(rs.getLong("codigoean"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getDouble("preco"));
                produto.setQtd_estoque(rs.getInt("qtd_estoque"));

                listaProdutos.add(produto);

                n_reg++;
            }
            conexao.close();

            if (n_reg == 0) {
                return null;
            } else {
                return listaProdutos;
            }

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }

    public Produto consultarCodigoEAN(Produto produto) {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM produto WHERE codigoean = " + produto.getCodigoean();
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                produto.setCodigo(rs.getInt("codigo"));
                produto.setCodigoean(rs.getLong("codigoean"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getDouble("preco"));
                produto.setQtd_estoque(rs.getInt("qtd_estoque"));
                n_reg++;
            }
            conexao.close();

            if (n_reg == 0) {
                return null;
            } else {
                return produto;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Exception: " + ex.toString());
            return null;
        }
    }

    //Método para excluir o produto pelo seu id (codigo)
    public boolean excluirProduto(Produto produto) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            String sql = "DELETE FROM produto WHERE codigo = '" + produto.getCodigo() + "'";

            stmt.executeUpdate(sql);
            System.out.println(" Registro Excluído! ");
            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Erro: " + ex.toString());
            return false;
        }
    }

    //Método para buscar o produto pela sua descrição
    public List<Produto> buscarPorDescricao(String descricao) {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Produto> resultados = new ArrayList<>();

        try {
            conexao = ConectaDB.conectar();
            String sql = "SELECT * FROM produto WHERE LOWER(descricao) LIKE ?";
            ps = conexao.prepareStatement(sql);
            ps.setString(1, "%" + descricao.toLowerCase() + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                Produto produto = new Produto();
                produto.setCodigo(rs.getInt("codigo"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getDouble("preco"));
                produto.setQtd_estoque(rs.getInt("qtd_estoque"));
                // Adicione outros atributos conforme necessário...

                resultados.add(produto);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();  // Logar a exceção para diagnóstico
        } finally {
            // Fechar recursos
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conexao != null) {
                    conexao.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();  // Logar a exceção para diagnóstico
            }
        }

        return resultados;
    }

    public boolean alterarProduto(Produto produto) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            String sql = "UPDATE produto SET "
                    + "descricao='" + produto.getDescricao() + "', "
                    + "preco=" + produto.getPreco() + ", "
                    + "qtd_estoque=" + produto.getQtd_estoque() + " "
                    + "WHERE codigoean = " + produto.getCodigoean();

            stmt.executeUpdate(sql);
            System.out.println("Registro Alterado com sucesso!");
            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Erro: " + ex.toString());
            return false;
        }
    }

// Método para atualizar o estoque do produto
    public void atualizarEstoque(String codigoProduto, int quantidade) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            // Obtendo a conexão usando o ConectaDB
            ConectaDB conectaDB = new ConectaDB();
            conexao = ConectaDB.conectar();

            // Query SQL para atualizar o estoque
            String sql = "UPDATE produto SET qtd_estoque = qtd_estoque - ? WHERE codigo = ?";

            // Preparar a declaração SQL
            try (PreparedStatement statement = conexao.prepareStatement(sql)) {
                // Atribuir valores aos parâmetros
                statement.setInt(1, quantidade);
                statement.setString(2, codigoProduto);

                // Executar a atualização
                int linhasAfetadas = statement.executeUpdate();

                // Adicione um log para verificar as linhas afetadas
                System.out.println("Linhas afetadas ao atualizar estoque: " + linhasAfetadas);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Certifique-se de fechar a conexão, se necessário
            if (conexao != null) {
                try {
                    conexao.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
