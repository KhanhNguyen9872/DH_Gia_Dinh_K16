
import java.io.IOException;
import java.util.ArrayList;

public class Quanly {
    private final String conf_path = Lib.read_config("conf_path");
    private ArrayList<Laptop> dsLaptop;
    public Quanly(){
        this.dsLaptop = new ArrayList<Laptop>();
    }
    public void themLaptop(int so_luong){
        Laptop newlaptop = null;
        for(int i=0; i<so_luong; i++) {
            System.out.println("------------------");
            newlaptop = new Laptop();
            // Laptop
            System.out.print(">> " + String.valueOf(Lib.getlang("ENTER_PARAMETERS_OF_LAPTOP")) + " " + String.valueOf(i+1) + ":\n");
            newlaptop.nhapTTLaptop(this.dsLaptop);
            // CPU
            CPU newCPU = new CPU();
            newCPU.nhapTTCPU(newlaptop.getDong_laptop());
            newlaptop.dsCPU.add(newCPU);
            // RAM
            RAM newRAM = new RAM();
            newRAM.nhapTTRam(newlaptop.getDong_laptop());
            newlaptop.dsRAM.add(newRAM);
            // Screen
            Screen newScreen = new Screen();
            newScreen.nhapTTScreen(newlaptop.getDong_laptop());
            newlaptop.dsScreen.add(newScreen);
            // HardDisk
            int n = (int)Lib.int_input(">> " + Lib.getlang("NUMBER_OF_HARDDISK"),null,false,true,false);
            for(int ii = 0; ii<n; ii++){
                System.out.println(">> " + Lib.getlang("HARDDISK") + " " + String.valueOf(ii+1) + ":");
                HardDisk newHardDisk = new HardDisk();
                newHardDisk.nhapTTHardDisk(newlaptop.getDong_laptop());
                newlaptop.dsHardDisk.add(newHardDisk);
            }
            //
            if(Lib.yes_or_no(Lib.getlang("SAVE").toLowerCase())){
                this.dsLaptop.add(newlaptop);
                System.out.print(">> " + Lib.getlang("SAVE_COMPLETED") + "\n");
            }
        }
    }
    
    private void menu_edit(Laptop i) {
        System.out.println(
            " >> Laptop: " 
            + String.valueOf(i.getMa_laptop()) 
            + " - " 
            + String.valueOf(i.getTen_laptop())
        );
        
        System.out.println(" " + Lib.getlang("SEL_ITEM_EDIT"));
        System.out.println("1. " + Lib.getlang("LAPTOP_SERIES") + " (" + String.valueOf(i.getnameDong_laptop()) + ")");
        System.out.println("2. " + Lib.getlang("LAPTOP_CODE") + " (" + String.valueOf(i.getMa_laptop()) + ")");
        System.out.println("3. " + Lib.getlang("LAPTOP_NAME") + " (" + String.valueOf(i.getTen_laptop()) + ")");
        System.out.print("4. " + Lib.getlang("CPU"));
        if(i.dsCPU.isEmpty()) System.out.print(" (NO DATA)");
        System.out.print("\n5. " + Lib.getlang("RAM"));
        if(i.dsRAM.isEmpty()) System.out.print(" (NO DATA)");
        System.out.print("\n6. " + Lib.getlang("SCREEN"));
        if(i.dsScreen.isEmpty()) System.out.print(" (NO DATA)");
        System.out.print("\n7. " + Lib.getlang("HARDDISK"));
        if(i.dsHardDisk.isEmpty()) System.out.print(" (NO DATA)");
        System.out.println("\n0. " + Lib.getlang("BACK"));
    }
    
