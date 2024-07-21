package presentation;

import java.awt.Insets;
import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

import domain.model.House;
import domain.HouseService;

public class HouseUI extends JFrame {
    private HouseService houseService = null;

    private HouseUIController uiController = null;
    private JMenuBar jMenuBar = null;
    private DefaultTableModel tableModel = null;
    private JTable houseTable = null;
    private JButton addButton, updateButton, deleteButton, findButton, searchButton;
    private JLabel labelMaGiaoDich, labelNgayGiaoDich, labelDonGia, labelLoaiNha, labelDiaChi, labelDienTich, labelSearch;
    private JTextField textMaGiaoDich, textNgayGiaoDich, textDonGia, textLoaiNha, textDiaChi, textDienTich, textSearch;

    public HouseUI(HouseService houseService) {
        this.houseService = houseService;
        this.uiController = new HouseUIController();
        this.buildMenuBar();
        this.buildPanel();

        setSize(640, 480);
        setTitle("Quản lý nhà");
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
        this.labelLoaiNha = new JLabel("Loại nhà: ");
        this.labelDiaChi = new JLabel("Địa chỉ: ");
        this.labelDienTich = new JLabel("Diện tích: ");
        this.labelSearch = new JLabel("Tìm kiếm: ");

        this.textMaGiaoDich = new JTextField(10);
        this.textNgayGiaoDich = new JTextField(15);
        this.textDonGia = new JTextField(10);
        this.textLoaiNha = new JTextField(10);
        this.textDiaChi = new JTextField(20);
        this.textDienTich = new JTextField(10);
        this.textSearch = new JTextField(20);

        this.addButton = new JButton("Thêm");
        this.updateButton = new JButton("Sửa");
        this.deleteButton = new JButton("Xóa");
        this.findButton = new JButton("Tìm theo ID");
        this.searchButton = new JButton("Tìm");

        // Initialize table
        String[] columnNames = { "MaGiaoDich", "NgayGiaoDich", "DonGia", "LoaiNha", "DiaChi", "DienTich" };
        tableModel = new DefaultTableModel(columnNames, 0);
        houseTable = new JTable(tableModel);

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
        inputPanel.add(this.labelLoaiNha, gbc);
        gbc.gridx++;
        inputPanel.add(this.textLoaiNha, gbc);
        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(this.labelDiaChi, gbc);
        gbc.gridx++;
        inputPanel.add(this.textDiaChi, gbc);
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
        mainPanel.add(new JScrollPane(this.houseTable), BorderLayout.CENTER);
        mainPanel.add(inputPanel, BorderLayout.NORTH);
        mainPanel.add(buttonPanel, BorderLayout.SOUTH);
        
        this.add(mainPanel);
    }

    public void reloadTable() {
        tableModel.setRowCount(0); // clear table

        List<House> houses = this.houseService.getAllHouses();
        for(House house : houses) {
            Object[] row = { house.getMaGiaoDich(), house.getNgayGiaoDich(), house.getDonGia(), house.getLoaiNha(), house.getDiaChi(), house.getDienTich() };
            tableModel.addRow(row);
        }
    }

    public void clearInput() {
        this.textMaGiaoDich.setText("");
        this.textNgayGiaoDich.setText("");
        this.textDonGia.setText("");
        this.textLoaiNha.setText("");
        this.textDiaChi.setText("");
        this.textDienTich.setText("");
    }

    public void addHouse() {
        try {
            // Get data from input
            int maGiaoDich = Integer.parseInt(this.textMaGiaoDich.getText());
            String ngayGiaoDich = this.textNgayGiaoDich.getText();
            int donGia = Integer.parseInt(this.textDonGia.getText());
            String loaiNha = this.textLoaiNha.getText();
            String diaChi = this.textDiaChi.getText();
            double dienTich = Double.parseDouble(this.textDienTich.getText());

            // add new house
            this.houseService.addHouse(new House(maGiaoDich, ngayGiaoDich, donGia, loaiNha, diaChi, dienTich));

            // Clear input
            this.clearInput();
            
            reloadTable();
        } catch (NumberFormatException ex) {
            // can't parse to int
            JOptionPane.showMessageDialog(this, "Dữ liệu không hợp lệ!");
        }
    }

    public void updateHouse() {

    }

    public void deleteHouse() {
        int index = this.houseTable.getSelectedRow();

        if (index == -1) {
            JOptionPane.showMessageDialog(this, "Bạn chưa chọn dòng dữ liệu nào!");
        } else {
            int maGiaoDich = (int)(this.houseTable.getValueAt(index, 0));
            this.houseService.deleteHouse(maGiaoDich);
            this.reloadTable();
            this.clearInput();
        }
    }

    public void searchHouse() {

    }

    public void Close() {
        dispose();
    }

    class HouseUIController implements ActionListener {
        public HouseUIController() {

        }

        @Override
        public void actionPerformed(ActionEvent e) {
            String cmd = e.getActionCommand();
            if (cmd.equals("Thêm")) {
                addHouse();
            } else if (cmd.equals("Sửa")) {
                updateHouse();
            } else if (cmd.equals("Xóa")) {
                deleteHouse();
            } else if (cmd.equals("Tìm theo Mã")) {

            } else if (cmd.equals("Tìm")) {
                searchHouse();
            } else if (cmd.equals("Đóng")) {
                Close();
            }
        }
    }
}
