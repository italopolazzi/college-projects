package TrabalhoPraticoII.Biblioteca;

import java.util.ArrayList;

public class Editora {

    private String nomeDaEditora;
    private ArrayList<Obra> obras;
    
    public Editora(String nomeDaEditora) throws Exception {
        if(nomeDaEditora.equals(""))
            throw new Exception("Uma editora obrigatoriamente deve possuir um nome. " +
                    "Um nome não pode ser vazio.");
        else {
            this.nomeDaEditora = nomeDaEditora;
        }
    }
    
    public String getNomeDaEditora() {
        return nomeDaEditora;
    }

    public ArrayList<Obra> getObras() {
        return obras;
    }

    public void addObras(ArrayList<Obra> obras) {
        for(Obra o : obras){
            this.obras.add(o);
        }
    }    
}
