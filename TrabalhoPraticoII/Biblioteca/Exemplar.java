package TrabalhoPraticoII.Biblioteca;

import java.util.ArrayList;

public class Exemplar extends Obra {
    
    public Exemplar(int id, String tituloDoLivro, String dataDePublicacao, int numDePaginas, ArrayList<Autor> autores) throws Exception {
        if(!(autores.size() > 5)){
            this.id = id;
            this.numDeAutores = autores.size();
            this.tituloDoLivro = tituloDoLivro;
            this.dataDePublicacao = dataDePublicacao;
            this.numDePaginas = numDePaginas;
            this.autores = autores;
        } else
            throw new Exception("Número de autores não pode ultrapassar cinco.");
    }
    
    @Override
    public String getTituloDoLivro() {
        return tituloDoLivro;
    }

    @Override
    public String getDataDePublicacao() {
        return dataDePublicacao;
    }

    @Override
    public int getNumDePaginas() {
        return numDePaginas;
    }

    @Override
    public ArrayList<Autor> getAutores() {
        return autores;
    }

    @Override
    public int getNumDeAutores() {
        return numDeAutores;
    }

    @Override
    public int getNumDeExemplaresDisponiveis() {
        return numDeExemplaresDisponiveis;
    }

    @Override
    public void setNumDeExemplaresDisponiveis(int numDeExemplares) {
        numDeExemplaresDisponiveis = numDeExemplares;
    }

    @Override
    public int getId() {
        return id;
    }
}