    public void suaTTLaptop() {
        if(Lib.isNotEmpty(this.dsLaptop)) {
            Lib.printAll(this.dsLaptop);
            System.out.println("------------------");
            System.out.print(Lib.getlang("INPUT") + " " + Lib.getlang("LAPTOP_CODE") + ": ");
            int[] info = Lib.kt_ma_laptop(this.dsLaptop, Lib.str_input());
            if(info[0] == 0){
                System.out.print("!! " + Lib.getlang("LAPTOP_CODE_NOT_EXIST") + "\n");
                Lib.pause_console();
                return;
            }
            Laptop oldlaptop = this.dsLaptop.get(info[1]);
            Laptop newlaptop = null;
            int n;
            while(true) {
                newlaptop = new Laptop();
                Lib.clear_console();
                menu_edit(oldlaptop);
                n = (int)Lib.int_input(Lib.getlang("CHOOSE"),null,false,false,false);
                Lib.clear_console();
                switch(n) {
                    case 1:
                        System.out.println("!! " + Lib.getlang("WARNING") + ": " + Lib.getlang("WARNING001"));
                        System.out.println(">> " + Lib.getlang("LAPTOP_SERIES") + " " + Lib.getlang("CURRENT").toLowerCase() + ": " + String.valueOf(oldlaptop.getnameDong_laptop()));
                        newlaptop.nhapDongLaptop();
                        if(Lib.yes_or_no(Lib.getlang("SAVE").toLowerCase())){
                            if(oldlaptop.getDong_laptop() != newlaptop.getDong_laptop()) {
                                oldlaptop.setDong_laptop(newlaptop.getDong_laptop());
                                oldlaptop.reset_dsALL();
                                System.out.print(" !! " + Lib.getlang("WARNING") + ": " + Lib.getlang("RESET_INFORMATION_COMPLETED") + "!\n");
                            }
                            System.out.print(">> " + Lib.getlang("SAVE_COMPLETED") + "\n");
                            Lib.pause_console();
                        }
                        break;
                    case 2:
                        System.out.println(">> " + Lib.getlang("LAPTOP_CODE") + " " + Lib.getlang("CURRENT").toLowerCase() + ": " + String.valueOf(oldlaptop.getMa_laptop()));
                        newlaptop.nhapMaLaptop(this.dsLaptop);
                        if(Lib.yes_or_no(Lib.getlang("SAVE").toLowerCase())){
                            oldlaptop.setMa_laptop(newlaptop.getMa_laptop());
                            System.out.print(">> " + Lib.getlang("SAVE_COMPLETED") + "\n");
                            Lib.pause_console();
                        }
                        break;
                    case 3:
                        System.out.println(">> " + Lib.getlang("LAPTOP_NAME") + " " + Lib.getlang("CURRENT").toLowerCase() + ": " + String.valueOf(oldlaptop.getTen_laptop()));
                        newlaptop.nhapTenLaptop();
                        if(Lib.yes_or_no(Lib.getlang("SAVE").toLowerCase())){
                            oldlaptop.setTen_laptop(newlaptop.getTen_laptop());
                            System.out.print(">> " + Lib.getlang("SAVE_COMPLETED") + "\n");
                            Lib.pause_console();
                        }
                        break;
                    case 4:
                        System.out.print(">> " + Lib.getlang("CPU") + " " + Lib.getlang("CURRENT").toLowerCase() + ": " + String.valueOf(Lib.gettext_cpu(oldlaptop, false)));
                        CPU newCPU = new CPU();
                        newCPU.nhapTTCPU(oldlaptop.getDong_laptop());
                        newlaptop.dsCPU.add(newCPU);
                        if(Lib.yes_or_no(Lib.getlang("SAVE").toLowerCase())){
                            oldlaptop.dsCPU = newlaptop.dsCPU;
                            System.out.print(">> " + Lib.getlang("SAVE_COMPLETED") + "\n");
                            Lib.pause_console();
                        }
                        break;
                    case 5:
                        System.out.print(">> " + Lib.getlang("RAM") + " " + Lib.getlang("CURRENT").toLowerCase() + ": " + String.valueOf(Lib.gettext_ram(oldlaptop, false)));
                        RAM newRAM = new RAM();
                        newRAM.nhapTTRam(oldlaptop.getDong_laptop());
                        newlaptop.dsRAM.add(newRAM);
                        if(Lib.yes_or_no(Lib.getlang("SAVE").toLowerCase())){
                            oldlaptop.dsRAM = newlaptop.dsRAM;
                            System.out.print(">> " + Lib.getlang("SAVE_COMPLETED") + "\n");
                            Lib.pause_console();
                        }
                        break;
                    case 6:
                        System.out.print(">> " + Lib.getlang("SCREEN") + " " + Lib.getlang("CURRENT").toLowerCase() + ": " + String.valueOf(Lib.gettext_screen(oldlaptop, false)));
                        Screen newScreen = new Screen();
                        newScreen.nhapTTScreen(oldlaptop.getDong_laptop());
                        newlaptop.dsScreen.add(newScreen);
                        if(Lib.yes_or_no(Lib.getlang("SAVE").toLowerCase())){
                            oldlaptop.dsScreen = newlaptop.dsScreen;
                            System.out.print(">> " + Lib.getlang("SAVE_COMPLETED") + "\n");
                            Lib.pause_console();
                        }
                        break;
                    case 7:
                        System.out.print(">> " + Lib.getlang("HARDDISK") + " " + Lib.getlang("CURRENT").toLowerCase() + ": " + String.valueOf(Lib.gettext_cpu(oldlaptop, false)));
                        n = (int)Lib.int_input(">> Số lượng ổ cứng",null,false,true,false);
                        for(int ii = 0; ii<n; ii++){
                            System.out.println(">> Ổ cứng " + String.valueOf(ii+1) + ":");
                            HardDisk newHardDisk = new HardDisk();
                            newHardDisk.nhapTTHardDisk(oldlaptop.getDong_laptop());
                            newlaptop.dsHardDisk.add(newHardDisk);
                        }
                        if(Lib.yes_or_no(Lib.getlang("SAVE").toLowerCase())){
                            oldlaptop.dsHardDisk = newlaptop.dsHardDisk;
                            System.out.print(">> " + Lib.getlang("SAVE_COMPLETED") + "\n");
                            Lib.pause_console();
                        }
                        break;
                    case 0:
                        return;
                    default:
                        continue;
                }
            }
        } else {
            System.out.println("!! " + Lib.getlang("LIST_EMPTY"));
        }
    }
    
