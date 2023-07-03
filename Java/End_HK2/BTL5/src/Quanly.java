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
    public void themLaptop(int so_luong){
        Laptop newlaptop = null;
        for(int i=0; i<so_luong; i++) {
            System.out.println("------------------------");
            newlaptop = new Laptop();
            // Laptop
            System.out.print(">> Nhập thông số laptop thứ " + String.valueOf(i+1) + ":\n");
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
            int n = (int)lib.int_input(">> Số lượng ổ cứng",null,false,true,false);
            for(int ii = 0; ii<n; ii++){
                System.out.println(">> Ổ cứng " + String.valueOf(ii+1) + ":");
                HardDisk newHardDisk = new HardDisk();
                newHardDisk.nhapTTHardDisk(newlaptop.getDong_laptop());
                newlaptop.dsHardDisk.add(newHardDisk);
            }
            //
            if(lib.yes_or_no("lưu")){
                this.dsLaptop.add(newlaptop);
                System.out.print(">> Đã lưu!\n");
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
        System.out.println(" Vui lòng chọn mục muốn sửa!");
        System.out.println("1. Dòng máy (" + String.valueOf(i.getnameDong_laptop()) + ")");
        System.out.println("2. Mã máy (" + String.valueOf(i.getMa_laptop()) + ")");
        System.out.println("3. Tên máy (" + String.valueOf(i.getTen_laptop()) + ")");
        System.out.println("4. CPU");
        System.out.println("5. RAM");
        System.out.println("6. Màn hình");
        System.out.println("7. Ổ cứng");
        System.out.println("0. Quay về trước");
    }
    
    public void suaTTLaptop() {
        if(lib.isNotEmpty(this.dsLaptop)) {
            lib.printAll(this.dsLaptop);
            System.out.print("Nhập mã laptop: ");
            int[] info = lib.kt_ma_laptop(this.dsLaptop, lib.str_input());
            if(info[0] == 0){
                System.out.print("!! Mã laptop này không tồn tại!\n");
                lib.pause_console();
                return;
            }
            Laptop oldlaptop = this.dsLaptop.get(info[1]);
            Laptop newlaptop = null;
            int n;
            while(true) {
                newlaptop = new Laptop();
                lib.clear_console();
                menu_edit(oldlaptop);
                n = (int)lib.int_input("Lựa chọn",null,false,false,false);
                lib.clear_console();
                switch(n) {
                    case 1:
                        System.out.println("!! WARNING: Các thông tin (CPU, RAM,...) sẽ bị đặt lại nếu bạn thay đổi!");
                        System.out.println(">> Dòng máy hiện tại: " + String.valueOf(oldlaptop.getnameDong_laptop()));
                        newlaptop.nhapDongLaptop();
                        if(lib.yes_or_no("lưu")){
                            if(oldlaptop.getDong_laptop() != newlaptop.getDong_laptop()) {
                                oldlaptop.setDong_laptop(newlaptop.getDong_laptop());
                                oldlaptop.reset_dsALL();
                            }
                            System.out.print(">> Đã lưu!\n");
                            lib.pause_console();
                        }
                        break;
                    case 2:
                        System.out.println(">> Mã hiện tại: " + String.valueOf(oldlaptop.getMa_laptop()));
                        newlaptop.nhapMaLaptop(this.dsLaptop);
                        if(lib.yes_or_no("lưu")){
                            oldlaptop.setMa_laptop(newlaptop.getMa_laptop());
                            System.out.print(">> Đã lưu!\n");
                            lib.pause_console();
                        }
                        break;
                    case 3:
                        System.out.println(">> Tên hiện tại: " + String.valueOf(oldlaptop.getTen_laptop()));
                        newlaptop.nhapTenLaptop();
                        if(lib.yes_or_no("lưu")){
                            oldlaptop.setTen_laptop(newlaptop.getTen_laptop());
                            System.out.print(">> Đã lưu!\n");
                            lib.pause_console();
                        }
                        break;
                    case 4:
                        System.out.print(">> CPU hiện tại: " + String.valueOf(lib.gettext_cpu(oldlaptop)));
                        CPU newCPU = new CPU();
                        newCPU.nhapTTCPU(oldlaptop.getDong_laptop());
                        newlaptop.dsCPU.add(newCPU);
                        if(lib.yes_or_no("lưu")){
                            oldlaptop.dsCPU = newlaptop.dsCPU;
                            System.out.print(">> Đã lưu!\n");
                            lib.pause_console();
                        }
                        break;
                    case 5:
                        System.out.print(">> RAM hiện tại: " + String.valueOf(lib.gettext_ram(oldlaptop)));
                        RAM newRAM = new RAM();
                        newRAM.nhapTTRam(oldlaptop.getDong_laptop());
                        newlaptop.dsRAM.add(newRAM);
                        if(lib.yes_or_no("lưu")){
                            oldlaptop.dsRAM = newlaptop.dsRAM;
                            System.out.print(">> Đã lưu!\n");
                            lib.pause_console();
                        }
                        break;
                    case 6:
                        System.out.print(">> Màn hình hiện tại: " + String.valueOf(lib.gettext_screen(oldlaptop)));
                        Screen newScreen = new Screen();
                        newScreen.nhapTTScreen(oldlaptop.getDong_laptop());
                        newlaptop.dsScreen.add(newScreen);
                        if(lib.yes_or_no("lưu")){
                            oldlaptop.dsScreen = newlaptop.dsScreen;
                            System.out.print(">> Đã lưu!\n");
                            lib.pause_console();
                        }
                        break;
                    case 7:
                        System.out.print(">> Ổ cứng hiện tại: " + String.valueOf(lib.gettext_cpu(oldlaptop)));
                        n = (int)lib.int_input(">> Số lượng ổ cứng",null,false,true,false);
                        for(int ii = 0; ii<n; ii++){
                            System.out.println(">> Ổ cứng " + String.valueOf(ii+1) + ":");
                            HardDisk newHardDisk = new HardDisk();
                            newHardDisk.nhapTTHardDisk(oldlaptop.getDong_laptop());
                            newlaptop.dsHardDisk.add(newHardDisk);
                        }
                        if(lib.yes_or_no("lưu")){
                            oldlaptop.dsHardDisk = newlaptop.dsHardDisk;
                            System.out.print(">> Đã lưu!\n");
                            lib.pause_console();
                        }
                        break;
                    case 0:
                        return;
                    default:
                        continue;
                }
            }
        } else {
            System.out.println("!! Danh sách trống!");
        }
    }
    
    public void xoaTTLaptop() {
        if(lib.isNotEmpty(this.dsLaptop)) {
            while(true) {
                lib.clear_console();
                System.out.print("1. Xóa theo mã Laptop\n2. Xóa tất cả Laptop\n0. Quay về trước\n");
                switch((int)lib.int_input("Lựa chọn", null, false, false, false)) {
                    case 1:
                        lib.printAll(this.dsLaptop);
                        System.out.print("Nhập mã laptop: ");
                        int[] info = lib.kt_ma_laptop(this.dsLaptop, lib.str_input());
                        if(info[0] == 0){
                            System.out.print("!! Mã laptop này không tồn tại!\n");
                            return;
                        }
                        System.out.println("----------------");
                        System.out.print("Tên Laptop: " + String.valueOf(this.dsLaptop.get(info[1]).getTen_laptop()) + "\n");
                        if(lib.yes_or_no("xóa Laptop")){
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
                    case 2:
                        if(lib.yes_or_no("xóa tất cả Laptop")){
                            this.dsLaptop = new ArrayList<Laptop>();
                            System.out.print(">> Đã xóa tất cả!\n");
                        }
                    case 0:
                        return;
                    default:
                        continue;
                }
            }
        } else {
            System.out.println("!! Danh sách trống!");
        }
    }
    
    public void xemTTLaptop(){
        String full_str = lib.gettext(this.dsLaptop);
        if(full_str == null) {
            return;
        } else {
            System.out.print(full_str);
        }
    }
    
    public void xuatTT2File() throws IOException{
        if(lib.isNotEmpty(this.dsLaptop)) {
            Writer output;
            output = new BufferedWriter(new FileWriter("ds_laptop.txt",false));
            output.append(lib.gettext(this.dsLaptop));
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
