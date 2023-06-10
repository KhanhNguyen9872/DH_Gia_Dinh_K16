import java.util.Scanner;

public class Main {
    private static Scanner keyboard = new Scanner(System.in);
    private static int soluong = 0;
    
    private static void printf(String s) {
        System.out.print(s);
    }
    
    private static void pause() {
        Main.keyboard.nextLine();
        Main.keyboard.nextLine();
    }
    
    private static void clear() {
        printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    }
    
    private static void banner() {
        clear();
        printf("\n1. Nhap thong tin khach hang\n2. Xuat thong tin khach hang\n3. Nap tien\n4. Rut tien\n5. Dao han\n6. Chuyen khoan\n7. Thoat\n\n Lua chon: ");
    }
    
    private static void nhap(Account[] ds){
        long sotaikhoan = 0;
        clear();
        try {
            printf("\nNhap so tai khoan: ");
            sotaikhoan = Main.keyboard.nextLong();
            if (check_sotaikhoan(ds,sotaikhoan)[0] == 1) {
                printf("\nSo tai khoan nay da ton tai!\n");
                pause();
                return;
            }
            ds[Main.soluong].setSotaikhoan(sotaikhoan);
            Main.keyboard.nextLine();
            printf("\nNhap ten tai khoan: ");
            ds[Main.soluong].setTentaikhoan(Main.keyboard.nextLine());
            Main.soluong++;
            printf("\nThem thong tin thanh cong!");
        } catch (Exception e) {
            printf("\nSomething is error!\n");
        }
        pause();
    }
   
    
    private static void xuatall(Account[] ds) {
        clear();
        printf("\nSo tai khoan \t Ten tai khoan \t So tien\n");
        printf("=================================================\n");
        for(int i=0; i<Main.soluong; i++) {
            printf(ds[i].toString() + "\n");
        }
        pause();
    }
    
    private static int[] check_sotaikhoan(Account[] ds, long sotaikhoan) {
        int[] tmp = new int[2];
        tmp[0] = 0;
        for(tmp[1] = 0; tmp[1]<Main.soluong; tmp[1]++) {
            if(sotaikhoan == ds[tmp[1]].getSotaikhoan()) {
                tmp[0] = 1;
                break;
            }
        }
        return tmp;
    }
    
    private static void naptien(Account[] ds) {
        clear();
        int[] info = new int[2];
        printf("\nNhap so tai khoan cua ban: ");
        info = check_sotaikhoan(ds, Main.keyboard.nextLong());
        if (info[0] == 1) {
            printf("\nTen tai khoan: " + ds[info[1]].getTentaikhoan() + "\n");
            printf("So tien dang co: " + String.format("%.2f",ds[info[1]].getSotien()) + " USD\n");
            printf("\nNhap so tien muon nap: ");
            ds[info[1]].naptien(Main.keyboard.nextDouble());
        } else {
            printf("\nSo tai khoan nay khong ton tai!");
        }
        pause();
    }
    
    private static void daohan(Account[] ds) {
        clear();
        int[] info = new int[2];
        double sotien = 0;
        printf("\nNhap so tai khoan cua ban: ");
        info = check_sotaikhoan(ds, Main.keyboard.nextLong());
        if (info[0] == 1) {
            ds[info[1]].daohan();
        } else {
            printf("\nSo tai khoan nay khong ton tai!");
        }
        pause();
    }
    
    private static void chuyentien(Account[] ds) {
        clear();
        int[] info = new int[2];
        int[] info2 = new int[2];
        double sotien = 0;
        printf("\nNhap so tai khoan cua ban: ");
        info = check_sotaikhoan(ds, Main.keyboard.nextLong());
        if (info[0] == 1) {
            printf("\nTen tai khoan: " + ds[info[1]].getTentaikhoan() + "\n");
            printf("So tien dang co: " + String.format("%.2f",ds[info[1]].getSotien()) + " USD\n");
            printf("\nNhap so tai khoan muon chuyen: ");
            info2 = check_sotaikhoan(ds, Main.keyboard.nextLong());
            if(info2[0] == 1) {
                printf("\nTen tai khoan nguoi nhan: " + ds[info2[1]].getTentaikhoan() + "\n");
                printf("Nhap so tien muon chuyen: ");
                sotien = Main.keyboard.nextDouble();
                ds[info2[1]].nhantien(ds[info[1]].chuyentien(sotien));
            } else {
                printf("\nSo tai khoan nay khong ton tai!");
            }
        } else {
            printf("\nSo tai khoan nay khong ton tai!");
        }
        pause();
    }
    
    private static void ruttien(Account[] ds) {
        clear();
        int[] info = new int[2];
        printf("\nNhap so tai khoan cua ban: ");
        info = check_sotaikhoan(ds, Main.keyboard.nextLong());
        if (info[0] == 1) {
            printf("\nTen tai khoan: " + ds[info[1]].getTentaikhoan() + "\n");
            printf("So tien dang co: " + String.format("%.2f",ds[info[1]].getSotien()) + " USD\n");
            printf("Nhap so tien muon rut: ");
            ds[info[1]].ruttien(Main.keyboard.nextDouble());
        } else {
            printf("So tai khoan nay khong ton tai!");
        }
        pause();
    }
    
    public static void main(String[] args) {
        Account ds[] = null;
        ds = new Account[100];
        int choose = 0;
        while (true) {
            banner();
            choose = Main.keyboard.nextInt();
            switch (choose) {
                case 1:
                    ds[Main.soluong] = new Account();
                    nhap(ds);
                    break;
                case 2:
                    xuatall(ds);
                    break;
                case 3:
                    naptien(ds);
                    break;
                case 4:
                    ruttien(ds);
                    break;
                case 5:
                    daohan(ds);
                    break;
                case 6:
                    chuyentien(ds);
                    break;
                case 7:
                    clear();
                    System.exit(0);
                    break;
                default:
            }
        }
    }   
}
