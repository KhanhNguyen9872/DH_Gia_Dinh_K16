package presentation;

import java.awt.Insets;
import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.jdesktop.swingx.JXDatePicker;

import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;

import domain.model.Land;
import observer.Subscriber;
import presentation.commandprocessor.*;
import presentation.commandprocessor.landui.*;
import domain.LandService;

public class LandUI extends JFrame implements Subscriber, ActionListener, ListSelectionListener {
    private LandService landService = null;

    private JMenuBar jMenuBar = null;
    private DefaultTableModel tableModel = null;
    private JTable landTable = null;
    private JButton addButton, updateButton, deleteButton, findIDButton, sumButton, sumCountButton, avgButton, exportButton;
    private JLabel labelMaGiaoDich, labelNgayGiaoDich, labelDonGia, labelLoaiDat, labelDienTich, labelTimKiem, labelMonth;
    private JTextField textMaGiaoDich, textDonGia, textDienTich, textTimKiem;
    private JComboBox comboBoxLoaiDat, comboBoxMonth;
    private JXDatePicker JngayGiaoDich;
    private CommandProcessor commandProcessor;

    public LandUI(LandService landService, CommandProcessor commandProcessor) {
        landService.addSub(this);
        this.landService = landService;
        this.commandProcessor = commandProcessor;
        this.buildMenuBar();
        this.buildPanel();

        setSize(900, 480);
        setTitle("Quản lý đất");
        setJMenuBar(this.jMenuBar);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        reloadTable();
        clearInput();
    }

    public void buildMenuBar() {
        this.jMenuBar = new JMenuBar();
        JMenu jMenu = new JMenu("Hệ thống");
        JMenuItem jMenuItemClose = new JMenuItem("Đóng");

        jMenuItemClose.addActionListener(this);

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
        this.labelTimKiem = new JLabel("Tìm kiếm: ");
        this.labelMonth = new JLabel("Tháng: ");

        this.JngayGiaoDich = new JXDatePicker();
        this.JngayGiaoDich.setDate(Calendar.getInstance().getTime());
        this.JngayGiaoDich.setFormats(new SimpleDateFormat("yyyy/MM/dd"));

        this.textMaGiaoDich = new JTextField(10);
        this.textDonGia = new JTextField(10);
        this.textDienTich = new JTextField(10);
        this.textTimKiem = new JTextField(20);

        String[] lst = {"A", "B", "C"};
        this.comboBoxLoaiDat = new JComboBox<>(lst);

        String[] lstMonth = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" };
        this.comboBoxMonth = new JComboBox<>(lstMonth);

        this.addButton = new JButton("Thêm");
        this.updateButton = new JButton("Sửa");
        this.deleteButton = new JButton("Xóa");
        this.findIDButton = new JButton("Tìm theo ID");
        this.sumButton = new JButton("Tính thành tiền");
        this.sumCountButton = new JButton("Tính tổng số lượng");
        this.avgButton = new JButton("Tính trung bình thành tiền");
        this.exportButton = new JButton("Xuất giao dịch");

        // Initialize table
        String[] columnNames = { "MaGiaoDich", "NgayGiaoDich", "DonGia", "LoaiDat", "DienTich" };
        tableModel = new DefaultTableModel(columnNames, 0);
        landTable = new JTable(tableModel);
        landTable.getSelectionModel().addListSelectionListener(this);

        // add ActionListener
        this.addButton.addActionListener(this);
        this.updateButton.addActionListener(this);
        this.deleteButton.addActionListener(this);
        this.findIDButton.addActionListener(this);
        this.sumButton.addActionListener(this);
        this.sumCountButton.addActionListener(this);
        this.avgButton.addActionListener(this);
        this.exportButton.addActionListener(this);

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
        inputPanel.add(this.JngayGiaoDich, gbc);
        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(this.labelDonGia, gbc);
        gbc.gridx++;
        inputPanel.add(this.textDonGia, gbc);
        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(this.labelLoaiDat, gbc);
        gbc.gridx++;
        inputPanel.add(this.comboBoxLoaiDat, gbc);
        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(this.labelDienTich, gbc);
        gbc.gridx++;
        inputPanel.add(this.textDienTich, gbc);

        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(this.labelTimKiem, gbc);
        gbc.gridx++;
        inputPanel.add(this.textTimKiem, gbc);
        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(this.labelMonth, gbc);
        gbc.gridx++;
        inputPanel.add(this.comboBoxMonth, gbc);

        // find


        // button Panel
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(this.addButton);
        buttonPanel.add(this.updateButton);
        buttonPanel.add(this.deleteButton);
        buttonPanel.add(this.findIDButton);
        buttonPanel.add(this.sumButton);
        buttonPanel.add(this.sumCountButton);
        buttonPanel.add(this.avgButton);
        buttonPanel.add(this.exportButton);

        JPanel mainPanel = new JPanel(new BorderLayout());
        mainPanel.add(new JScrollPane(this.landTable), BorderLayout.CENTER);
        mainPanel.add(inputPanel, BorderLayout.NORTH);
        mainPanel.add(buttonPanel, BorderLayout.SOUTH);
        
        this.add(mainPanel);
    }

