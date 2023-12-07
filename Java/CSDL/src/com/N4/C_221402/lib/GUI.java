package com.N4.C_221402.lib;

import com.N4.C_221402.obj.NhanVien;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JRootPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

/**
 *
 * @author KhanhNguyen9872
 */

public class GUI {
    private static boolean SQL_is_passwd_hide = false;
    
    public static void run() {
        System.out.println("[@] Working dir: " + System.getProperty("user.dir"));
        System.out.println("[>] Starting program...");
        Connection conn = null;
        JFrame connectFrame = null;
        try {
            connectFrame = createLoadingFrame("MySQL - N4", "Connecting MySQL...");
            connectFrame.pack();
            connectFrame.setSize(260, 75);
            connectFrame.setVisible(true);
            conn = DBManager.connect();
            destroyFrame(connectFrame, "MySQL - N4");
        } catch (Exception ex) {
            String err = Core.getLessLog(ex);
            destroyFrame(connectFrame, "MySQL - N4");
            System.err.println("[!] Error log: " + err);
            PopupFrameOK(err, false);
        }
        if(conn == null) {
            SQLConnectBox();
        } else {
            loginUI(conn);
        }
    }
    
    private static void mainGUI(Connection conn) {
        try {
            ArrayList<NhanVien> dsNhanVien = Core.getArrayList_NhanVien(conn, "NHANVIEN");
            System.out.println("[*] Show: \'Main window\'");
            JFrame mainFrame = createFrame("Main Program", true);
            JLabel label = new JLabel("Table NHANVIEN");
            mainFrame.add(label);
            mainFrame.pack();
            
            //String[] columnNames = {"MANV", "HONV", "TENLOT", "TENNV", "PHAI", "NOISINH", "QUEQUAN"};
            //String[] values = {"113114117", "Nguyen", "Van", "C", "Nam", "VietNam", "Hong Kong"};
            String[] columnNames = { "*" };
            String[] values = {"NHANVIEN"};
            
            //System.out.println(DBManager.updateData(conn, "NHANVIEN", columnNames, values, "MANV='113114115'"));
            
            ResultSet result = DBManager.selectData(conn, columnNames, values, "");
            
            JTable table = resultToJTable(result);
            
            mainFrame.add(new JScrollPane(table));
            
            mainFrame.setSize(800, 360);
            mainFrame.setLocationRelativeTo(null);
            mainFrame.setVisible(true);
            DBManager.disconnect(conn);
        } catch (Exception ex) {
            String err = Core.getFullLog(ex);
            System.err.println("[!] Error log: " + err);
            PopupFrameOK(err, true);
        }
    }
    
    private static JTable resultToJTable(ResultSet result) throws SQLException {
        String[] columnNames = DBManager.getColumnName(result);

        int length = 0;
        if(result != null) {
            result.last();
            length = result.getRow();
            result.beforeFirst();
        }
                
        String[][] data = new String[length][columnNames.length];
        int i = 0;
        
        while(result.next()) {
            for(int j=0; j<columnNames.length; j++) {
                data[i][j] = result.getString(columnNames[j]);
            }
            i++;
        }
        JTable table = new JTable(data, columnNames);
        return table;
    }
    
    
    private static void SQLConnectBox() {
        System.out.println("[*] Show: \'SQL Connect Box\'");
        JFrame SQLFrame = createFrame("SQL Connect", true);
        
        SQLFrame.setLayout(new FlowLayout());
        SQLFrame.dispose();
        SQLFrame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);

        SQLFrame.getRootPane().setWindowDecorationStyle(JRootPane.NONE);
        
        JLabel SQL_WARNING_LABEL = new JLabel("<html><B>SQL connection required</B></html>");
        SQL_WARNING_LABEL.setFont(new Font("Arial", Font.PLAIN, 18));
        
        JTextField SQL_IP = new JTextField(DBManager.MYSQL_HOST, 13);
        JTextField SQL_PORT = new JTextField(String.valueOf(DBManager.MYSQL_PORT), 13);
        JTextField SQL_USER = new JTextField(DBManager.MYSQL_USER, 13);
        JPasswordField SQL_PASSWD = new JPasswordField("YOUR PASSWORD HERE", 14);
        JTextField SQL_DBNAME = new JTextField(DBManager.MYSQL_DBNAME, 11);
        
        SQL_PASSWD.setEchoChar((char) 0);

