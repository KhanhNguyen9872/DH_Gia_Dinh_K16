
import java.util.Arrays;

public class Screen extends Laptop {
    private String ma_manhinh;
    private String hang_sanxuat;
    private String do_phangiai;
    private long don_gia;
    private int chong_loa;
    private final String[] screen_arr = Lib.read_data("screen_type");
    private final String[] screen_fullhd_arr = Lib.read_data("screen_FullHD");
    private final String[] screen_price_arr = Lib.read_data("screen_price");
    
    public Screen() {
        this.ma_manhinh = "";
        this.hang_sanxuat = "";
        this.do_phangiai = "";
        this.don_gia = 0;
        this.chong_loa = 0;
    }
    
    public Screen(String ma_manhinh, String hang_sanxuat, String do_phangiai, long don_gia, int chong_loa) {
        this.ma_manhinh = ma_manhinh;
        this.hang_sanxuat = hang_sanxuat;
        this.do_phangiai = do_phangiai;
        this.don_gia = don_gia;
        this.chong_loa = chong_loa;
    }

    public void nhapTTScreen(int type_laptop){
        int tmp;
        String[] tmp2;
        String[] tmpArr = {};
        System.out.print(">> " + Lib.getlang("SCREEN") + ": \n");
        System.out.print("    " + Lib.getlang("SCREEN_CODE") + ": ");
        this.ma_manhinh = Lib.str_input();
        System.out.print("    " + Lib.getlang("MANUFACTURER") + ": ");
        this.hang_sanxuat = Lib.str_input();
        while(true) {
            tmpArr = Lib.readDataLaptop(type_laptop)[2].split("/");
            System.out.print("    " + Lib.getlang("SCREEN_TYPE"));
            if(tmpArr[0].toLowerCase().equals("null")) {
                System.out.print(" " + String.valueOf(Lib.arrToListString(this.screen_arr, null, false)) + ": ");
                this.do_phangiai = Lib.str_input();
            } else {
                if(tmpArr.length < 2) {
                    this.do_phangiai = String.valueOf(tmpArr[0]);
                    System.out.println(": " + this.do_phangiai);
                } else {
                    System.out.print(" " + String.valueOf(Lib.arrToListString(tmpArr, null, false) + ": "));
                    this.do_phangiai = Lib.str_input();
                    try {
                        if(!Arrays.asList(this.screen_arr).contains(tmpArr[Lib.getIndexArr(tmpArr, this.do_phangiai)])){
                            Integer.valueOf("KhanhNguyen9872");
                        }
                    } catch (Exception e) {
                        System.out.println("!! " + Lib.getlang("SCREEN") + " " + Lib.getlang("IS_NOT_VALID"));
                        continue;
                    }
                }
            }
            
            tmp2 = Lib.read_data("screen_" + this.do_phangiai);
            if(tmp2[0].toLowerCase().equals("null")) {
                this.don_gia = Long.valueOf(this.screen_price_arr[Lib.getIndexArr(this.screen_arr, this.do_phangiai)]);
            } else {
                while(true) {
                    tmp = (int)Lib.int_input(Lib.getlang("SCREEN_STD"), Lib.arrToListString(tmp2, null, false), true, true, false);
                    try {
                        this.don_gia = Long.valueOf(this.screen_price_arr[Lib.getIndexArr(this.screen_arr, this.do_phangiai)].split("/")[tmp-1]);
                    } catch (Exception e) {
                        System.out.println("!! " + Lib.getlang("INVALID_SCREEN_STD"));
                        continue;
                    }
                    this.chong_loa = tmp;
                    break;
                }
            }
            System.out.println("    " + Lib.getlang("PRICE") + ": " + String.valueOf(this.don_gia) + " " + Lib.getlang("MONEY"));
            break;
        }
    }

    public String getMa_manhinh() {
        return ma_manhinh;
    }

    public void setMa_manhinh(String ma_manhinh) {
        this.ma_manhinh = ma_manhinh;
    }

    public String getHang_sanxuat() {
        return hang_sanxuat;
    }

    public void setHang_sanxuat(String hang_sanxuat) {
        this.hang_sanxuat = hang_sanxuat;
    }

    public String getDo_phangiai() {
        return do_phangiai;
    }

    public void setDo_phangiai(String do_phangiai) {
        this.do_phangiai = do_phangiai;
    }

    public long getDon_gia() {
        return don_gia;
    }

    public void setDon_gia(long don_gia) {
        this.don_gia = don_gia;
    }

    public int getChong_loa() {
        return chong_loa;
    }

    public void setChong_loa(int chong_loa) {
        this.chong_loa = chong_loa;
    }
    
    public String export_config() {
        return String.valueOf(this.ma_manhinh)
                + "/" + String.valueOf(this.hang_sanxuat)
                + "/" + String.valueOf(this.do_phangiai)
                + "/" + String.valueOf(this.chong_loa)
                + "/" + String.valueOf(this.don_gia);         
    }
    
    @Override
    public String toString(){
        String str = "";
        str += String.valueOf(this.ma_manhinh)
                + " - "
                + String.valueOf(this.hang_sanxuat)
                + " - "
                + String.valueOf(this.do_phangiai)
                + " - "
                + String.valueOf(this.don_gia)
            ;
        if(this.chong_loa != 0) {
            str += " - " + String.valueOf(this.chong_loa);
        }
        str += " (" 
            + String.valueOf(this.don_gia)
            + " " 
            + Lib.getlang("MONEY")
            + ")\n";            
        return str;
    }
}
