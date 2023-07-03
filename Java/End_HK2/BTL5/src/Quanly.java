
import java.io.IOException;
import java.util.ArrayList;

public class Quanly {
    ArrayList<Laptop> dsLaptop;
    public Quanly(){
        this.dsLaptop = new ArrayList<Laptop>();
    }
    public void themLaptop(int so_luong){
        Laptop newlaptop = null;
        for(int i=0; i<so_luong; i++) {
            System.out.println("------------------------");
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
        System.out.println("4. " + Lib.getlang("CPU"));
        System.out.println("5. " + Lib.getlang("RAM"));
        System.out.println("6. " + Lib.getlang("SCREEN"));
        System.out.println("7. " + Lib.getlang("HARDDISK"));
        System.out.println("0. " + Lib.getlang("BACK"));
    }
    
    public void suaTTLaptop() {
        if(Lib.isNotEmpty(this.dsLaptop)) {
            Lib.printAll(this.dsLaptop);
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
                        System.out.println("!! WARNING: " + Lib.getlang("WARNING001"));
                        System.out.println(">> " + Lib.getlang("LAPTOP_SERIES") + " " + Lib.getlang("CURRENT").toLowerCase() + ": " + String.valueOf(oldlaptop.getnameDong_laptop()));
                        newlaptop.nhapDongLaptop();
                        if(Lib.yes_or_no(Lib.getlang("SAVE").toLowerCase())){
                            if(oldlaptop.getDong_laptop() != newlaptop.getDong_laptop()) {
                                oldlaptop.setDong_laptop(newlaptop.getDong_laptop());
                                oldlaptop.reset_dsALL();
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
                        Lib.printAll(this.dsLaptop);
                        System.out.print(Lib.getlang("INPUT") + Lib.getlang("LAPTOP_CODE") + ": ");
                        int[] info = Lib.kt_ma_laptop(this.dsLaptop, Lib.str_input());
                        if(info[0] == 0){
                            System.out.print("!! " + Lib.getlang("INVALID_LAPTOP_CODE") + "\n");
                            return;
                        }
                        System.out.println("----------------");
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
                    case 2:
                        if(Lib.yes_or_no(Lib.getlang("DEL_ALL_LAPTOP"))){
                            this.dsLaptop = new ArrayList<Laptop>();
                            System.out.print(">> " + Lib.getlang("DEL_ALL_COMPLETED") + "\n");
                        }
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
            Lib.write("ds_laptop.txt", Lib.gettext(this.dsLaptop, false));
            System.out.print(">> " + Lib.getlang("EXPORT_COMPLETED") + " [ds_laptop.txt]\n");
        } else {
            System.out.println("!! " + Lib.getlang("LIST_EMPTY"));
        }
    }
    
    public void nhapCONF() {
        
    }
    
    public void xuatCONF() throws IOException {
        if(Lib.isNotEmpty(this.dsLaptop)) {
            String str = Lib.str_input(Lib.getlang("INPUT_FILE_NAME") + ": ");
            Lib.write(str + ".conf", Lib.gettext(this.dsLaptop, true));
            System.out.print(">> " + Lib.getlang("EXPORT_CONFIG_COMPLETED") + " [" + String.valueOf(str) + ".conf]\n");
        } else {
            System.out.println("!! " + Lib.getlang("LIST_EMPTY"));
        }
    }
    
    public static void menu(){
        System.out.print(" >> " + Lib.getlang("MANAGE_LAPTOP_BILLS") + " <<\n\n");
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
