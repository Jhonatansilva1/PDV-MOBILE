package model;

/**
 *
 * @author Bruno Lucas, Jhonatan Nascimento, Maikon Sposito
 */
public class Cliente {

    private int id_Nome;
    private String nome;
    private String rg;
    private String cpf;
    private String email;
    private String telefone;
    private String celular;
    private Endereco endereco;

    public Cliente() {
        this.nome = "";
        this.cpf = "";
        this.telefone = "";
        this.endereco = new Endereco();
    }

    public Cliente(String nome, String cpf, String telefone, Endereco endereco) {
        this.nome = nome;
        this.cpf = cpf;
        this.telefone = telefone;
        this.endereco = endereco;
    }

    public int getId_Nome() {
        return id_Nome;
    }

    public void setId_Nome(int id_Nome) {
        this.id_Nome = id_Nome;
    }

    
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public String getEnderecoCep() {
        return this.endereco.getCep();
    }

    public String getEnderecoComplemento() {
        return this.endereco.getComplemento();
    }

    public String getEnderecoRua() {
        return this.endereco.getRua();
    }

    public String getEnderecoNumero() {
        return this.endereco.getNumero();
    }

    public String getEnderecoBairro() {
        return this.endereco.getBairro();
    }

    public String getEnderecoCidade() {
        return this.endereco.getCidade();
    }

    public String getEnderecoUf() {
        return this.endereco.getUf();
    }

    public void setEnderecoCep(String cep) {
        this.endereco.setCep(cep);
    }

    public void setEnderecoComplemento(String complemento) {
        this.endereco.setComplemento(complemento);
    }

    public void setEnderecoRua(String rua) {
        this.endereco.setRua(rua);
    }

    public void setEnderecoNumero(String numero) {
        this.endereco.setNumero(numero);
    }

    public void setEnderecoBairro(String bairro) {
        this.endereco.setBairro(bairro);
    }

    public void setEnderecoCidade(String cidade) {
        this.endereco.setCidade(cidade);
    }

    public void setEnderecoUf(String uf) {
        this.endereco.setUf(uf);
    }
}
