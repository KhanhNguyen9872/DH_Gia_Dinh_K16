import java.util.ArrayList;
public class Laptop {
    private String ma_laptop;
    private String ten_laptop;
    private int dong_laptop;
    private final String[] laptop_arr = Lib.read_data("laptop_type");
    protected ArrayList<CPU> dsCPU = null;
    protected ArrayList<RAM> dsRAM = null;
    protected ArrayList<HardDisk> dsHardDisk = null;
    protected ArrayList<Screen> dsScreen = null;
    
    public int getDong_laptop() {
        return this.dong_laptop;
    }

    public void reset_dsCPU() {
        this.dsCPU = new ArrayList<CPU>();
    }
    
    public void reset_dsRAM() {
        this.dsRAM = new ArrayList<RAM>();
    }
    
    public void reset_dsScreen() {
        this.dsScreen = new ArrayList<Screen>();
    }
    
    public void reset_dsHardDisk() {
        this.dsHardDisk = new ArrayList<HardDisk>();
    }
    
    public void reset_dsALL(){
        reset_dsCPU();
        reset_dsRAM();
        reset_dsScreen();
        reset_dsHardDisk();
    }
    
    public String getnameDong_laptop() {
        return this.laptop_arr[this.dong_laptop-1];
    }

    public boolean setDong_laptop(int dong_laptop) {
        int count = 1;
        for(String s : this.laptop_arr) {
            if(dong_laptop == count) {
                this.dong_laptop = dong_laptop;
                return true;
            }
            count++;
        }
        return false;
    }
    
    public void nhapMaLaptop(ArrayList<Laptop> dsLaptop) {
        String tmp;
        while(true) {
            System.out.print(Lib.getlang("LAPTOP_CODE") + ": ");
            tmp = Lib.str_input();
            int[] info = Lib.kt_ma_laptop(dsLaptop, tmp);
            if(info[0]==1){
                System.out.println("!! " + Lib.getlang("LAPTOP_CODE_EXIST"));
                continue;
            }
            this.ma_laptop = tmp;
            break;
        }
    }
    
    public void nhapTenLaptop() {
        System.out.print(Lib.getlang("LAPTOP_NAME") +": ");
        this.ten_laptop = Lib.str_input();
    }
    
    public void nhapDongLaptop() {
        int count;
        while(true) {
            count = 1;
            System.out.print(Lib.getlang("LAPTOP_SERIES") +" (");
            for(String s : this.laptop_arr) {
                if(count>1){
                    System.out.print(", ");
                }
                System.out.print(String.valueOf(count) 
                        + " - "
                        + Lib.rmSpace(s));
                count++;
            }
            System.out.print("): ");
            try {
                if (this.setDong_laptop(Lib.keyboard.nextInt())) {
                    break;
                }
            } catch (Exception e) {
                System.out.println("!! " + Lib.getlang("ENTER_NUM_PLZ"));
            }
        }
    }
    
    public void nhapTTLaptop(ArrayList<Laptop> dsLaptop) {
        nhapDongLaptop();
        nhapMaLaptop(dsLaptop);
        nhapTenLaptop();
    }
    
    public Laptop(){
        this.ma_laptop = "";
        this.ten_laptop = "";
        reset_dsALL();
    }

    public String getMa_laptop() {
        return this.ma_laptop;
    }

    public void setMa_laptop(String ma_laptop) {
        this.ma_laptop = ma_laptop;
    }

    public String getTen_laptop() {
        return this.ten_laptop;
    }

    public void setTen_laptop(String ten_laptop) {
        this.ten_laptop = ten_laptop;
    }

    public long getTong_gia() {
        long tong_gia = 0;
        for(CPU i : dsCPU) {
            tong_gia += i.getDon_gia();
        }
        for(RAM i : dsRAM) {
            tong_gia += i.getDon_gia();
        }
        for(Screen i : dsScreen) {
            tong_gia += i.getDon_gia();
        }
        for(HardDisk i : dsHardDisk) {
            tong_gia += i.getDon_gia();
        }
        return tong_gia;
    }
}
