package com.N4.C_221402.lib;

import com.N4.C_221402.obj.NhanVien;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author KhanhNguyen9872
 */
public class Core {
    public static String getFullLog(Exception ex) {
        StringWriter errors = new StringWriter();
        ex.printStackTrace(new PrintWriter(errors));
        return errors.toString();
    }
    
    public static String removeLastLine(String str) {
        return str.substring(0, str.length() - 1);
    }
    
    public static String getLessLog(Exception ex) {
        String str = "";
        for (String s : String.valueOf(getFullLog(ex)).split("\n")) {
            if(s == "") {
                continue;
            }
            if((s.startsWith("	at ")) || (s.startsWith("	... "))) {
                continue;
            } else {
                str += s + "\n";
            }
        }
        return removeLastLine(str);
    }

    public static String getCauseLog(Exception ex) {
        String str = "";
        for (String s : String.valueOf(getFullLog(ex)).split("\n")) {
            if(s == "") {
                continue;
            }
            if(s.startsWith("Caused by: ")) {
                str += s + "\n";
            }
        }
        
        if(str == "") {
            str = "There are no caused log in FullLog!";
        }
        return removeLastLine(str);
    }

    public static String joinStr(String[] listStr, String x) {
        String str = "";
        for(String s : listStr) {
            str += s + x;
        }
        str = removeLastLine(str);
        return str;
    }
    
    public static ArrayList getArrayList_NhanVien(Connection conn, String tableName) throws SQLException {
        ArrayList<NhanVien> dsNhanVien = new ArrayList<NhanVien>();
        String[] columnNames = {"*"};
        String[] fromTableNames = {tableName};
        ResultSet result = DBManager.selectData(conn, columnNames, fromTableNames, "");

        while(result.next()) {
            NhanVien NV = new NhanVien();
            for(String s : columnNames) {
                try {
                    NV.setMaNV(result.getString("MANV"));
                    NV.setHo(result.getString("HONV"));
                    NV.setTenLot(result.getString("TENLOT"));
                    NV.setTen(result.getString("TENNV"));
                    NV.setPhai(result.getString("PHAI"));
                    NV.setNgSinh(result.getString("NGSINH"));
                    NV.setQueQuan(result.getString("QUEQUAN"));
                    NV.setNoiSinh(result.getString("NOISINH"));
                } catch (Exception ex) {
                    continue;
                }
            }
            dsNhanVien.add(NV);
        }
        return dsNhanVien;
    }
    
}
