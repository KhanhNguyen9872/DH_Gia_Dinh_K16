
import java.util.Scanner;

public class Main {
    private static Vehicle xe[] = new Vehicle[100];
    private static int soluong = 0;
    private static Scanner keyboard = new Scanner(System.in);
    
    private static void pause() {
        Main.keyboard.nextLine();
        Main.keyboard.nextLine();
    }
    
    private static void clear() {
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    }
    private static void nhapdulieu(Vehicle xe) {
        clear();
        try {
            System.out.print("Nhap ten chu xe [" + Main.soluong + "]: ");
            Main.keyboard.next();
            xe.setTenchuxe(Main.keyboard.nextLine());
            System.out.print("Nhap loat xe [" + Main.soluong + "]: ");
            xe.setLoaixe(Main.keyboard.nextLine());
            System.out.print("Nhap dung tich [" + Main.soluong + "]: ");
            xe.setDungtich(Main.keyboard.nextInt());
            System.out.print("Nhap tri gia [" + Main.soluong + "]: ");
            xe.setTrigia(Main.keyboard.nextFloat());
            Main.soluong++;
            System.out.println("\nNhap thong tin thanh cong!");
        } catch (Exception e) {
            System.out.print("\nSomething is error!\n");
        }
        pause();
    }
    private static void xuatdulieu() {
        clear();
        if(Main.soluong>0){
            System.out.print("Ten chu xe\t\t Loai xe\t Dung tich\t Tri gia\t Thue\n");
            System.out.println("==============================================================================");
            for(int i=0; i<Main.soluong; i++) {
                System.out.println(Main.xe[i].print());
            }
        } else {
            System.out.println("Vui long nhap thong tin truoc!");
        }
        pause();
    }
    private static void banner() {
        clear();
        System.out.print("\n1. Nhap thong tin\n2. Xuat thong tin\n3. Thoat\n\n Choose: ");
    }
    public static void main(String[] args) {
        int choose = 0;
        while (true) {
            banner();
            choose = Main.keyboard.nextInt();
            if(choose == 1) {
                Main.xe[Main.soluong] = new Vehicle();
                nhapdulieu(Main.xe[Main.soluong]);
            } else if (choose == 2) {
                xuatdulieu();
            } else if (choose == 3) {
                System.exit(0);
            }
        }
    } 
}
