package presentation;

import java.awt.event.*;

import javax.swing.BorderFactory;
import javax.swing.BoxLayout;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class MainUI extends JFrame {
    private HouseUI houseUI = null;
    private LandUI landUI = null;

    private UIController uiController = null;
    private JPanel jPanel = null;
    private JMenuBar jMenuBar = null;

    public MainUI(HouseUI houseUI, LandUI landUI) {
        uiController = new UIController();
        this.houseUI = houseUI;
        this.landUI = landUI;

        buildMenuBar();
        buildPanel();
        setSize(320, 240);
        setTitle("DP_DeTai4");
        setJMenuBar(this.jMenuBar);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
    }

    public void buildPanel() {
        this.jPanel = new JPanel();
        this.jPanel.setLayout(new BoxLayout(this.jPanel, BoxLayout.Y_AXIS));
        this.jPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        this.jPanel.add(new JLabel(" "));
        this.jPanel.add(new JLabel("- Đề tài: Quản lý danh sách các giao dịch nhà đất"));
        this.jPanel.add(new JLabel(" "));
        this.jPanel.add(new JLabel("- Nhóm 0: "));
        this.jPanel.add(new JLabel("    1. Nguyễn Văn Khánh (NT)"));
        this.jPanel.add(new JLabel("    2. Lê Lâm Chiến Thắng"));
        this.jPanel.add(new JLabel("    3. Vũ Đức Thịnh"));
        this.add(jPanel);
    }

    public void buildMenuBar() {
        this.jMenuBar = new JMenuBar();
        JMenu jMenu = new JMenu("Quản lý");
        JMenuItem jMenuItemHouse = new JMenuItem("Nhà");
        JMenuItem jMenuItemLand = new JMenuItem("Đất");
        
        jMenuItemHouse.addActionListener(uiController);
        jMenuItemLand.addActionListener(uiController);

        jMenu.add(jMenuItemHouse);
        jMenu.add(jMenuItemLand);
        this.jMenuBar.add(jMenu);
    }

    public void Show() {
        setVisible(true);
    }

    public void Hide() {
        setVisible(false);
    }

    class UIController implements ActionListener {

        public UIController() {

        }

        @Override
        public void actionPerformed(ActionEvent e) {
            String cmd = e.getActionCommand();
            if (cmd.equals("Nhà")) {
                if (!houseUI.isVisible()) {
                    houseUI.Show();
                } else {
                    JOptionPane.showMessageDialog(new JFrame(),
                        "Quản lý nhà đã xuất hiện từ trước",
                        "Lỗi",
                        JOptionPane.INFORMATION_MESSAGE
                    );
                }
            } else if (cmd.equals("Đất")) {
                if (!landUI.isVisible()) {
                    landUI.Show();
                } else {
                    JOptionPane.showMessageDialog(new JFrame(),
                        "Quản lý đất đã xuất hiện từ trước",
                        "Lỗi",
                        JOptionPane.INFORMATION_MESSAGE
                    );
                }
            }
        }
    }
}
