
import java.util.Arrays;

public class HardDisk extends Laptop {
    private String kieu_ocung = null;
    private String ma_ocung;
    private long don_gia;
    private int dung_luong;
    private int so_vong_quay;
    private int toc_do_doc;
    private int toc_do_ghi;
    private final String[] harddisk_arr = lib.read_data("harddisk_type");
    private final String[] harddisk_price = lib.read_data("harddisk_price");
    
    public HardDisk() {
        this.ma_ocung = "";
        this.don_gia = 0;
        this.dung_luong = 0;
        this.so_vong_quay = 0;
        this.toc_do_doc = 0;
        this.toc_do_ghi = 0;
    }
    
    public void set_type_harddisk(int type_laptop){
        String[] tmpArr;
        tmpArr = lib.readDataLaptop(type_laptop)[3].split("/");
        if(tmpArr[0].toLowerCase().equals("null")) {
                System.out.print("    Loại ổ cứng " + String.valueOf(lib.arrToString(this.harddisk_arr, null, false)) + ": ");
                this.kieu_ocung = lib.str_input();
        } else {
            while(true) {
                System.out.print("    Loại ổ cứng");
                if(tmpArr.length < 2) {
                    this.kieu_ocung = tmpArr[0];
                    System.out.println(": " + this.kieu_ocung);
                } else {
                    System.out.print(" " + String.valueOf(lib.arrToString(tmpArr, null, false) + ": "));
                    this.kieu_ocung = lib.str_input();
                    try {
                        if(!Arrays.asList(this.harddisk_arr).contains(tmpArr[lib.getIndexArr(tmpArr, this.kieu_ocung)])){
                            Integer.valueOf("KhanhNguyen9872");
                        }
                    } catch (Exception e) {
                        System.out.println("!! Màn hình không hợp lệ!");
                        continue;
                    }
                }
                break;
            }
        }
    }
    
    public void nhapTTHardDisk(int type_laptop) {
        if(this.kieu_ocung == null) {
            set_type_harddisk(type_laptop);
        }
        String tmp;
        System.out.print("    Mã ổ cứng: ");
        this.ma_ocung = lib.str_input();
        this.dung_luong = (int)lib.int_input("Dung lượng", "(GB)", true, true,false);
        
        tmp = this.harddisk_price[lib.getIndexArr(this.harddisk_arr, this.kieu_ocung)];
        if(tmp.toLowerCase().equals("null")) {
            this.don_gia = lib.int_input("Đơn giá", "(USD)", true, true, true);
        } else {
            this.don_gia = Long.valueOf(tmp);
        }
        if(this.kieu_ocung.equals("HDD")) {
            this.so_vong_quay = (int)lib.int_input("Số vòng quay", "(rpm)", true, true,false);
        } else if(this.kieu_ocung.equals("SSD")) {
            this.toc_do_doc = (int)lib.int_input("Tốc độ đọc", "(mb/s)", true, true,false);
            this.toc_do_ghi = (int)lib.int_input("Tốc độ ghi", "(mb/s)", true, true,false);
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
    
    @Override
    public String toString(){
        String str = "";
        str += String.valueOf(this.ma_ocung)
                + " - " + String.valueOf(this.kieu_ocung) 
                + " (" 
                + String.valueOf(this.dung_luong)
                + " GB)"
        ;
        if(this.kieu_ocung.equals("HDD")) {
            str += " - [" 
                    + String.valueOf(this.so_vong_quay) 
                    + "rpm]"
            ;
        } else if(this.kieu_ocung.equals("SSD")) {
            str += " - [R: " 
                    + String.valueOf(this.toc_do_doc) 
                    + " MB/s - W: " 
                    + String.valueOf(this.toc_do_ghi) + " MB/s]"
            ;
        }
        str += " (" 
                + String.valueOf(this.don_gia)
                + " USD)\n";
        return str;
    }
}




