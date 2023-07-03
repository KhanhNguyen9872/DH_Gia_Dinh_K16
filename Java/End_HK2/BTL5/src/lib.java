import java.util.ArrayList;
import java.util.Scanner;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

public class lib {
    private static boolean is_load = false;
    private static Properties properties = new Properties();
    private static InputStream inputStream = null;
    private static final String FILE_CONFIG = "data/data.properties";
    protected static Scanner keyboard = new Scanner(System.in, "UTF-8");
    protected static void clear_console(){
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    }
    protected static String str_input(){
        return lib.keyboard.next() + lib.keyboard.nextLine();
    }
    protected static void pause_console(){
        System.out.print("\n>> Nhấn Enter để tiếp tục! ");
        lib.keyboard.nextLine();
        lib.keyboard.nextLine();
    }
    protected static boolean yes_or_no(String name) {
        String user_inp;
        while(true) {
            System.out.print(">> Bạn có muốn " + name + " không? [Y/n]: ");
            user_inp = lib.str_input();
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
                    var = lib.keyboard.nextLong();
                } else {
                    var = lib.keyboard.nextInt();
                }
            } catch (Exception e) {
                System.out.println("!! Vui lòng nhập số!");
                lib.keyboard.next();
                continue;
            }
            if(var<=0 && greater_than_zero) {
                System.out.println("!! " + name + " không hợp lệ!");
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
        for(Laptop i : dsLaptop) {
            System.out.println("  " 
                + String.valueOf(count+1) 
                + ". "
                + String.valueOf(i.getMa_laptop())
            );
        }
    }
    
    protected static String gettext_cpu(Laptop i) {
        if (i.dsCPU.size() == 0) {
            return "Không có thông tin CPU\n";
        }
        String str = "";
        for(CPU j : i.dsCPU) {
            str += j;
        }
        return str;
    }
    
    protected static String gettext_ram(Laptop i) {
        if (i.dsRAM.size() == 0) {
            return "Không có thông tin RAM\n";
        }
        String str = "";
        for(RAM j : i.dsRAM) {
            str += j;
        }
        return str;
    }
    
    protected static String gettext_screen(Laptop i){
        if (i.dsScreen.size() == 0) {
            return "Không có thông tin màn hình\n";
        }
        String str = "";
        for(Screen j : i.dsScreen) {
            str += j;
        }
        return str;
    }
    
    protected static String gettext_harddisk(Laptop i) {
        if (i.dsHardDisk.size() == 0) {
            return "Không có thông tin ổ cứng\n";
        }
        int count = 1;
        String str = "";
        for(HardDisk j : i.dsHardDisk) {
            str += "  " + String.valueOf(count) + ". " + j;
            count++;
        }
        return str;
    }
    
    protected static String gettext(ArrayList<Laptop> dsLaptop){
        if(isNotEmpty(dsLaptop)) {
            String full_str = "";
            int count = 1;
            for (Laptop i: dsLaptop) {
                full_str += "-------------------\n";
                full_str += " >> Laptop thứ " + String.valueOf(count) + "\n";
                full_str += "- Dòng máy: " + String.valueOf(i.getnameDong_laptop()) + "\n";
                full_str += "- Mã: " + String.valueOf(i.getMa_laptop()) + "\n";
                full_str += "- Tên: " + String.valueOf(i.getTen_laptop()) + "\n";

                full_str += "- CPU: ";
                full_str += gettext_cpu(i);
                
                full_str += "- RAM: \n";
                full_str += gettext_ram(i);
                
                full_str += "- Màn hình: ";
                full_str += gettext_screen(i);
                
                full_str += "- Ổ cứng: \n";
                full_str += gettext_harddisk(i);
                
                full_str += "\n";
                full_str += ">> Tổng giá: " + String.valueOf(i.getTong_gia()) + " USD\n";
                count++;
            }
            full_str += "-------------------\n";
            return full_str;
        } else {
            System.out.println("!! Danh sách trống!");
        }
        return null;
    }
    
    protected static String[] read_data(String target) {
        if(!is_load) {
            try {
                inputStream = new FileInputStream(FILE_CONFIG);
                properties.load(inputStream);
            } catch (Exception e) {
                System.out.println("!! Failed when read file: " + String.valueOf(FILE_CONFIG));
                System.exit(1);
            }
            is_load = true;
        }
        try {
            return rmSpaceArr(
                    rmBlankArr(properties.getProperty(target).split(","))
            );
        } catch (Exception e) {
            System.out.println("\n!! Missing data [" + String.valueOf(target) + "] from data config!");
            System.exit(1);
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
    
    protected static String arrToString(String[] arr, String name, boolean is_id) {
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
    
    protected static boolean isNotEmpty(ArrayList ds) {
        return ds.size() > 0;
    }
}
