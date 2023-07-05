import java.io.BufferedWriter;
import java.io.File;
import java.util.ArrayList;
import java.util.Scanner;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Writer;
import java.nio.charset.Charset;
import java.util.Properties;

public class Lib extends Language {
    private static int MAX_DATA = 20;
    private static String[] is_load_path = new String[Lib.MAX_DATA];
    private static int[] properties_index = new int[Lib.MAX_DATA];
    private static int loaded = 0;
    private static ArrayList<Properties> properties = new ArrayList<Properties>();
    private static FileInputStream inputStream = null;
    private static final String FILE_CONFIG = "data/config.properties";
    protected static Scanner keyboard = new Scanner(System.in, "UTF-8");
    
    protected static void clear_console(){
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    }
    
    protected static String str_input(){
        return Lib.keyboard.next() + Lib.keyboard.nextLine();
    }
    
    protected static String str_input(String s){
        System.out.print(s);
        return Lib.keyboard.next() + Lib.keyboard.nextLine();
    }
    
    protected static void pause_console(){
        System.out.print("\n>> " + Lib.getlang("PRESS_ENTER_CONTINUE") + " ");
        Lib.keyboard.nextLine();
        Lib.keyboard.nextLine();
    }
    
    protected static boolean yes_or_no(String name) {
        String user_inp;
        while(true) {
            System.out.print(">> " + Lib.getlang("DO_YOU_WANT") + " " + name + "? [Y/n]: ");
            user_inp = Lib.str_input();
            if(user_inp.equalsIgnoreCase("y")){
                return true;
            } else if(user_inp.equalsIgnoreCase("n")){
                return false;
            }
        }
    }
    
    protected static long int_input(String name, String name2, boolean is_tab, boolean greater_than_zero, boolean is_long) {
        long var = 0;
        while(true) {
            if(is_tab) {
                System.out.print("    ");
            }
            System.out.print(name);
            if(name2 != null) {
                System.out.print(" " + name2);
            }
            System.out.print(": ");
            try {
                if(is_long){
                    var = Lib.keyboard.nextLong();
                } else {
                    var = Lib.keyboard.nextInt();
                }
            } catch (Exception e) {
                System.out.println("!! " + Lib.getlang("ENTER_NUM_PLZ"));
                Lib.keyboard.next();
                continue;
            }
            if(var<=0 && greater_than_zero) {
                System.out.println("!! " + name + " " + Lib.getlang("IS_NOT_VALID"));
                continue;
            }
            break;
        }
        return var;
    }
    
    protected static int[] kt_ma_laptop(ArrayList<Laptop> dsLaptop, String ma_laptop) {
        int count = 0;
        int[] info = {0, 0};
        for (Laptop i: dsLaptop){
            if(i.getMa_laptop().equals(ma_laptop)){
                info[0] = 1;
                info[1] = count;
            }
            count++;
        }
        return info;
    }
    
    protected static void printAll(ArrayList<Laptop> dsLaptop){
        int count = 0;
        System.out.println(">> " + Lib.getlang("LIST_LAPTOP") + ": ");
        for(Laptop i : dsLaptop) {
            System.out.println("  " 
                + String.valueOf(count+1) 
                + ". "
                + String.valueOf(i.getMa_laptop())
            );
            count++;
        }
    }
    
    protected static String gettext_cpu(Laptop i, boolean is_conf) {
        if (i.dsCPU.size() == 0) {
            if (is_conf) {
                return "";
            }
            return Lib.getlang("NO_INFORMATION") + " " + Lib.getlang("CPU") + "\n";
        }
        String str = "";
        for(CPU j : i.dsCPU) {
            if(is_conf) {
                str += j.export_config();
            } else {
                str += j;
            }
        }
        return str;
    }
    
    protected static String gettext_ram(Laptop i, boolean is_conf) {
        if (i.dsRAM.size() == 0) {
            if (is_conf) {
                return "";
            }
            return Lib.getlang("NO_INFORMATION") + " " + Lib.getlang("RAM") + "\n";
        }
        String str;
        if(is_conf) str = "";
        else str = "\n";
        for(RAM j : i.dsRAM) {
            if(is_conf) {
                str += j.export_config();
            } else {
                str += j;
            }
        }
        return str;
    }
    
    protected static String gettext_screen(Laptop i, boolean is_conf){
        if (i.dsScreen.size() == 0) {
            if (is_conf) {
                return "";
            }
            return Lib.getlang("NO_INFORMATION") + " " + Lib.getlang("SCREEN") + "\n";
        }
        String str = "";
        for(Screen j : i.dsScreen) {
            if(is_conf) {
                str += j.export_config();
            } else {
                str += j;
            }
        }
        return str;
    }
    
