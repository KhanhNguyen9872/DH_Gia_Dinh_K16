import java.io.IOException;
public class Main {
    public static void main(String args[]) throws IOException{
        Quanly dsLaptop = new Quanly();
        int choose = 0;
        while(true){
            lib.clear_console();
            Quanly.menu();
            System.out.print("Lựa chọn: ");
            try {
                choose = lib.keyboard.nextInt();
            } catch (Exception e) {
                lib.keyboard.next();
                continue;
            }
            lib.clear_console();
            switch(choose) {
                case 1:
                    dsLaptop.themLaptop((int)lib.int_input("Số lượng Laptop", null, false, true,false));
                    lib.pause_console();
                    break;
                case 2:
                    dsLaptop.suaTTLaptop();
                    break;
                case 3:
                    dsLaptop.xemTTLaptop();
                    lib.pause_console();
                    break;
                case 4:
                    dsLaptop.xoaTTLaptop();
                    lib.pause_console();
                    break;
                case 5:
                    dsLaptop.xuatTT2File();
                    lib.pause_console();
                    break;
                case 6:
                    lib.clear_console();
                    System.exit(0);
                default:
                    continue;
            }
        }
    }
}
