package TrabalhoPraticoII.Biblioteca;

import javax.swing.DefaultListModel;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

public class Util {
    public static void addNovaAba(JTabbedPane painelDeAbas, JPanel painel, String titulo) {
        painelDeAbas.addTab(titulo, painel);
        int index = painelDeAbas.indexOfTab(titulo);
        painelDeAbas.setSelectedIndex(index);
    }
    public static JFrame addJanelaTemp(String titulo, int largura, int altura, boolean visibilidade) {
        JFrame jan = new JFrame();
        jan.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        jan.setTitle(titulo);
        jan.setSize(largura, altura);
        jan.setVisible(visibilidade);
        return jan;
    }
    public static void addAoModeloDeLista(DefaultListModel model, int id, String t1) {
        model.add(model.getSize(), String.valueOf(id) + " - " +  t1);
    }
    public static void addAoModeloDeLista(DefaultListModel model, int id, String t1, String t2) {
        model.add(model.getSize(), String.valueOf(id) + " - " +  t1 + " " + t2);
    }
}