    protected static String gettext_harddisk(Laptop i, boolean is_conf) {
        if (i.dsHardDisk.size() == 0) {
            if (is_conf) {
                return "";
            }
            return Lib.getlang("NO_INFORMATION") + " " + Lib.getlang("HARDDISK") + "\n";
        }
        int count = 1;
        String str;
        if(is_conf) str = "";
        else str = "\n";
        for(HardDisk j : i.dsHardDisk) {
            if(is_conf) {
                str += j.export_config();
            } else {
                str += "  " + String.valueOf(count) + ". " + j;
            }
            count++;
        }
        return str;
    }
    
    protected static String gettext(ArrayList<Laptop> dsLaptop, boolean is_conf){
        if(isNotEmpty(dsLaptop)) {
            String full_str = "";
            int count = 1;
            for (Laptop i: dsLaptop) {
                if(!is_conf) {
                    full_str += "-------------------\n";
                } else {
                    full_str += "# Config by KhanhNguyen9872\n\n";
                }
                
                // number laptop
                if(!is_conf) {
                    full_str += " >> " + Lib.getlang("NUM_OF_LAPTOP") + " " + String.valueOf(count) + "\n";
                }
                
                // laptop series
                if(!is_conf) {
                    full_str += "- " + Lib.getlang("LAPTOP_SERIES") + ": ";
                } else {
                    full_str += "series" + String.valueOf(count) + " = ";
                }
                full_str += String.valueOf(i.getnameDong_laptop()) + "\n";
                
                // laptop code
                if(!is_conf) {
                    full_str += "- " + Lib.getlang("LAPTOP_CODE") + ": "; 
                } else {
                    full_str += "code" + String.valueOf(count) + " = ";
                }
                full_str += String.valueOf(i.getMa_laptop()) + "\n";
                
                // laptop name
                if(!is_conf) {
                    full_str += "- " + Lib.getlang("LAPTOP_NAME") + ": ";
                } else {
                    full_str += "name" + String.valueOf(count) + " = ";
                }
                full_str += String.valueOf(i.getTen_laptop()) + "\n";
                
                // CPU  
                if(!is_conf) {
                    full_str += "- " + Lib.getlang("CPU") + ": ";
                } else {
                    full_str += "cpu" + String.valueOf(count) + " = ";
                }
                full_str += gettext_cpu(i, is_conf);
                
                // RAM
                if(!is_conf) {
                    full_str += "- " + Lib.getlang("RAM") + ": ";
                } else {
                    full_str += "\nram" + String.valueOf(count) + " = ";
                }
                full_str += gettext_ram(i, is_conf);
                
                // SCREEN
                if(!is_conf) {
                    full_str += "- " + Lib.getlang("SCREEN") + ": ";
                } else {
                    full_str += "\nscreen" + String.valueOf(count) + " = ";
                }
                full_str += gettext_screen(i, is_conf);
                
                // HARDDISK
                if(!is_conf) {
                    full_str += "- " + Lib.getlang("HARDDISK") + ": ";
                } else {
                    full_str += "\nharddisk" + String.valueOf(count) + " = ";
                }
                full_str += gettext_harddisk(i, is_conf);
                
                full_str += "\n";
                if(!is_conf) {
                    full_str += ">> " + Lib.getlang("TOTAL_PRICE") + ": " + String.valueOf(i.getTong_gia()) + " " + Lib.getlang("MONEY") + "\n";
                } else {
                    full_str += "\n";
                }
                count++;
            }
            if(!is_conf) {
                full_str += "-------------------\n";
            }
            return full_str;
        } else {
            System.out.println("!! " + Lib.getlang("LIST_EMPTY"));
        }
        return null;
    }
    
    private static boolean is_load(String file) {
        for(String s : Lib.is_load_path) {
            try {
                if(s.equals(file)) {
                    return true;
                }
            } catch (Exception e) {
                return false;
            }
        }
        return false;
    }
    
    protected static void load_language() {
        Language();
    }
    
    protected static String getlang(String code) {
        if(current_lang == null) {
            load_language();
        }
        boolean a = false;
        String str = "";
        for(String s : Lib.read_data(current_path_lang, code, true, false)) {
            if(a) {
                str += ",";
            }
            str += s;
            a = true;
        }
        return str;
    }
    
    protected static String read_config(String target) {
        return Lib.arrToString(read_data(FILE_CONFIG, target, true, false));
    }
    
    protected static String[] read_data(String target) {
        return read_data(Lib.read_config("data_path"), target, true, false);
    }
    
