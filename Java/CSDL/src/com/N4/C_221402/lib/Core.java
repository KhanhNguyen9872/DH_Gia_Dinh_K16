package com.N4.C_221402.lib;

import java.io.PrintWriter;
import java.io.StringWriter;

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
}
