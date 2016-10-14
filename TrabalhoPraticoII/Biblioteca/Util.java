package TrabalhoPraticoII.Biblioteca;

import javax.swing.JPanel;
import javax.swing.JTabbedPane;

public class Util {
    public static void addNovaAba(JTabbedPane painelDeAbas, JPanel painel, String titulo) {
        painelDeAbas.addTab(titulo, painel);
        int index = painelDeAbas.indexOfTab(titulo);
        painelDeAbas.setSelectedIndex(index);
    }
}