    public void xoaTTLaptop() {
        if(Lib.isNotEmpty(this.dsLaptop)) {
            while(true) {
                Lib.clear_console();
                System.out.print("1. " + Lib.getlang("DEL_WITH_LAPTOP_CODE") + "\n2. " + Lib.getlang("DEL_ALL_LAPTOP") + "\n0. " + Lib.getlang("BACK") + "\n");
                switch((int)Lib.int_input(Lib.getlang("CHOOSE"), null, false, false, false)) {
                    case 1:
                        Lib.clear_console();
                        Lib.printAll(this.dsLaptop);
                        System.out.print(Lib.getlang("INPUT") + " " + Lib.getlang("LAPTOP_CODE") + ": ");
                        int[] info = Lib.kt_ma_laptop(this.dsLaptop, Lib.str_input());
                        if(info[0] == 0){
                            System.out.print("!! " + Lib.getlang("INVALID_LAPTOP_CODE") + "\n");
                            return;
                        }
                        System.out.println("------------------");
                        System.out.print(Lib.getlang("LAPTOP_NAME") + ": " + String.valueOf(this.dsLaptop.get(info[1]).getTen_laptop()) + "\n");
                        if(Lib.yes_or_no(Lib.getlang("DEL_LAPTOP"))){
                            ArrayList<Laptop> dsTam = new ArrayList<Laptop>();
                            int count = 0;
                            for(Laptop i : this.dsLaptop) {
                                if(count == info[1]){
                                    count++;
                                    continue;
                                }
                                dsTam.add(i);
                                count++;
                            }  
                            this.dsLaptop = dsTam;
                            System.out.print(">> " + Lib.getlang("DEL_COMPLETED") + "\n");
                        }
                        break;
                    case 2:
                        Lib.clear_console();
                        Lib.printAll(this.dsLaptop);
                        if(Lib.yes_or_no(Lib.getlang("DEL_ALL_LAPTOP"))){
                            this.dsLaptop = new ArrayList<Laptop>();
                            System.out.print(">> " + Lib.getlang("DEL_ALL_COMPLETED") + "\n");
                        }
                        break;
                    case 0:
                        return;
                    default:
                        continue;
                }
            }
        } else {
            System.out.println("!! " + Lib.getlang("LIST_EMPTY"));
        }
    }
    
