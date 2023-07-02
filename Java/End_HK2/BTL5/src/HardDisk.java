
public class HardDisk extends Laptop {
    private String kieu_ocung = null;
    private String ma_ocung;
    private String loai_ocung;
    private long don_gia;
    private int dung_luong;
    private int so_vong_quay;
    private int toc_do_doc;
    private int toc_do_ghi;
    
    public HardDisk() {
        this.ma_ocung = "";
        this.loai_ocung = "";
        this.don_gia = 0;
        this.dung_luong = 0;
        this.so_vong_quay = 0;
        this.toc_do_doc = 0;
        this.toc_do_ghi = 0;
    }
    
    public boolean set_type_harddisk(int type){
        if(type == 1) {
            this.kieu_ocung = "HDD";
        } else if (type == 2) {
            this.kieu_ocung = "SSD";
        } else {
            System.out.println("!! Kiểu ổ cứng không hợp lệ!");
            return false;
        }
        return true;
    }
    
    public void set_type_harddisk() {
        while (!set_type_harddisk((int)Quanly.int_input("Loại ổ cứng", "(1 - HDD, 2 - SSD)", true, true,false))) {
            continue;
        }
    }
    
//    public HardDisk(String ma_ocung, String loai_ocung, long don_gia, int dung_luong, int so_vong_quay, int toc_do_doc, int toc_do_ghi) {
//        this.ma_ocung = ma_ocung;
//        this.loai_ocung = loai_ocung;
//        this.don_gia = don_gia;
//        this.dung_luong = dung_luong;
//        this.so_vong_quay = so_vong_quay;
//        this.toc_do_doc = toc_do_doc;
//        this.toc_do_ghi = toc_do_ghi;
//    }
    
    
    
    public void nhapTTHardDisk(int dong_laptop){
        if(dong_laptop == 1) {
            set_type_harddisk(2);
        }
        nhapTTHardDisk();
    }
    
    public void nhapTTHardDisk() {
        if(this.kieu_ocung == null) {
            set_type_harddisk();
        }
        System.out.print("    Mã ổ cứng: ");
        this.ma_ocung = Main.str_input();
        this.dung_luong = (int)Quanly.int_input("Dung lượng", "(GB)", true, true,false);
        this.don_gia = Quanly.int_input("Đơn giá", "(USD)", true, true, true);
        if(this.kieu_ocung.equals("HDD")) {
            this.so_vong_quay = (int)Quanly.int_input("Số vòng quay", "(rpm)", true, true,false);
        } else if(this.kieu_ocung.equals("SSD")) {
            this.toc_do_doc = (int)Quanly.int_input("Tốc độ đọc", "(mb/s)", true, true,false);
            this.toc_do_ghi = (int)Quanly.int_input("Tốc độ ghi", "(mb/s)", true, true,false);
        }
    }

    public String getKieu_ocung() {
        return kieu_ocung;
    }

    public void setKieu_ocung(String kieu_ocung) {
        this.kieu_ocung = kieu_ocung;
    }

    public String getMa_ocung() {
        return ma_ocung;
    }

    public void setMa_ocung(String ma_ocung) {
        this.ma_ocung = ma_ocung;
    }

    public String getLoai_ocung() {
        return loai_ocung;
    }

    public void setLoai_ocung(String loai_ocung) {
        this.loai_ocung = loai_ocung;
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

    public int getSo_vong_quay() {
        return so_vong_quay;
    }

    public void setSo_vong_quay(int so_vong_quay) {
        this.so_vong_quay = so_vong_quay;
    }

    public int getToc_do_doc() {
        return toc_do_doc;
    }

    public void setToc_do_doc(int toc_do_doc) {
        this.toc_do_doc = toc_do_doc;
    }

    public int getToc_do_ghi() {
        return toc_do_ghi;
    }

    public void setToc_do_ghi(int toc_do_ghi) {
        this.toc_do_ghi = toc_do_ghi;
    }
    
}




