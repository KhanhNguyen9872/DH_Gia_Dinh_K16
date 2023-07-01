import java.io.IOException;
import java.util.Scanner;

public class Main {
    public static Scanner keyboard = new Scanner(System.in, "UTF-8");
    protected static void clear_console(){
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    }
    protected static String str_input(){
        return Main.keyboard.next() + Main.keyboard.nextLine();
    }
    protected static void pause_console(){
        System.out.print("\n>> Nhấn Enter để tiếp tục! ");
        Main.keyboard.nextLine();
        Main.keyboard.nextLine();
    }
    public static void main(String args[]) throws IOException{
        Quanly dsLaptop = new Quanly();
        int choose = 0;
        while(true){
            clear_console();
            Quanly.menu();
            System.out.print("Lựa chọn: ");
            try {
                choose = Main.keyboard.nextInt();
            } catch (Exception e) {
                Main.keyboard.next();
                continue;
            }
            clear_console();
            switch(choose) {
                case 1:
                    dsLaptop.themLaptop(Quanly.int_input("Số lượng Laptop", null, false, true));
                    pause_console();
                    break;
                case 2:
                    dsLaptop.suaTTLaptop();
                    pause_console();
                    break;
                case 3:
                    dsLaptop.xemTTLaptop();
                    pause_console();
                    break;
                case 4:
                    dsLaptop.xoaTTLaptop();
                    pause_console();
                    break;
                case 5:
                    dsLaptop.xuatTT2File();
                    pause_console();
                    break;
                case 6:
                    clear_console();
                    System.exit(0);
                default:
                    continue;
            }
        }
    }
}
