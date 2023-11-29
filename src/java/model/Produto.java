package model;

/**
 *
 * @author Bruno Lucas, Jhonatan Nascimento, Maikon Sposito
 */
public class Produto {
    //Atributos
    private int codigo;
    private long codigoean;
    private String descricao;
    private double preco;
    private int qtd_estoque;
   
    
    //Getters e Setters
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public long getCodigoean() {
        return codigoean;
    }

    public void setCodigoean(long codigoean) {
        this.codigoean = codigoean;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getQtd_estoque() {
        return qtd_estoque;
    }

    public void setQtd_estoque(int qtd_estoque) {
        this.qtd_estoque = qtd_estoque;
    }

    
}
