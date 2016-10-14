package TrabalhoPraticoII.Biblioteca;

public class Pessoa {

    private String nome, sobrenome;
    private int idade;

    public Pessoa(String nome, String sobrenome, int idade) {
        if (!nome.equals("") && !sobrenome.equals("")) {
            this.nome = nome;
            this.sobrenome = sobrenome;
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
}
