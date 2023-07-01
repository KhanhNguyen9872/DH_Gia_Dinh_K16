
public class RAM extends Laptop {
    private int so_luong; // 1 thanh, 2 thanh
    private String[] ma_ram; // ram1, ram2
    private String loai_ram; // DDR3, DDR4
    private long don_gia; // 1G DDR3 100, 1G DDR4 200
    private int dung_luong; // 1G
    
    public RAM(){
        this.so_luong = 0;
        this.ma_ram = null;
        this.loai_ram = "";
        this.dung_luong = 0;
        this.don_gia = 0;
    }
    
    public RAM(int so_luong, String[] ma_ram, String loai_ram, int dung_luong, long don_gia) {
        this.so_luong = so_luong;
        this.ma_ram = ma_ram;
        this.loai_ram = loai_ram;
        this.dung_luong = dung_luong;
        this.don_gia = don_gia;
    }
    
    public void nhapTTRam() {
        System.out.print(">> RAM:\n");
        int dung_luong = 0, tmp = 0;
        this.so_luong = Quanly.int_input("Số lượng RAM", null, true, true);
        while(true){
            tmp = Quanly.int_input("Loại RAM", "(1 - DDR3, 2 - DDR4)", true, true);
            if(tmp == 1){
                this.loai_ram = "DDR3";
            } else if (tmp == 2){
                this.loai_ram = "DDR4";
            } else {
                System.out.println("!! Loại RAM không tồn tại!");
                continue;
            }
            break;
        }
        this.dung_luong = Quanly.int_input("Dung lượng", "(GB)", true, true);
        this.ma_ram = new String[so_luong];
        for(int i=0;i<so_luong; i++) {
            System.out.print("  Mã RAM " + String.valueOf(i+1) + ": ");
            this.ma_ram[i] = Main.str_input();
        }
    }

    public int getSo_luong() {
        return so_luong;
    }

    public void setSo_luong(int so_luong) {
        this.so_luong = so_luong;
    }

    public String[] getMa_ram() {
        return ma_ram;
    }

    public void setMa_ram(String[] ma_ram) {
        this.ma_ram = ma_ram;
    }

    public String getLoai_ram() {
        return loai_ram;
    }

    public void setLoai_ram(String loai_ram) {
        this.loai_ram = loai_ram;
    }

    public long getDon_gia() {
        return don_gia;
    }

    public void setDon_gia(long don_gia) {
        this.don_gia = don_gia;
    }

    public int getDung_luong() {
        return dung_luong;
    }

    public void setDung_luong(int dung_luong) {
        this.dung_luong = dung_luong;
    }
    
}
