package com.N4.C_221402.lib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author KhanhNguyen9872
 */
public class DBManager {
    protected static String MYSQL_DBNAME = "Nhom4";
    protected static String MYSQL_HOST = "127.0.0.1";
    protected static int MYSQL_PORT = 3306;
    protected static String MYSQL_USER = "root";
    private static final String MYSQL_PASSWD = "1234567";    
    
    public static Connection connect(String host, int port, String user, String passwd, String db_name) throws ClassNotFoundException, SQLException, InterruptedException {
        Connection conn = null;
        System.out.println("[>] Connecting MySQL...");
        Thread.sleep(300);
        conn = DriverManager.getConnection("jdbc:mysql://" + host + ":" + String.valueOf(port) + "/" + db_name, user, passwd);
        System.out.println("[+] Connected (" + String.valueOf(conn).split("@")[1] + ")");
        return conn;
    }
    
    public static Connection connect() throws ClassNotFoundException, SQLException, InterruptedException {
        return connect(MYSQL_HOST, MYSQL_PORT, MYSQL_USER, MYSQL_PASSWD, MYSQL_DBNAME);
    }
    
    public static void disconnect(Connection conn) {
        try {
            conn.close();
            System.out.println("[-] Disconnected [" + String.valueOf(conn).split("@")[1] + "]");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public static ResultSet query(Connection conn, String txt) throws SQLException {
        System.out.println("[~] Query (" + String.valueOf(conn).split("@")[1] + ") " + txt);
        return conn.createStatement().executeQuery(txt);
    }
    
    public static int queryUpdate(Connection conn, String txt) throws SQLException {
        System.out.println("[~] QueryUpdate (" + String.valueOf(conn).split("@")[1] + ") " + txt);
        return conn.createStatement().executeUpdate(txt);
    }
    
    public static String[] getColumnName(ResultSet result) throws SQLException {
        java.sql.ResultSetMetaData metaData = result.getMetaData();
        int count = metaData.getColumnCount();
        String columnNames[] = new String[count];

        for(int i=0; i<count; i++) {
           columnNames[i] = metaData.getColumnLabel(i+1);
        }
        
        return columnNames;
    }
    
    public static boolean deleteTable(Connection conn, String tableName) throws SQLException {
        String txt = "DELETE FROM " + tableName + ";";
        if (queryUpdate(conn, txt) == 1) {
            return true;
        }
        return false;
    }
    
    public static boolean updateData(Connection conn, String tableName, String[] columnNames, String[] values, String WHERE) throws SQLException {
        String s = "";
        
        for(int i=0; i<columnNames.length; i++) {
            s += columnNames[i] + " = \'" + values[i] + "\',";
        }
        s = Core.removeLastLine(s);
        
        if((WHERE != null) && (WHERE != "")) {
            WHERE = " WHERE " + WHERE;
        }
        
        String txt = "UPDATE " + tableName + " SET "
            + s + WHERE + ";";
        
        if (queryUpdate(conn, txt) == 1) {
            return true;
        };
        return false;
    }
    
    public static boolean insertData(Connection conn, String tableName, String[] columnNames, String[] values) throws SQLException {
        String column = "";
        String value = "";
        
        for(String s : columnNames) {
            column += "`" + s + "`" + ",";
        }
        column = Core.removeLastLine(column);
        
        for(String s : values) {
            value += "'" + s + "'" + ",";
        }
        value = Core.removeLastLine(value);
        
        String txt = "INSERT INTO " + tableName + " "
            + "(" + column + ")"
            + " VALUES "
            + "(" + value + ");";
        
        if (queryUpdate(conn, txt) == 1) {
            return true;
        };
        return false;
    }
    
    public static ResultSet selectData(Connection conn, String[] columnNames, String[] fromTableNames, String WHERE) throws SQLException {        
        String column = "";
        String fromTable = "";
        
        for(String s : columnNames) {
            column += s + ",";
        }
        column = Core.removeLastLine(column);
        
        for(String s : fromTableNames) {
            fromTable += s + ",";
        }
        fromTable = Core.removeLastLine(fromTable);
        
        if((WHERE != null) && (WHERE != "")) {
            WHERE = " WHERE " + WHERE;
        }
        
        String txt = "SELECT " + column + " FROM " + fromTable + WHERE + ";";
        
        return query(conn, txt);
    }
    
}
