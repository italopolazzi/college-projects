package TrabalhoPraticoII.Biblioteca;

import java.util.Date;

public class Cliente extends Pessoa {
    
    final private int numMaxDeEmprestimos;
    private Emprestimo[] emprestimos;
    
    public Cliente(String nome, String sobrenome, int idade) {
        super(nome, sobrenome, idade);
        this.numMaxDeEmprestimos = 4;
    }

    void registrarEmprestimo(Exemplar[] exemplares) throws Exception {
        if(exemplares.length <= numMaxDeEmprestimos){
            Emprestimo[] em = new Emprestimo[1];
            try {

                Date d = new Date(System.currentTimeMillis());

                for(int i = 0; i < em.length; i++){
                    for (Exemplar exemplar : exemplares) {
                        em[i] = new Emprestimo(exemplar, String.valueOf(d));
                    }
                }

                this.emprestimos = em;

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } else
            throw new Exception("Você não pode pegar mais do que " 
                    + String.valueOf(numMaxDeEmprestimos) + " livros.");
    }
}
