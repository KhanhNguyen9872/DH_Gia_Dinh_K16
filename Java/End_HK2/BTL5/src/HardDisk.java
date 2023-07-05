
import java.util.Arrays;

public class HardDisk {
    private String kieu_ocung = null;
    private String ma_ocung;
    private long don_gia;
    private int dung_luong;
    private int so_vong_quay;
    private int toc_do_doc;
    private int toc_do_ghi;
    private final String[] harddisk_arr = Lib.read_data("harddisk_type");
    private final String[] harddisk_price = Lib.read_data("harddisk_price");
    
    public HardDisk() {
        this.ma_ocung = "";
        this.don_gia = 0;
        this.dung_luong = 0;
        this.so_vong_quay = 0;
        this.toc_do_doc = 0;
        this.toc_do_ghi = 0;
    }
    
    public HardDisk(String ma_ocung, String kieu_ocung, long don_gia, int dung_luong, int so_vong_quay, int toc_do_doc, int toc_do_ghi) {
        this.ma_ocung = ma_ocung;
        this.kieu_ocung = kieu_ocung;
        this.don_gia = don_gia;
        this.dung_luong = dung_luong;
        this.so_vong_quay = so_vong_quay;
        this.toc_do_doc = toc_do_doc;
        this.toc_do_ghi = toc_do_ghi;
    }
    
    public void set_type_harddisk(int type_laptop){
        String[] tmpArr;
        String tmp;
        tmpArr = Lib.readDataLaptop(type_laptop)[3].split("/");
        if(tmpArr[0].toLowerCase().equals("null")) {
                System.out.print("    " + Lib.getlang("HARDDISK_TYPE") + " " + String.valueOf(Lib.arrToListString(this.harddisk_arr, null, false)) + ": ");
                this.kieu_ocung = Lib.str_input();
        } else {
            while(true) {
                System.out.print("    " + Lib.getlang("HARDDISK_TYPE"));
                if(tmpArr.length < 2) {
                    this.kieu_ocung = tmpArr[0];
                    System.out.println(": " + this.kieu_ocung);
                } else {
                    System.out.print(" " + String.valueOf(Lib.arrToListString(tmpArr, null, false) + ": "));
                    this.kieu_ocung = Lib.str_input().toUpperCase();
                    try {
                        if(!Arrays.asList(this.harddisk_arr).contains(tmpArr[Lib.getIndexArr(tmpArr, this.kieu_ocung)])){
                            Integer.valueOf("KhanhNguyen9872");
                        }
                        tmp = this.harddisk_price[Lib.getIndexArr(this.harddisk_arr, this.kieu_ocung)];
                    } catch (Exception e) {
                        System.out.println("!! " + Lib.getlang("INVALID_HARDDISK_TYPE"));
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
        String tmp = "";
        while(true) {
            try {
                tmp = this.harddisk_price[Lib.getIndexArr(this.harddisk_arr, this.kieu_ocung)];
            } catch (Exception e) {
                set_type_harddisk(type_laptop);
                continue;
            }
            break;
        }
        System.out.print("    " + Lib.getlang("HARDDISK_CODE") + ": ");
        this.ma_ocung = Lib.str_input();
        this.dung_luong = (int)Lib.int_input(Lib.getlang("HARDDISK_CAPACITY"), "(GB)", true, true,false);
        
        if(tmp.toLowerCase().equals("null")) {
            this.don_gia = Lib.int_input(Lib.getlang("PRICE"), "(USD)", true, true, true);
        } else {
            this.don_gia = Long.valueOf(tmp);
        }
        if(this.kieu_ocung.equals("HDD")) {
            this.so_vong_quay = (int)Lib.int_input(Lib.getlang("NUMBER_ROTATIONS"), "(rpm)", true, true,false);
        } else if(this.kieu_ocung.equals("SSD")) {
            this.toc_do_doc = (int)Lib.int_input(Lib.getlang("READ_SPEED"), "(mb/s)", true, true,false);
            this.toc_do_ghi = (int)Lib.int_input(Lib.getlang("WRITE_SPEED"), "(mb/s)", true, true,false);
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
    
    public String export_config() {
        return String.valueOf(this.ma_ocung)
                + "/" + String.valueOf(this.kieu_ocung) 
                + "/" + String.valueOf(this.dung_luong)
                + "/" + String.valueOf(this.toc_do_doc) 
                + "/" + String.valueOf(this.toc_do_ghi)
                + "/" + String.valueOf(this.so_vong_quay)
                + "/" + String.valueOf(this.don_gia) + ", ";
    }
    
    @Override
    public String toString(){
        String str = "";
        str += String.valueOf(this.ma_ocung)
                + " - " + String.valueOf(this.kieu_ocung) 
                + " (" 
                + String.valueOf(this.dung_luong)
                + " GB)";
        if(this.kieu_ocung.equals("HDD")) {
            str += " - [" 
                    + String.valueOf(this.so_vong_quay) 
                    + "rpm]";
        } else if(this.kieu_ocung.equals("SSD")) {
            str += " - [R: " 
                    + String.valueOf(this.toc_do_doc) 
                    + " MB/s - W: " 
                    + String.valueOf(this.toc_do_ghi) + " MB/s]";
        }
        str += " (" 
                + String.valueOf(this.don_gia)
                + " " 
                + Lib.getlang("MONEY") 
                + ")\n";
        return str;
    }
}




