
import java.util.Arrays;

public class RAM extends Laptop {
    private int so_luong; // 1 thanh, 2 thanh
    private String[] ma_ram; // ram1, ram2
    private String loai_ram; // DDR3, DDR4
    private long don_gia; // 1G DDR3 100, 1G DDR4 200
    private int dung_luong; // 1G
    private final String[] ram_arr = Lib.read_data("ram_type");
    private final String[] ram_price_arr = Lib.read_data("ram_price");
    
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
    
    public void nhapTTRam(int type_laptop) {
        String str;
        System.out.print(">> RAM:\n");
        int tmp = 0;
        String[] tmpArr = {};
        this.so_luong = (int)Lib.int_input(Lib.getlang("NUMBER_OF_RAM"), null, true, true,false);
        while(true){
            tmpArr = Lib.readDataLaptop(type_laptop)[1].split("/");
            if(tmpArr[0].toLowerCase().equals("null")) {
                tmp = (int)Lib.int_input(Lib.getlang("RAM_TYPE"), Lib.arrToListString(this.ram_arr, null, true), true, true,false);
            } else {
                if(tmpArr.length < 2) {
                    tmp = Lib.getIndexArr(this.ram_arr, tmpArr[0]);
                    System.out.println(
                            "    " 
                            + Lib.getlang("RAM_TYPE") 
                            + ": " 
                            + String.valueOf(tmpArr[0])
                    );
                } else {
                    tmp = (int)Lib.int_input(Lib.getlang("RAM_TYPE"), Lib.arrToListString(tmpArr, null, true), true, true,false);
                    try {
                        if(!Arrays.asList(this.ram_arr).contains(tmpArr[tmp-1])){
                            Integer.valueOf("KhanhNguyen9872");
                        }
                    } catch (Exception e) {
                        System.out.println(
                                "!! " 
                                + Lib.getlang("INVALID_RAM")
                        );
                        continue;
                    }
                }
            }
            try {
                this.loai_ram = this.ram_arr[tmp-1];
            } catch (Exception e) {
                System.out.println("!! " + Lib.getlang("INVALID_RAM"));
                continue;
            }
            
            try {
                this.don_gia = Long.valueOf(this.ram_price_arr[tmp-1]);
            } catch (Exception e) {
                this.don_gia = Lib.int_input(Lib.getlang("PRICE"), null, true, true, true);
            }
            break;
        }
        this.dung_luong = (int)Lib.int_input(Lib.getlang("CAPACITY"), "(GB)", true, true,false);
        this.don_gia = this.don_gia * this.dung_luong;
        this.ma_ram = new String[so_luong];
        for(int i=0;i<so_luong; i++) {
            System.out.print("    " + Lib.getlang("RAM_CODE") + " " + String.valueOf(i+1) + ": ");
            this.ma_ram[i] = Lib.str_input();
        }
        System.out.println("    " + Lib.getlang("PRICE") + ": " + String.valueOf(this.don_gia) + " " + Lib.getlang("MONEY"));
        System.out.println("    " + Lib.getlang("TOTAL_PRICE") + ": " + String.valueOf(this.don_gia * this.so_luong) + " " + Lib.getlang("MONEY"));
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
    
    public String export_config() {
        String str = "";
        for(String z : this.getMa_ram()) {
            str += String.valueOf(z) 
                + "/" 
                + String.valueOf(this.loai_ram) 
                + "/" 
                + String.valueOf(this.dung_luong) 
                + "/"
                + String.valueOf(this.don_gia)
                + ", ";
        }
        return str;
    }
 
    @Override
    public String toString(){
        int count = 1;
        String str = "";
        for(String z : this.getMa_ram()) {
            str += "  "
                + String.valueOf(count)
                + ". "
                + String.valueOf(z) 
                + " - " 
                + String.valueOf(this.loai_ram) 
                + " - " 
                + String.valueOf(this.dung_luong) 
                + " GB ("
                + String.valueOf(this.don_gia)
                + " " 
                + Lib.getlang("MONEY") 
                + ")";
            str += "\n";
            count++;
        }
        return str;
    }
    
}
