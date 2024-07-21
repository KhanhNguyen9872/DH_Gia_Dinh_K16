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

    private MainUIController uiController = null;
    private JPanel jPanel = null;
    private JMenuBar jMenuBar = null;

    public MainUI(HouseUI houseUI, LandUI landUI) {
        uiController = new MainUIController();
        this.houseUI = houseUI;
        this.landUI = landUI;

        buildMenuBar();
        buildPanel();
        setSize(320, 240);
        setTitle("DP_DeTai4");
        setJMenuBar(this.jMenuBar);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setVisible(true);
    }

    public void buildPanel() {
        this.jPanel = new JPanel();
        this.jPanel.setLayout(new BoxLayout(this.jPanel, BoxLayout.Y_AXIS));
        this.jPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        this.jPanel.add(new JLabel(" "));
        this.jPanel.add(new JLabel("- Đề tài: Quản lý danh sách các giao dịch nhà đất"));
        this.jPanel.add(new JLabel(" "));
        this.jPanel.add(new JLabel("- Nhóm 5: "));
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

    class MainUIController implements ActionListener {

        public MainUIController() {

        }

        @Override
        public void actionPerformed(ActionEvent e) {
            String cmd = e.getActionCommand();
            if (cmd.equals("Nhà")) {
                if (!houseUI.isVisible()) {
                    houseUI.setVisible(true);
                } else {
                    JOptionPane.showMessageDialog(new JFrame(),
                        "Quản lý nhà đã xuất hiện từ trước",
                        "Lỗi",
                        JOptionPane.INFORMATION_MESSAGE
                    );
                }
            } else if (cmd.equals("Đất")) {
                if (!landUI.isVisible()) {
                    landUI.setVisible(true);
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