    public void reloadTable() {
        List<Land> lands = this.landService.getData();
        reloadTable(lands);
    }

    public void reloadTable(List<Land> lands) {
        tableModel.setRowCount(0); // clear table

        for(Land land : lands) {
            Object[] row = { land.getMaGiaoDich(), land.getNgayGiaoDich(), land.getDonGia(), land.getLoaiDat(), land.getDienTich() };
            tableModel.addRow(row);
        }
    }

    public void clearInput() {
        this.textMaGiaoDich.setText("");
        this.JngayGiaoDich.setDate(new Date("01/07/2024"));
        this.textDonGia.setText("");
        this.comboBoxLoaiDat.setSelectedIndex(0);;
        this.textDienTich.setText("");
    }

    public Land getCurrentLand() {
        SimpleDateFormat formater = new SimpleDateFormat("yyyy/MM/dd");
        // Get data from input
        int maGiaoDich = Integer.parseInt(this.textMaGiaoDich.getText());
        String ngayGiaoDich = formater.format(this.JngayGiaoDich.getDate());
        int donGia = Integer.parseInt(this.textDonGia.getText());
        String loaiDat = this.comboBoxLoaiDat.getSelectedItem().toString();
        double dienTich = Double.parseDouble(this.textDienTich.getText());
        return new Land(maGiaoDich, ngayGiaoDich, donGia, loaiDat, dienTich);
    }

    public void addLand() {
        try {
            Land land = this.getCurrentLand();

            // check land is exist or not
            if (this.landService.findGetLand(land.getMaGiaoDich()) != null) {
                // exist
                JOptionPane.showMessageDialog(this, "Mã giao dịch này đã tồn tại");
                return;
            };

            // add new land
            this.landService.addLand(land);

            // Clear input
            this.clearInput();
            reloadTable();
        } catch (NumberFormatException ex) {
            // can't parse to int
            JOptionPane.showMessageDialog(this, "Dữ liệu không hợp lệ!");
        }
    }

    public Command calcMoney(Land land) {
        if (this.landService.findGetLand(land.getMaGiaoDich()) == null) {
            JOptionPane.showMessageDialog(this, "Mã giao dịch này không tồn tại");
            return null;
        };
        return new CalcCommand(landService, land);
    }

    public Command addLand(Land land) {
        if (this.landService.findGetLand(land.getMaGiaoDich()) != null) {
            JOptionPane.showMessageDialog(this, "Mã giao dịch này đã tồn tại");
            return null;
        };
        return new AddCommand(landService, land);
    }

    public Command updateLand(Land land) {
        if (this.landService.findGetLand(land.getMaGiaoDich()) == null) {
            JOptionPane.showMessageDialog(this, "Mã giao dịch này không tồn tại");
            return null;
        };
        return new UpdateCommand(landService, land);
    }

    public Command deleteLand() {
        int index = this.landTable.getSelectedRow();

        if (index == -1) {
            JOptionPane.showMessageDialog(this, "Bạn chưa chọn dòng dữ liệu nào!");
            return null;
        }
        int maGiaoDich = Integer.parseInt(this.landTable.getValueAt(index, 0).toString());
        return new DeleteCommand(landService, maGiaoDich);
    }

    public Command sumCountLand() {
        return new SumCountLandCommand(this.landService, this.comboBoxLoaiDat.getSelectedItem().toString());
    }

    public Command avgMoney() {
        return new AvgCommand(this.landService);
    }

    public Command exportData() {
        return new ExportCommand(this.landService, Integer.parseInt(this.comboBoxMonth.getSelectedItem().toString()));
    }

    public Command findByID() {
        String text = textTimKiem.getText();
        if (text == null || text.isEmpty()) {
            return null;
        }
        int maGiaoDich = Integer.parseInt(text);
        return new FindByIDCommand(landService, maGiaoDich);
    }

    // public Command searchLand() {
    //     String text = JOptionPane.showInputDialog(this, "Nhập mã giao dịch:");
    //     if (text == null || text.isEmpty()) {
    //         return null;
    //     }

    //     try {
    //         int maGiaoDich = Integer.parseInt(text);