        JLabel SQL_IP_LABEL = new JLabel("MySQL Host: ", JLabel.LEFT);
        JLabel SQL_PORT_LABEL = new JLabel("MySQL Port: ", JLabel.LEFT);
        JLabel SQL_USER_LABEL = new JLabel("MySQL User: ", JLabel.LEFT);
        JLabel SQL_PASSWD_LABEL = new JLabel("Password: ", JLabel.LEFT);
        JLabel SQL_DBNAME_LABEL = new JLabel("Database name: ", JLabel.LEFT);
        
        SQL_IP.setHorizontalAlignment(JTextField.CENTER);
        SQL_PORT.setHorizontalAlignment(JTextField.CENTER);
        SQL_USER.setHorizontalAlignment(JTextField.CENTER);
        SQL_PASSWD.setHorizontalAlignment(JTextField.CENTER);
        SQL_DBNAME.setHorizontalAlignment(JTextField.CENTER);
                
        JPanel row_IP = new JPanel();
        JPanel row_PORT = new JPanel();
        JPanel row_USER = new JPanel();
        JPanel row_PASSWD = new JPanel();
        JPanel row_DBNAME = new JPanel();
        
        row_IP.add(SQL_IP_LABEL);
        row_IP.add(SQL_IP);
        row_PORT.add(SQL_PORT_LABEL);
        row_PORT.add(SQL_PORT);
        row_USER.add(SQL_USER_LABEL);
        row_USER.add(SQL_USER);
        row_PASSWD.add(SQL_PASSWD_LABEL);
        row_PASSWD.add(SQL_PASSWD);
        row_DBNAME.add(SQL_DBNAME_LABEL);
        row_DBNAME.add(SQL_DBNAME);
        
        JButton CONNECT_BUTTON = new JButton("Connect");
        JButton SHOW_HIDE_BUTTON = new JButton();
        JButton EXIT_BUTTON = new JButton("Close");
        
        SQLFrame.getRootPane().setDefaultButton(CONNECT_BUTTON);
        
        if(GUI.SQL_is_passwd_hide) {
            SHOW_HIDE_BUTTON.setText("Show");
        } else {
            SHOW_HIDE_BUTTON.setText("Hide");
        }
        
//        CONNECT_BUTTON.setPreferredSize(new Dimension(90, 25));
        
