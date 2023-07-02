
import java.util.ArrayList;

public class Laptop {
    private String ma_laptop;
    private String ten_laptop;
    private int dong_laptop;
    protected ArrayList<CPU> dsCPU = new ArrayList<CPU>();
    protected ArrayList<RAM> dsRAM = new ArrayList<RAM>();
    protected ArrayList<HardDisk> dsHardDisk = new ArrayList<HardDisk>();
    protected ArrayList<Screen> dsScreen = new ArrayList<Screen>();
    
    public int getDong_laptop() {
        return this.dong_laptop;
    }
    
    public String getnameDong_laptop() {
        switch(this.dong_laptop) {
            case 1:
                return "Butterfly";
            case 2:
                return "Fly";
            case 3:
                return "Bee";
        }
        return null;
    }

    public boolean setDong_laptop(int dong_laptop) {
        if(dong_laptop == 1 || dong_laptop == 2 || dong_laptop == 3){
            this.dong_laptop = dong_laptop;
            return true;
        }
        return false;
    }
    
    public Laptop(){
        this.ma_laptop = "";
        this.ten_laptop = "";
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
