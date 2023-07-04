import java.io.IOException;
import java.io.PrintStream;

public class Main {
    public static void main(String args[]) throws IOException{
        System.setOut(new PrintStream(System.out, true, "UTF8"));
        Lib.read_config(null);
        Lib.read_data(null);
        Lib.load_language();
        Quanly quanLy = new Quanly();
        int choose = 0;
        while(true){
            Lib.clear_console();
            Quanly.menu();
            System.out.print(Lib.getlang("CHOOSE") + ": ");
            try {
                choose = Lib.keyboard.nextInt();
            } catch (Exception e) {
                Lib.keyboard.next();
                continue;
            }
            Lib.clear_console();
            switch(choose) {
                case 1:
                    System.out.println(Lib.getlang("PRESS_0_TO_BACK"));
                    System.out.println("------------------");
                    quanLy.themLaptop((int)Lib.int_input(Lib.getlang("NUMBER_OF_LAPTOP"), null, false, false,false));
                    Lib.pause_console();
                    break;
                case 2:
                    quanLy.suaTTLaptop();
                    break;
                case 3:
                    quanLy.xemTTLaptop();
                    Lib.pause_console();
                    break;
                case 4:
                    quanLy.xoaTTLaptop();
                    Lib.pause_console();
                    break;
                case 5:
                    quanLy.xuatTT2File();
                    Lib.pause_console();
                    break;
                case 6:
                    quanLy.nhapCONF();
                    Lib.pause_console();
                    break;
                case 7:
                    quanLy.xuatCONF();
                    Lib.pause_console();
                    break;
                case 8:
                    Lib.clear_console();
                    if(Lib.yes_or_no(Lib.getlang("EXIT").toLowerCase())) {
                        System.exit(0);
                    }
                default:
                    continue;
            }
        }
    }
}
