package TrabalhoPraticoII.Biblioteca;

public class Emprestimo {

    private String dataDoEmprestimo;
    private Exemplar exemplar;
    
    public Emprestimo(Exemplar exemplar, String dataDoEmprestimo) throws Exception {
        if(exemplar.getNumDeExemplaresDisponiveis() > 0){
            this.exemplar = exemplar;
            exemplar.setNumDeExemplaresDisponiveis(exemplar.getNumDeExemplaresDisponiveis() - 1);
            this.dataDoEmprestimo = dataDoEmprestimo;
        } else
            throw new Exception("Impossível registrar o emprestimo." + 
            "Não há exemplares de \"" + exemplar.getTituloDoLivro() + "\" disponíveis.");
    }
    
    public String getDataDoEmprestimo() {
        return dataDoEmprestimo;
    }

    public Exemplar getExemplar() {
        return exemplar;
    }
}