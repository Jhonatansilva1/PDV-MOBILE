/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;
import util.ConectaDB;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Vendas;

/**
 *
 * @author Bruno Oliveira
 */
public class VendasDAO {

// Método para adicionar uma venda ao banco de dados
    public int adicionarVenda(String dataVenda, double totalCupom, String formaPagamento, double troco) {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int idVenda = -1; // Inicializa o idVenda como -1, indicando que não foi obtido com sucesso

        try {
            conexao = ConectaDB.conectar();
            String sql = "INSERT INTO vendas (data_venda, total_venda, formaPagamento, troco) VALUES (?, ?, ?, ?)";
            ps = conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, dataVenda);
            ps.setDouble(2, totalCupom);
            ps.setString(3, formaPagamento);
            ps.setDouble(4, troco);

            // Execute a atualização do banco de dados
            ps.executeUpdate();

            // Obtém o ID gerado para a venda
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                idVenda = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace(); // Logar a exceção para diagnóstico
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
                e.printStackTrace(); // Logar a exceção para diagnóstico
            }
        }

        return idVenda;
    }

    public int adicionarDetalheCompra(int numeroCupom, String descricaoDetalhe, double quantidadeDetalhe, double precoUnitarioDetalhe, double subtotalDetalhe) {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int idDetalheCompra = -1; // Valor padrão indicando falha

        try {
            conexao = ConectaDB.conectar();
            String sql = "INSERT INTO detalhes_compra (numeroCupom, descricao, quantidade, preco_unitario, subtotal) VALUES (?, ?, ?, ?, ?)";
            ps = conexao.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, numeroCupom);
            ps.setString(2, descricaoDetalhe);
            ps.setDouble(3, quantidadeDetalhe);
            ps.setDouble(4, precoUnitarioDetalhe);
            ps.setDouble(5, subtotalDetalhe);

            // Execute a atualização do banco de dados
            ps.executeUpdate();

            // Recupera o ID gerado pela inserção
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                idDetalheCompra = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace(); // Logar a exceção para diagnóstico
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
                e.printStackTrace(); // Logar a exceção para diagnóstico
            }
        }

        return idDetalheCompra;
    }

    public List<Vendas> consultarVendasPorPeriodo(LocalDate dataInicial, LocalDate dataFinal) {
        List<Vendas> vendas = new ArrayList<>();

        try (Connection conexao = ConectaDB.conectar(); PreparedStatement pstmt = conexao.prepareStatement(
                "SELECT id, data_venda, total_venda FROM vendas WHERE data_venda BETWEEN ? AND ? ORDER BY data_venda")) {

            pstmt.setDate(1, java.sql.Date.valueOf(dataInicial));
            pstmt.setDate(2, java.sql.Date.valueOf(dataFinal));

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Vendas venda = new Vendas();
                    venda.setId(rs.getInt("id"));
                    venda.setDataVenda(rs.getDate("data_venda").toLocalDate());
                    venda.setValorTotal(rs.getDouble("total_venda"));

                    vendas.add(venda);
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }

        return vendas;
    }

}
