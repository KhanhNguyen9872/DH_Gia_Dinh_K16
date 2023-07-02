import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;

public class Quanly {
    ArrayList<Laptop> dsLaptop;
    public Quanly(){
        this.dsLaptop = new ArrayList<Laptop>();
    }
    protected static boolean yes_or_no(String name) {
        String user_inp;
        while(true) {
            System.out.print(">> Bạn có muốn " + name + " không? [Y/n]: ");
            user_inp = Main.str_input();
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
                    var = Main.keyboard.nextLong();
                } else {
                    var = Main.keyboard.nextInt();
                }
            } catch (Exception e) {
                System.out.println("!! Vui lòng nhập số!");
                Main.keyboard.next();
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
    private int[] kt_ma_laptop(String ma_laptop) {
        int count = 0;
        int[] info = {0, 0};
        for (Laptop i: this.dsLaptop){
            if(i.getMa_laptop().equals(ma_laptop)){
                info[0] = 1;
                info[1] = count;
            }
            count++;
        }
        return info;
    }
    public void themLaptop(int so_luong){
        Laptop newlaptop = null;
        String tmp;
        for(int i=0; i<so_luong; i++) {
            System.out.println("------------------------");
            newlaptop = new Laptop();
            System.out.print(">> Nhập thông số laptop thứ " + String.valueOf(i+1) + ":\n");
            while(true) {
                System.out.print("Dòng laptop (1 - Butterfly, 2 - Fly, 3 - Bee): ");
                try {
                    if (newlaptop.setDong_laptop(Main.keyboard.nextInt())) {
                        break;
                    }
                } catch (Exception e) {
                    System.out.println("!! Vui lòng nhập số!");
                }
            }
            while(true) {
                System.out.print("Mã laptop: ");
                tmp = Main.str_input();
                int[] info = kt_ma_laptop(tmp);
                if(info[0]==1){
                    System.out.println("!! Mã laptop này đã tồn tại!");
                    continue;
                }
                newlaptop.setMa_laptop(tmp);
                break;
            }
            System.out.print("Tên laptop: ");
            newlaptop.setTen_laptop(Main.str_input());
            // CPU
            CPU newCPU = new CPU();
            newCPU.nhapTTCPU(newlaptop.getDong_laptop());
            newlaptop.dsCPU.add(newCPU);
            // RAM
            RAM newRAM = new RAM();
            newRAM.nhapTTRam();
            newlaptop.dsRAM.add(newRAM);
            // Screen
            Screen newScreen = new Screen();
            newScreen.nhapTTScreen(newlaptop.getDong_laptop());
            newlaptop.dsScreen.add(newScreen);
            // HardDisk
            int n = (int)int_input(">> Số lượng ổ cứng",null,false,true,false);
            for(int ii = 0; ii<n; ii++){
                System.out.println(">> Ổ cứng " + String.valueOf(ii+1) + ":");
                HardDisk newHardDisk = new HardDisk();
                newHardDisk.nhapTTHardDisk(newlaptop.getDong_laptop());
                newlaptop.dsHardDisk.add(newHardDisk);
            }
            //
            if(yes_or_no("lưu")){
                this.dsLaptop.add(newlaptop);
                System.out.print(">> Đã lưu!\n");
            }
        }
    }
    
    public void xemTTLaptop(){
        if(this.dsLaptop.size() > 0) {
            int count = 1, count2;
            for (Laptop i: this.dsLaptop) {
                System.out.println("-------------------");
                System.out.print(" >> Laptop thứ " + String.valueOf(count) + "\n");
                System.out.print("- Dòng máy: " + String.valueOf(i.getnameDong_laptop()) + "\n");
                System.out.print("- Mã: " + String.valueOf(i.getMa_laptop()) + "\n");
                System.out.print("- Tên: " + String.valueOf(i.getTen_laptop()) + "\n");

                System.out.print("- CPU: ");
                for(CPU j : i.dsCPU) {
                    System.out.print(
                        String.valueOf(j.getMa_cpu()) 
                        + " - " 
                        + String.valueOf(j.getHang_cpu()) 
                        + " " 
                        + String.valueOf(j.getLoai_cpu())
                    );
                }
                System.out.println();
                
                count2 = 1;
                System.out.print("- RAM: \n");
                for(RAM j : i.dsRAM) {
                    for(String z : j.getMa_ram()) {
                        System.out.print(
                            "  "
                            + String.valueOf(count2)
                            + ". "
                            + String.valueOf(z) 
                            + " - " 
                            + String.valueOf(j.getLoai_ram()) 
                            + " - " 
                            + String.valueOf(j.getDung_luong()) 
                            + " GB"
                        );
                        System.out.println();
                        count2++;
                    }
                }
                
                System.out.print("- Màn hình: ");
                for(Screen j : i.dsScreen) {
                    System.out.print(
                            String.valueOf(j.getMa_manhinh())
                            + " - "
                            + String.valueOf(j.getHang_sanxuat())
                            + " - "
                            + String.valueOf(j.getDo_phangiai())
                            + " - "
                            + String.valueOf(j.getDon_gia())
                    );
                    if(j.getChong_loa() != 0) {
                        System.out.print(
                                " - "
                                + String.valueOf(j.getChong_loa())
                        );
                    }
                    System.out.println();
                }
                
                count2 = 1;
                System.out.print("- Ổ cứng: \n");
                for(HardDisk j : i.dsHardDisk) {
                    System.out.print(
                            "  " 
                            + String.valueOf(count2)
                            + ". "
                            + String.valueOf(j.getMa_ocung())
                            + " - " + String.valueOf(j.getKieu_ocung()) 
                            + " (" 
                            + String.valueOf(j.getDung_luong())
                            + " GB)"
                    );
                    if(j.getKieu_ocung().equals("HDD")) {
                        System.out.print(
                                " - [" 
                                + String.valueOf(j.getSo_vong_quay()) 
                                + "rpm]"
                        );
                    } else if(j.getKieu_ocung().equals("SSD")) {
                        System.out.print(
                                " - [R: " 
                                + String.valueOf(j.getToc_do_doc()) 
                                + " MB/s - W: " 
                                + String.valueOf(j.getToc_do_ghi()) + " MB/s]"
                        );
                    }
                    System.out.println();
                    count2++;
                }
                System.out.println();
                System.out.println(">> Tổng giá: " + String.valueOf(i.getTong_gia()) + " USD");
                count++;
            }
            System.out.println("-------------------");
        } else {
            System.out.println("!! Danh sách trống!");
        }
    }
    
    public void suaTTLaptop() {
        if(this.dsLaptop.size() > 0) {
            System.out.print("Nhập mã laptop: ");
            int[] info = kt_ma_laptop(Main.str_input());
            if(info[0] == 0){
                System.out.print("!! Mã laptop này không tồn tại!\n");
                return;
            }
            Laptop i = this.dsLaptop.get(info[1]);
            Laptop j = new Laptop();
            System.out.println("----------------");
            System.out.println(">> Dòng máy hiện tại: " + String.valueOf(i.getnameDong_laptop()));
            while(true) {
                System.out.print("Dòng laptop (1 - Butterkeyboardfly, 2 - Fly, 3 - Bee): ");
                try {
                    if (j.setDong_laptop(Main.keyboard.nextInt())) {
                        break;
                    }
                } catch (Exception e) {
                    System.out.println("!! Vui lòng nhập số!");
                }
            }
            System.out.println(">> Mã hiện tại: " + String.valueOf(i.getMa_laptop()));
            System.out.print("Mã laptop: ");
            j.setMa_laptop(Main.str_input());
            System.out.println(">> Tên hiện tại: " + String.valueOf(i.getTen_laptop()));
            System.out.print("Tên laptop: ");
            j.setTen_laptop(Main.str_input());
            if(yes_or_no("lưu")){
                i.setDong_laptop(j.getDong_laptop());
                i.setMa_laptop(j.getMa_laptop());
                i.setTen_laptop(j.getTen_laptop());
                System.out.print(">> Đã lưu!\n");
            }
        } else {
            System.out.println("!! Danh sách trống!");
        }
    }
    
    public void xoaTTLaptop() {
        if(this.dsLaptop.size() > 0) {
            System.out.print("Nhập mã laptop: ");
            int[] info = kt_ma_laptop(Main.str_input());
            if(info[0] == 0){
                System.out.print("!! Mã laptop này không tồn tại!\n");
                return;
            }
            System.out.println("----------------");
            System.out.print("Tên Laptop: " + String.valueOf(this.dsLaptop.get(info[1]).getTen_laptop()) + "\n");
            if(yes_or_no("xóa Laptop")){
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
                System.out.print(">> Đã xóa!\n");
            }
        } else {
            System.out.println("!! Danh sách trống!");
        }
    }
    
    private String gettext(){
        int count = 1;
        String str = "";
        for(Laptop i : this.dsLaptop) {
            str += ">> Laptop thứ " + String.valueOf(count) + ": \n";
            str += "Laptop: " 
                    + String.valueOf(i.getMa_laptop()) 
                    + " " + String.valueOf(i.getnameDong_laptop()) 
                    + " " + String.valueOf(i.getTong_gia()) 
                    + "\n";
            // CPU
            str += "CPU: ";
            for(CPU j : i.dsCPU) {
                str += String.valueOf(j.getMa_cpu()) 
                        + ", " 
                        + String.valueOf(j.getLoai_cpu()) 
                        + ", Intel " 
                        + String.valueOf(j.getDon_gia()) 
                        + ", ";
            }
            str += "\n";
            // RAM
            str += "RAM: ";
            for(RAM j : i.dsRAM) {
                for(String z : j.getMa_ram()) {
                    str += "(" 
                            + String.valueOf(z) 
                            + ", " 
                            + String.valueOf(j.getLoai_ram()) 
                            + ", Intel " 
                            + String.valueOf(j.getDung_luong()) 
                            + ") ";
                }
                str += ", " 
                        + String.valueOf(j.getSo_luong()) 
                        + ", " 
                        + String.valueOf(j.getDon_gia());
            }
            str += "\n";
            count++;
        }
        return str;
    }
    
    public void xuatTT2File() throws IOException{
        if(this.dsLaptop.size() > 0) {
            Writer output;
            output = new BufferedWriter(new FileWriter("ds_laptop.txt",true));
            output.append(gettext());
            output.close();
            System.out.print(">> Đã xuất file!\n");
        } else {
            System.out.println("!! Danh sách trống!");
        }
    }
    
    public static void menu(){
        System.out.print(" >> QUẢN LÝ HÓA ĐƠN LAPTOP <<\n\n");
        System.out.print("1. Nhập thông tin Laptop\n");
        System.out.print("2. Sửa thông tin Laptop\n");
        System.out.print("3. Xem thông tin Laptop\n");
        System.out.print("4. Xóa thông tin Laptop\n");
        System.out.print("5. Xuất thông tin ra file\n");
        System.out.print("6. Thoát chương trình\n\n");
    }
}