    public void xemTTLaptop(){
        String full_str = Lib.gettext(this.dsLaptop, false);
        if(full_str == null) {
            return;
        } else {
            System.out.print(full_str);
        }
    }
    
    public void xuatTT2File() throws IOException{
        if(Lib.isNotEmpty(this.dsLaptop)) {
            Lib.fwrite("ds_laptop.txt", Lib.gettext(this.dsLaptop, false), false);
            System.out.print(">> " + Lib.getlang("EXPORT_COMPLETED") + " [ds_laptop.txt]\n");
        } else {
            System.out.println("!! " + Lib.getlang("LIST_EMPTY"));
        }
    }
    
    public void nhapCONF() {
        int count = 1;
        int count2;
        Laptop newLaptop = null;
        String name = "";
        String tmpStr = "";
        String[] tmp = {};
        String[] tmp2 = {};
        String[] list_target = {"series", "code", "name", "cpu", "ram", "screen", "harddisk"};
        System.out.println(">> Các file data tại [" + this.conf_path + "]");
        for(String s : Lib.lsdir(this.conf_path)) {
            if(s.contains(".conf")) {
                System.out.println("=> " + s.substring(0, s.length() - 5));
            }
        }
        System.out.println("------------------");
        // input file name conflaptopbut
        String str = this.conf_path + Lib.str_input(Lib.getlang("INPUT_FILE_NAME") + ": ") + ".conf";
        tmp = Lib.read_data(str, "CONFIG", false, false);
        if(tmp == null) {
            System.out.println("!! " + Lib.getlang("DATA_ERROR"));
            return;
        } else if(!tmp[0].equals("Hoa_Don_Laptop")) {
            System.out.println("!! " + Lib.getlang("DATA_ERROR"));
            return;
        }
        System.out.println(">> " + Lib.getlang("PROCESS_DATA") + "....");
        while(true) {
            newLaptop = new Laptop();
            for(String target : list_target) {
                name = target + String.valueOf(count);
                tmp = Lib.read_data(str, name, false, true);
                if(tmp == null) {
                    System.out.println("\n>>" + Lib.getlang("IMPORT_CONFIG_COMPLETED"));
                    return;
                }
                if(tmp.length <= 0) continue;
                // series
                if(target.equals(list_target[0])) {
                    newLaptop.setDong_laptop(Lib.getIndexArr(Lib.read_data("laptop_type"), tmp[0]) + 1);
                }
                // code
                if(target.equals(list_target[1])) {
                    tmpStr = Lib.arrToString(tmp);
                    int[] info = Lib.kt_ma_laptop(this.dsLaptop, tmpStr);
                    if(info[0]==1){
                        System.out.println("!! " + Lib.getlang("LAPTOP_CODE_EXIST") + " [" + Lib.getlang("LAPTOP_CODE") + ": " + tmpStr + "]");
                        if(Lib.yes_or_no(Lib.getlang("CHANGE_LAPTOP_CODE").toLowerCase())) {
                            newLaptop.nhapMaLaptop(this.dsLaptop);
                            continue;
                        } else {
                            return;
                        }
                    } else {
                        System.out.println(" - " + Lib.getlang("LAPTOP_CODE") + ": " + tmpStr);
                    }
                    newLaptop.setMa_laptop(tmpStr);
                }
                // name
                if(target.equals(list_target[2])) {
                    newLaptop.setTen_laptop(Lib.arrToString(tmp));
                }
                // cpu
                if(target.equals(list_target[3])) {
                    for(String cpu : tmp) {
                        if(cpu.isBlank()) continue;
                        tmp2 = cpu.split("/");
                        CPU newCPU = new CPU(
                                tmp2[0],
                                tmp2[1],
                                tmp2[2],
                                Long.valueOf(tmp2[3])
                        );
                        newLaptop.dsCPU.add(newCPU);
                    }
                }
                // ram
                if(target.equals(list_target[4])) {
                    int len_ram = 0;
                    for(String ram : tmp) {
                        if(ram.isBlank()) continue;
                        len_ram++;
                    }
                    String[] ma_ram = new String[len_ram];
                    count2 = 0;
                    for(String ram : tmp) {
                        if(ram.isBlank()) continue;
                        tmp2 = ram.split("/");
                        ma_ram[count2] = tmp2[0];
                        count2++;
                    }
                    RAM newRAM = new RAM(
                            len_ram,
                            ma_ram,
                            tmp2[1],
                            Integer.valueOf(tmp2[2]),
                            Long.valueOf(tmp2[3])
                    );
                    newLaptop.dsRAM.add(newRAM);
                }
                // Screen
                if(target.equals(list_target[5])) {
                    for(String screen : tmp) {
                        if(screen.isBlank()) continue;
                        tmp2 = screen.split("/");
                        Screen newScreen = new Screen(
                                tmp2[0],
                                tmp2[1],
                                tmp2[2],
                                Long.valueOf(tmp2[4]),
                                Integer.valueOf(tmp2[3])
                        );
                        newLaptop.dsScreen.add(newScreen);
                    }
                }
                // HardDisk
                if(target.equals(list_target[6])) {
                    for(String harddisk : tmp) {
                        if(harddisk.isBlank()) continue;
                        tmp2 = harddisk.split("/");
                        HardDisk newHardDisk = new HardDisk(
                                tmp2[0],
                                tmp2[1],
                                Long.valueOf(tmp2[6]),
                                Integer.valueOf(tmp2[2]),
                                Integer.valueOf(tmp2[5]),
                                Integer.valueOf(tmp2[3]),
                                Integer.valueOf(tmp2[4])
                        );
                        newLaptop.dsHardDisk.add(newHardDisk);
                    }
                }
            }
            this.dsLaptop.add(newLaptop);
            count++;
        }
    }
    
