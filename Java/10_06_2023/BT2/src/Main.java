

import java.util.Scanner;

public class Main {
    public static Scanner keyboard = new Scanner(System.in);
    public static Sinhvien sv1 =  new Sinhvien(22150129, "Nguyen Van Khanh", 5.0f, 5.0f);
    public static Sinhvien sv2 = new Sinhvien(20000000,"Nguyen Van A", 5.0f, 5.0f);
    public static Sinhvien sv3 = new Sinhvien();
    private static void nhap() {
        System.out.print("Nhap name: ");
        Main.sv3.setName(Main.keyboard.nextLine());
        System.out.print("Nhap ID: ");
        Main.sv3.setId(Main.keyboard.nextInt());
        System.out.print("Nhap diem ly thuyet: ");
        Main.sv3.setLythuyet(Main.keyboard.nextFloat());
        System.out.print("Nhap diem thuc hanh: ");
        Main.sv3.setThuchanh(Main.keyboard.nextFloat());
    }
    
    public static void main(String[] args) {
        nhap();
        System.out.println("ID\t\tName\t\tLy thuyet\tThuc hanh\tDiemTB");
        System.out.println(Main.sv1.toString());
        System.out.println(Main.sv2.toString());
        System.out.println(Main.sv3.toString());
    }
    
}