    protected static String[] read_data(String file, String target, boolean is_exit, boolean is_err_null) {
        Properties tmp_properties = new Properties();
        if(!is_load(file)) {
            if(Lib.loaded >= Lib.MAX_DATA) {
                System.out.println("\nCannot load data! Program limited " + Lib.MAX_DATA + " data!\n");
                Lib.pause_console();
                return null;
            }
            try {
                Lib.inputStream = new FileInputStream(new File(file));
                tmp_properties.load(new InputStreamReader(Lib.inputStream, Charset.forName("UTF-8")));
            } catch (Exception e) {
                if(!is_err_null) System.out.println("!! " + Lib.getlang("READ_FAILED") + ": " + String.valueOf(file));
                if(is_exit) {
                    System.exit(1);
                } else {
                    return null;
                }
            }
            Lib.properties.add(tmp_properties);
            Lib.is_load_path[Lib.loaded] = file;
            Lib.loaded++;
        }
        
        try {
            if(target == null) {
                return null;
            } else {
                return rmSpaceArr(
                        rmBlankArr(Lib.properties.get(getIndexArr(Lib.is_load_path, file)).getProperty(target).split(","))
                );
            }
        } catch (Exception e) {
            if(!is_err_null) System.out.println("\n!! Missing data [" + String.valueOf(target) + "] from [" + String.valueOf(file) + "] !!\n");
            if(is_exit) {
                System.exit(1);
            } else {
                return null;
            }
        }
        return null;
    }
    
    protected static String[] rmBlankArr(String[] arr) {
        int len = arr.length, count = 0;
        String[] newArr = null;
        for(String s : arr) {
            if(s.isBlank()) {
                len -= 1;
            }
        }
        newArr = new String[len];
        for(String s : arr) {
            if(!s.isBlank()) {
                newArr[count] = s;
                count++;
            }
        }
        return newArr;
    }
    
    protected static String[] rmSpaceArr(String[] arr) {
        int count = 0;
        for(String s : arr) {
            arr[count] = rmSpace(s);
            count++;
        }
        return arr;
    }
    
    protected static int getIndexArr(String[] str, String target) {
        int count = 0;
        for(String s : str) {
            if(s.equals(target)) {
                return count;
            }
            count++;
        }
        return -1;
    }
    
    protected static String rmSpace(String s) {
        if (s.charAt(0) == ' ') {
            s = s.substring(1, s.length());
        }
        if (s.charAt(s.length()-1) == ' ') {
            s = s.substring(0, s.length()-1);
        }
        return s;
    }
    
    protected static String[] readDataLaptop(int type_laptop){
        String[] Empty = {};
        int count = 1;
        for(String s : read_data("laptop_type")) {
            if(count == type_laptop) {
                return read_data(s + "_data");
            }
            count++;
        }
        return Empty;
    }
    
    protected static String arrToString(String[] arr) {
        return arrToString(arr, ",");
    }
    
    protected static String arrToString(String[] arr, String var) {
        if(arr == null) return null;
        String tmpStr = "";
        for(String ss : arr) {
            if(!tmpStr.isBlank()) tmpStr += var;
            tmpStr += ss;
        }
        return tmpStr;
    }
    
    protected static String arrToListString(String[] arr, String name, boolean is_id) {
        if(name == null) {
            name = "";
        }
        int count = 1;
        String str = "(";
        for(String s : arr) {
            if(count > 1) {
                str += ", ";
            }
            if(is_id) {
                str += name
                        + String.valueOf(count)
                        + " - ";
            }
            str += String.valueOf(s);
            count++;
        }
        str += ")";
        return str;
    }
    
    public static String[] lsdir(String path) {
        String[] lstFile = null;
        File folder = new File(path);
        File[] lstOF = folder.listFiles();
        int len = lstOF.length;

        for (int i = 0; i < lstOF.length; i++) {
          if (!lstOF[i].isFile()) {
            len -= 1;
          } 
        }
        
        lstFile = new String[len];
        int count = 0;
        
        for(int i = 0; i < lstOF.length; i++) {
          if (lstOF[i].isFile()) {
            lstFile[count] = lstOF[i].getName();
            count++;
          } 
        }
        
        return lstFile; 
    }
    
    protected static void fwrite(String filename, String s, boolean is_append) throws IOException {
        Writer output;
        output = new BufferedWriter(new FileWriter(filename, is_append));
        output.append(s);
        output.close();
    }
    
    protected static boolean isNotEmpty(ArrayList ds) {
        return ds.size() > 0;
    }
}