        SHOW_HIDE_BUTTON.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if(GUI.SQL_is_passwd_hide) {
                    SQL_PASSWD.setEchoChar((char) 0);
                    SHOW_HIDE_BUTTON.setText("Hide");
                    GUI.SQL_is_passwd_hide = false;
                } else {
                    SQL_PASSWD.setEchoChar('*');
                    SHOW_HIDE_BUTTON.setText("Show");
                    GUI.SQL_is_passwd_hide = true;
                }
            }
        });
        
        EXIT_BUTTON.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
        });
        
        JFrame connectFrame = createLoadingFrame("MySQL - N4", "Connecting MySQL...");
        connectFrame.pack();
        connectFrame.setSize(260, 75);
        
        CONNECT_BUTTON.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                Connection conn = null;
                try {
                    connectFrame.setVisible(true);
                    conn = DBManager.connect(
                            SQL_IP.getText(), 
                            Integer.valueOf(SQL_PORT.getText()), 
                            SQL_USER.getText(),
                            new String(SQL_PASSWD.getPassword()), 
                            SQL_DBNAME.getText()
                    );
                    destroyFrame(SQLFrame, "SQL Connect Box");
                } catch (Exception ex) {
                    String err = Core.getCauseLog(ex);
                    destroyFrame(connectFrame, "MySQL - N4");
                    System.err.println("[!] Error log: " + err);
                    PopupFrameOK(err, false);
                }
                if(conn != null) {
                    destroyFrame(connectFrame, "MySQL - N4");
                    loginUI(conn);
                }
            }
        });
        
        SQLFrame.add(SQL_WARNING_LABEL);
        SQLFrame.add(row_IP);
        SQLFrame.add(row_PORT);
        SQLFrame.add(row_USER);
        SQLFrame.add(row_PASSWD);
        SQLFrame.add(row_DBNAME);
        SQLFrame.add(EXIT_BUTTON);
        SQLFrame.add(SHOW_HIDE_BUTTON);
        SQLFrame.add(CONNECT_BUTTON);

        SQLFrame.pack();
        
        SQLFrame.setSize(260, 280);
        SQLFrame.setLocationRelativeTo(null);
        SQLFrame.setVisible(true);
    }
    
    private static void PopupFrameOK(String warning_text, boolean exit_on_close) {
        JFrame popupFrame = com.N4.C_221402.lib.GUI.createFrame("", exit_on_close);
        popupFrame.setAlwaysOnTop(true);
        JOptionPane.showMessageDialog(popupFrame, warning_text);
        if(exit_on_close){
            System.exit(1);
        }
    }
    
    private static void destroyFrame(JFrame frame, String frameName) {
        frame.dispose();
        System.out.println("[/] Destroy: \'" + frameName + "\'");
    }

    private static JFrame createLoadingFrame(String title, String txt) {
        JFrame loadingFrame = createFrame(title, false);
        JLabel loadingLabel = new JLabel("<html><B>" + txt + "</B></html>", SwingConstants.CENTER);
        loadingLabel.setFont(new Font("Arial", Font.PLAIN, 18));
        loadingFrame.add(loadingLabel);
        loadingFrame.setLocationRelativeTo(null);
        loadingFrame.setAlwaysOnTop(true);
        loadingFrame.pack();
        return loadingFrame;
    }
    
    private static JFrame createFrame(String title, boolean exit_on_close) {
        JFrame frame = new JFrame(title);
        frame.setResizable(false);
        frame.setLayout(new FlowLayout());
        frame.pack();
        if(exit_on_close) {
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.addWindowListener(new WindowAdapter(){
                public void windowClosing(WindowEvent windowEvent) {
                    System.exit(0);
                }
            });
        }
        return frame;
    }
    
    public static void loginUI(Connection conn) {
        JFrame mainLoginFrame = createFrame("Admin Login", true);
        JLabel USERNAME_LABEL = new JLabel("Username: ");
        JLabel PASSWORD_LABEL = new JLabel("Password");
        
        JTextField USERNAME = new JTextField(13);
        JPasswordField PASSWORD = new JPasswordField(14);
        
        JButton SHOW_HIDE_BUTTON = new JButton();
        JButton EXIT_BUTTON = new JButton("Close");
        JButton LOGIN_BUTTON = new JButton("Login");
        
        GUI.SQL_is_passwd_hide = true;
        if(GUI.SQL_is_passwd_hide) {
            SHOW_HIDE_BUTTON.setText("Show");
        } else {
            SHOW_HIDE_BUTTON.setText("Hide");
        }
        
        LOGIN_BUTTON.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String[] columnNames = {"*"};
                String[] fromTableNames = {"account"};
                try {
                    ResultSet result = DBManager.selectData(conn, columnNames, fromTableNames, "");
                    while(result.next()) {
                        if((result.getString("username").equals(USERNAME.getText())) 
                        && (result.getString("password").equals(new String(PASSWORD.getPassword())))) {
                            destroyFrame(mainLoginFrame, "Admin Login");
                            mainGUI(conn);
                            return;
                        }
                        break;
                    }
                    System.out.println("[!!] Tài khoản hoặc mật khẩu không chính xác");
                    PopupFrameOK("Tài khoản hoặc mật khẩu không chính xác", false);
                } catch (Exception ex) {
                    String err = Core.getLessLog(ex);
                    System.err.println(err);
                    PopupFrameOK(err, false);
                }
            }
        });
        
        SHOW_HIDE_BUTTON.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if(GUI.SQL_is_passwd_hide) {
                    PASSWORD.setEchoChar((char) 0);
                    SHOW_HIDE_BUTTON.setText("Hide");
                    GUI.SQL_is_passwd_hide = false;
                } else {
                    PASSWORD.setEchoChar('*');
                    SHOW_HIDE_BUTTON.setText("Show");
                    GUI.SQL_is_passwd_hide = true;
                }
            }
        });
        
        EXIT_BUTTON.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
        });
        
        mainLoginFrame.getRootPane().setDefaultButton(LOGIN_BUTTON);
        
        JPanel panel_USERNAME = new JPanel();
        JPanel panel_PASSWORD = new JPanel();
        
        panel_USERNAME.add(USERNAME_LABEL);
        panel_USERNAME.add(USERNAME);
        panel_PASSWORD.add(PASSWORD_LABEL);
        panel_PASSWORD.add(PASSWORD);
        
        mainLoginFrame.add(panel_USERNAME);
        mainLoginFrame.add(panel_PASSWORD);
        mainLoginFrame.add(EXIT_BUTTON);
        mainLoginFrame.add(SHOW_HIDE_BUTTON);
        mainLoginFrame.add(LOGIN_BUTTON);
        mainLoginFrame.pack();
        mainLoginFrame.setSize(250, 150);
        mainLoginFrame.setVisible(true);
    }
}
