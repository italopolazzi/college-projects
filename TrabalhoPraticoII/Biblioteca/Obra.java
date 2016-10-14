package TrabalhoPraticoII.Biblioteca;

import java.util.ArrayList;

public abstract class Obra {

    protected String tituloDoLivro, dataDePublicacao;
    protected int numDePaginas, numDeAutores, numDeExemplaresDisponiveis;
    protected ArrayList<Autor> autores;

    abstract public String getTituloDoLivro();
    abstract public String getDataDePublicacao();

    abstract public int getNumDeExemplaresDisponiveis();
    abstract public void setNumDeExemplaresDisponiveis(int numDeExemplares);

    abstract public int getNumDePaginas();

    abstract public ArrayList<Autor> getAutores();
    abstract public int getNumDeAutores();
}