    //         if (this.landService.findGetLand(maGiaoDich) == null) {
    //             JOptionPane.showMessageDialog(this, "Mã giao dịch này không tồn tại");
    //             return null;
    //         };

    //         return new FindByIDCommand(landService, maGiaoDich);
    //     } catch (NumberFormatException ex) {
    //         JOptionPane.showMessageDialog(this, "Vui lòng nhập số");
    //     }
    //     return null;
    // }

    public void setLand(Land land) {
        String maGiaoDich = String.valueOf(land.getMaGiaoDich());
        String ngayGiaoDich = land.getNgayGiaoDich();
        String donGia = String.valueOf(land.getDonGia());
        String loaiDat = land.getLoaiDat();
        String dienTich = String.valueOf(land.getDienTich());

        this.textMaGiaoDich.setText(maGiaoDich);
        this.JngayGiaoDich.setDate(new Date(ngayGiaoDich.replace('-', '/')));
        this.textDonGia.setText(donGia);
        if (loaiDat.toLowerCase().equals("a")) {
            this.comboBoxLoaiDat.setSelectedIndex(0);
        } else if (loaiDat.toLowerCase().equals("b")) {
            this.comboBoxLoaiDat.setSelectedIndex(1);
        } else if (loaiDat.toLowerCase().equals("c")) {
            this.comboBoxLoaiDat.setSelectedIndex(2);
        }
        
        this.textDienTich.setText(dienTich);
    }

    public void Close() {
        this.dispose();
    }

    @Override
    public void valueChanged(ListSelectionEvent e) {
        int row = this.landTable.getSelectedRow();

        if (row == -1) {
            return;
        }

        String maGiaoDich = this.landTable.getModel().getValueAt(row, 0).toString();
        String ngayGiaoDich = this.landTable.getModel().getValueAt(row, 1).toString();
        String donGia = this.landTable.getModel().getValueAt(row, 2).toString();
        String loaiDat = this.landTable.getModel().getValueAt(row, 3).toString();
        String dienTich = this.landTable.getModel().getValueAt(row, 4).toString();

        this.textMaGiaoDich.setText(maGiaoDich);
        this.JngayGiaoDich.setDate(new Date(ngayGiaoDich.replace('-', '/')));
        this.textDonGia.setText(donGia);
        if (loaiDat.toLowerCase().equals("a")) {
            this.comboBoxLoaiDat.setSelectedIndex(0);
        } else if (loaiDat.toLowerCase().equals("b")) {
            this.comboBoxLoaiDat.setSelectedIndex(1);
        } else if (loaiDat.toLowerCase().equals("c")) {
            this.comboBoxLoaiDat.setSelectedIndex(2);
        }
        this.textDienTich.setText(dienTich);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        try {
            String cmd = e.getActionCommand();
            Land land;

            try {
                land = this.getCurrentLand();
            } catch (Exception ex) {
                land = null;
            }
            Command command = null;

            if (cmd.equals("Thêm")) {
                command = addLand(land);

            } else if (cmd.equals("Sửa")) {
                command = updateLand(land);

            } else if (cmd.equals("Xóa")) {
                command = deleteLand();

            } else if (cmd.equals("Tìm theo ID")) {
                command = findByID();

            } else if (cmd.equals("Tìm")) {
                // command = searchLand();

            } else if (cmd.equals("Tính thành tiền")) {
                command = calcMoney(land);
            
            } else if (cmd.equals("Tính tổng số lượng")) {
                command = sumCountLand();
            
            } else if (cmd.equals("Tính trung bình thành tiền")) {
                command = avgMoney();
            
            } else if (cmd.equals("Xuất giao dịch")) {
                command = exportData();

            } else if (cmd.equals("Đóng")) {
                Close();

            }

            if (command == null) {
                return;
            }

            commandProcessor.execute(command);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void update() {
        Land land = this.landService.getLand();
        List<Land> lands = this.landService.getLands();
        double thanhTien = this.landService.getThanhTien();
        int soLuong = this.landService.getSoLuong();
        double avgMoney = this.landService.getAvgMoney();

        if (land != null) {
            setLand(land);
        } else if (lands != null) {
            reloadTable(lands);
        } else if (thanhTien > -1) {
            JOptionPane.showMessageDialog(this, "Thành tiền: " + thanhTien);
        } else if (soLuong > -1) {
            JOptionPane.showMessageDialog(this, "Số lượng: " + soLuong);
        } else if (avgMoney > -1) {
            JOptionPane.showMessageDialog(this, "Trung bình thành tiền: " + avgMoney);
        } else {
            clearInput();
            reloadTable();
        }
    }
}
