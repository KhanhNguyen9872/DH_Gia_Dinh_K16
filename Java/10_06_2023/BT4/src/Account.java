public class Account {
    private long sotaikhoan;
    private String tentaikhoan;
    private double sotien;
    private double laisuat = 0.035;
    
    public Account(){
        this.sotaikhoan = 0;
        this.tentaikhoan = "";
        this.sotien = 50;
    }
    
    public Account(long sotaikhoan, String tentaikhoan, double sotien){
        this.sotaikhoan = sotaikhoan;
        this.tentaikhoan = tentaikhoan;
        this.sotien = sotien;
    }
    
    public void naptien(double sotien) {
        if (sotien>0) {
            this.sotien = this.sotien + sotien;
            System.out.println("Nap tien thanh cong! (" + String.format("%.2f",sotien) + " USD)");
        } else {
            System.out.println("So tien vua nhap khong chinh xac!");
        }
    }
    
    public void ruttien(double sotien) {
        if (sotien>0) {
            if (sotien <= this.sotien) {
                this.sotien = this.sotien - sotien;
                System.out.println("Rut tien thanh cong! (" + String.format("%.2f",sotien) + " USD)");
            } else {
                System.out.println("So tien khong du trong tai khoan!");
            }
        } else {
            System.out.println("So tien vua nhap khong chinh xac!");
        }
    }
    
    public void daohan() {
        double tmp = (this.sotien * this.laisuat);
        this.sotien = this.sotien + tmp;
        System.out.println("Dao han thanh cong 1 thang! Ban nhan duoc " + String.format("%.2f",sotien) + " USD");
    }
    
    public double chuyentien(double sotien) {
        if (sotien>0) {
            if (sotien <= this.sotien) {
                this.sotien = this.sotien - sotien;
            } else {
                System.out.println("So tien khong du trong tai khoan!");
                return -1;
            }
        } else {
            System.out.println("So tien vua nhap khong chinh xac!");
            return -1;
        }
        return sotien;
    }
    
    public void nhantien(double sotien) {
        if(sotien == (double) -1){
            System.out.println("\nChuyen tien that bai!\n");
            return;
        }
        this.sotien = this.sotien + sotien;
        System.out.println("Chuyen tien thanh cong!");
    }

    public long getSotaikhoan() {
        return sotaikhoan;
    }

    public void setSotaikhoan(long sotaikhoan) {
        this.sotaikhoan = sotaikhoan;
    }

    public String getTentaikhoan() {
        return tentaikhoan;
    }

    public void setTentaikhoan(String tentaikhoan) {
        this.tentaikhoan = tentaikhoan;
    }

    public double getSotien() {
        return sotien;
    }

    public void setSotien(double sotien) {
        this.sotien = sotien;
    }
    
    public String toString() {
        return this.sotaikhoan + "\t" + this.tentaikhoan + "\t\t" + this.sotien;
    }
    
}
