package TrabalhoPraticoII.Biblioteca;

import java.util.ArrayList;

public class Identificadores {

    private static ArrayList<String> ids = new ArrayList<>();
    private static int ultimoId = 0;
    int k = 0;

    public Identificadores() {
        gerarMaisIds();
    }

    private void gerarMaisIds() {
        int ini, fim, i;

        ini = ultimoId;
        fim = ultimoId + 10;
        ultimoId = fim;

        for (i = ini; i < fim; i++) {
            ids.add(String.valueOf(i));
        }
    }

    public int solicitarId() {
        String removido;

        if (ids.isEmpty()) {
            gerarMaisIds();
        }

        removido = ids.get(0);
        ids.remove(removido);

        System.out.println("Id gerado: " + String.valueOf(removido));

        return Integer.parseInt(removido);
    }
}
