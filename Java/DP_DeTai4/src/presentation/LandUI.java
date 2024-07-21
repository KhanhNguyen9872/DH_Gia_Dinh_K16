package presentation;

import java.awt.event.ActionListener;
import java.util.List;
import java.awt.Insets;
import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

import domain.LandService;
import domain.model.Land;

public class LandUI extends JFrame {
    private LandService landService = null;

    private LandUIController uiController = null;
    private JMenuBar jMenuBar = null;
    private DefaultTableModel tableModel = null;
    private JTable landTable = null;
    private JButton addButton, updateButton, deleteButton, findButton, searchButton;
    private JLabel labelMaGiaoDich, labelNgayGiaoDich, labelDonGia, labelLoaiDat, labelDienTich, labelSearch;
    private JTextField textMaGiaoDich, textNgayGiaoDich, textDonGia, textLoaiDat, textDienTich, textSearch;

    public LandUI(LandService landService) {
        this.landService = landService;
        this.uiController = new LandUIController();

        this.buildMenuBar();
        this.buildPanel();

        setSize(640, 480);
        setTitle("Quản lý đất");
        setJMenuBar(this.jMenuBar);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        reloadTable();
    }

    public void buildMenuBar() {
        this.jMenuBar = new JMenuBar();
        JMenu jMenu = new JMenu("Hệ thống");
        JMenuItem jMenuItemClose = new JMenuItem("Đóng");

        jMenuItemClose.addActionListener(this.uiController);

        jMenu.add(jMenuItemClose);
        this.jMenuBar.add(jMenu);
    }

    public void buildPanel() {
        // Initialize label, textfield, button
        this.labelMaGiaoDich = new JLabel("Mã giao dịch: ");
        this.labelNgayGiaoDich = new JLabel("Ngày giao dịch: ");
        this.labelDonGia = new JLabel("Đơn giá: ");
        this.labelLoaiDat = new JLabel("Loại đất: ");
        this.labelDienTich = new JLabel("Diện tích: ");
        this.labelSearch = new JLabel("Tìm kiếm: ");

        this.textMaGiaoDich = new JTextField(10);
        this.textNgayGiaoDich = new JTextField(15);
        this.textDonGia = new JTextField(10);
        this.textLoaiDat = new JTextField(10);
        this.textDienTich = new JTextField(10);
        this.textSearch = new JTextField(20);

        this.addButton = new JButton("Thêm");
        this.updateButton = new JButton("Sửa");
        this.deleteButton = new JButton("Xóa");
        this.findButton = new JButton("Tìm theo ID");
        this.searchButton = new JButton("Tìm");

        // Initialize table
        String[] columnNames = { "MaGiaoDich", "NgayGiaoDich", "DonGia", "LoaiDat", "DienTich" };
        tableModel = new DefaultTableModel(columnNames, 0);
        landTable = new JTable(tableModel);

        // add ActionListener
        this.addButton.addActionListener(this.uiController);
        this.updateButton.addActionListener(this.uiController);
        this.deleteButton.addActionListener(this.uiController);
        this.searchButton.addActionListener(this.uiController);

        //
        JPanel inputPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.insets = new Insets(5, 5, 5, 5);
        inputPanel.add(this.labelMaGiaoDich, gbc);
        gbc.gridx++;
        inputPanel.add(this.textMaGiaoDich, gbc);
        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(this.labelNgayGiaoDich, gbc);
        gbc.gridx++;
        inputPanel.add(this.textNgayGiaoDich, gbc);
        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(this.labelDonGia, gbc);
        gbc.gridx++;
        inputPanel.add(this.textDonGia, gbc);
        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(this.labelLoaiDat, gbc);
        gbc.gridx++;
        inputPanel.add(this.textLoaiDat, gbc);
        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(this.labelDienTich, gbc);
        gbc.gridx++;
        inputPanel.add(this.textDienTich, gbc);

        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(this.labelSearch, gbc);
        gbc.gridx++;
        inputPanel.add(this.textSearch, gbc);

        // find


        // button Panel
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(this.addButton);
        buttonPanel.add(this.updateButton);
        buttonPanel.add(this.deleteButton);
        buttonPanel.add(this.findButton);
        buttonPanel.add(this.searchButton);
        

        JPanel mainPanel = new JPanel(new BorderLayout());
        mainPanel.add(new JScrollPane(this.landTable), BorderLayout.CENTER);
        mainPanel.add(inputPanel, BorderLayout.NORTH);
        //search
       // mainPanel.add(searchPanel);
        mainPanel.add(buttonPanel, BorderLayout.SOUTH);
        
        this.add(mainPanel);
    }

    public void reloadTable() {
        tableModel.setRowCount(0); // clear table

        List<Land> lands = this.landService.getAllLands();
        for(Land land : lands) {
            Object[] row = { land.getMaGiaoDich(), land.getNgayGiaoDich(), land.getDonGia(), land.getLoaiDat(), land.getDienTich() };
            tableModel.addRow(row);
        }
    }

    public void clearInput() {
        this.textMaGiaoDich.setText("");
        this.textNgayGiaoDich.setText("");
        this.textDonGia.setText("");
        this.textLoaiDat.setText("");
        this.textDienTich.setText("");
    }

    public void addLand() {
        try {
            // Get data from input
            int maGiaoDich = Integer.parseInt(this.textMaGiaoDich.getText());
            String ngayGiaoDich = this.textNgayGiaoDich.getText();
            int donGia = Integer.parseInt(this.textDonGia.getText());
            String loaiDat = this.textLoaiDat.getText();
            double dienTich = Double.parseDouble(this.textDienTich.getText());

            // add new house
            this.landService.addLand(new Land(maGiaoDich, ngayGiaoDich, donGia, loaiDat, dienTich));

            // Clear input
            this.clearInput();
            
            reloadTable();
        } catch (NumberFormatException ex) {
            // can't parse to int
            JOptionPane.showMessageDialog(this, "Dữ liệu không hợp lệ!");
        }
    }

    public void updateLand() {

    }

    public void deleteLand() {
        int index = this.landTable.getSelectedRow();

        if (index == -1) {
            JOptionPane.showMessageDialog(this, "Bạn chưa chọn dòng dữ liệu nào!");
        } else {
            int maGiaoDich = (int)(this.landTable.getValueAt(index, 0));
            this.landService.deleteLand(maGiaoDich);
            this.reloadTable();
            this.clearInput();
        }
    }

    public void searchLand() {

    }

    public void Show() {
        setVisible(true);
    }

    public void Hide() {
        setVisible(false);
    }

    public void Close() {
        dispose();
    }

    class LandUIController implements ActionListener {
        public LandUIController() {

        }

        @Override
        public void actionPerformed(java.awt.event.ActionEvent e) {
            String cmd = e.getActionCommand();
            if (cmd.equals("Thêm")) {
                addLand();
            } else if (cmd.equals("Sửa")) {
                updateLand();
            } else if (cmd.equals("Xóa")) {
                deleteLand();
            } else if (cmd.equals("Tìm theo Mã")) {
                
            } else if (cmd.equals("Tìm")) {
                searchLand();
            } else if (cmd.equals("Đóng")) {
                Close();
            }
        }
    }
}
