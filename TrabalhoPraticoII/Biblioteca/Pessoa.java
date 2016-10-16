package TrabalhoPraticoII.Biblioteca;

public class Pessoa {

    private String nome, sobrenome;
    private int idade, id;

    public Pessoa(int id, String nome, String sobrenome, int idade) {
        if (!nome.equals("") && !sobrenome.equals("")) {
            this.nome = nome;
            this.sobrenome = sobrenome;
            this.id = id;
        }
        if (idade > 0 && idade < 120) {
            this.idade = idade;
        }
    }

    public String getNome() {
        return nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public int getIdade() {
        return idade;
    }
    
    public void setNome(String nome){
        this.nome = nome;
    }
    
    public void setSobrenome(String sobrenome){
        this.sobrenome = sobrenome;
    }
    
    public void setIdade(int idade){
        this.idade = idade;
    }  
    
    public int getId() {
        return id;
    }
}
