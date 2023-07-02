public class Screen {
    private String ma_manhinh;
    private String hang_sanxuat;
    private String do_phangiai;
    private long don_gia;
    private int chong_loa;
    
    public Screen() {
        this.ma_manhinh = "";
        this.hang_sanxuat = "";
        this.do_phangiai = "";
        this.don_gia = 0;
        this.chong_loa = 0;
    }
    
    private String get_screen(int type_scr){
        // 1 - Butterfly, 2 - Fly, 3 - Bee
        if(type_scr == 1) {
            return "FullHD";
        } else if(type_scr == 2) {
            return "HD";
        } else if(type_scr == 3) {
            return "HD";
        }
        return null;
    }
    
    public void nhapTTScreen(){
        nhapTTScreen(0);
    }
    
    public void nhapTTScreen(int type_scr){
        int tmp;
        System.out.print(">> Màn hình: \n");
        System.out.print("    Mã màn hình: ");
        this.ma_manhinh = lib.str_input();
        System.out.print("    Hãng sản xuất: ");
        this.hang_sanxuat = lib.str_input();
        while(true) {
            System.out.print("    Loại màn hình");
            if(type_scr == 0) {
                System.out.print(" [HD - FullHD]: ");
                this.do_phangiai = lib.str_input();
            } else {
                this.do_phangiai = get_screen(type_scr);
                System.out.println(": " + String.valueOf(this.do_phangiai));
            }
            if(this.do_phangiai.equals("HD")) {
                this.don_gia = 1000;
            } else if (this.do_phangiai.equals("FullHD")) {
                while(true) {
                    tmp = (int)lib.int_input("Tiêu chuẩn va chạm","(1, 2, 3)",true,true,false);
                    if(tmp == 1) {
                        this.don_gia = 2000;
                    } else if(tmp == 2) {
                        this.don_gia = 3000;
                    } else if(tmp == 3){
                        this.don_gia = 4000;
                    } else {
                        System.out.println("!! Tiêu chuẩn màn hình không hợp lệ!");
                        continue;
                    }
                    this.chong_loa = tmp;
                    break;
                }
            } else {
                System.out.println("!! Loại màn hình không hợp lệ!");
                continue;
            }
            System.out.println("    Đơn giá: " + String.valueOf(this.don_gia) + " USD");
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
            + " USD)\n";            
        return str;
    }
}