    public void xuatCONF() throws IOException {
        if(Lib.isNotEmpty(this.dsLaptop)) {
            String str = this.conf_path + Lib.str_input(Lib.getlang("INPUT_FILE_NAME") + ": ") + ".conf";
            Lib.fwrite(str, 
                            "CONFIG = Hoa_Don_Laptop"
                            + "\n" 
                            + Lib.gettext(this.dsLaptop, true), 
                    false
            );
            System.out.print(">> " + Lib.getlang("EXPORT_CONFIG_COMPLETED") + " [" + str + "]\n");
        } else {
            System.out.println("!! " + Lib.getlang("LIST_EMPTY"));
        }
    }
    
    public static void menu(){
        System.out.print(" >> " + Lib.getlang("MAIN_PROGRAM") + " <<\n\n");
        System.out.print("1. " + Lib.getlang("ADD_LAPTOP_INFO") + "\n");
        System.out.print("2. " + Lib.getlang("EDIT_LAPTOP_INFO") + "\n");
        System.out.print("3. " + Lib.getlang("VIEW_LAPTOP_INFO") + "\n");
        System.out.print("4. " + Lib.getlang("DEL_LAPTOP_INFO") + "\n");
        System.out.print("5. " + Lib.getlang("EXPORT_LAPTOP_INFO") + "\n");
        System.out.print("6. " + Lib.getlang("IMPORT_LAPTOP_CONFIG") + "\n");
        System.out.print("7. " + Lib.getlang("EXPORT_LAPTOP_CONFIG") + "\n");
        System.out.print("8. " + Lib.getlang("EXIT_PROGRAM") + "\n\n");
    }
}
