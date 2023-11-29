package model;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

/**
 *
 * @author Bruno Lucas, Jhonatan Nascimento, Maikon Sposito
 */
public class Vendas {

    // Atributos
    private int id;
    private LocalDate data_venda;
    private String formaPagamento;
    private Double troco;
    private double valorTotal;

    // Construtor com parâmetros
    public Vendas(int id, Date data_venda) {
        this.id = id;
        this.data_venda = data_venda.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    // Construtor padrão
    public Vendas() {
        
    }

    // Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public Double getTroco() {
        return troco;
    }

    public void setTroco(Double troco) {
        this.troco = troco;
    }
    
    

    public LocalDate getDataVenda() {
        return this.data_venda;
    }

    public void setDataVenda(LocalDate data_venda) {
        this.data_venda = data_venda;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }
}
