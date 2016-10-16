package TrabalhoPraticoII.Biblioteca;

import java.util.ArrayList;
import java.util.Date;

public class Cliente extends Pessoa {
    
    final private int numMaxDeEmprestimos;
    private ArrayList<Emprestimo> emprestimos;
    
    public Cliente(int id, String nome, String sobrenome, int idade) {
        super(id, nome, sobrenome, idade);
        this.numMaxDeEmprestimos = 4;
    }

    void registrarEmprestimo(ArrayList<Exemplar> exemplares) throws Exception {
        if(exemplares.size() <= numMaxDeEmprestimos){
            try {
                Date d = new Date(System.currentTimeMillis());
                for(int i = 0; i < emprestimos.size(); i++){
                    for (Exemplar exemplar : exemplares) {
                        this.emprestimos.add(new Emprestimo(exemplar, String.valueOf(d)));
                    }
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } else
            throw new Exception("Você não pode pegar mais do que " 
                    + String.valueOf(numMaxDeEmprestimos) + " livros.");
    }
    
    public int getNumMaxDeEmprestimos() {
        return numMaxDeEmprestimos;
    }
    
    public ArrayList<Emprestimo> getEmprestimos() {
        return emprestimos;
    }
    
    public void setEmprestimos(ArrayList<Emprestimo> emprestimos) {
        this.emprestimos = emprestimos;
    }
}
