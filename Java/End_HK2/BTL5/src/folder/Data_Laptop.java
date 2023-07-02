
import java.util.ArrayList;
import java.util.Hashtable;

public class Data_Laptop {
    private Hashtable<String, Integer> cpu = new Hashtable<String, String>();
    private Hashtable<String, Integer> ram = new Hashtable<String, String>();
    private Hashtable<String, String> laptop = new Hashtable<String, String>();
    private Hashtable<String, String> screen = new Hashtable<String, String>();
    private Hashtable<Integer, Integer> screen_standard = new Hashtable<String, String>();
    private ArrayList<String> harddisk = new ArrayList<String>();
    

    public Data_Laptop() {
        // laptop
        this.laptop.put("Butterfly","cpu=i7;screen=FullHD;harddisk=SSD");
        this.laptop.put("Fly","cpu=i5;screen=HD");
        this.laptop.put("Bee","cpu=i3|i5;screen=HD");
        // cpu
        this.cpu.put("i3", 100);
        this.cpu.put("i5", 200);
        this.cpu.put("i7", 300);
        // ram
        this.ram.put("DDR3", 100);
        this.ram.put("DDR4", 200);
        // hard disk
        this.harddisk.add("HDD");
        this.harddisk.add("SSD");
        // screen
        this.screen.put("HD", "Màn hình gương");
        this.screen.put("FullHD", "Màn hình chống lóa");
        // screen standard
        this.screen_standard.put(1, 2000);
        this.screen_standard.put(2, 3000);
        this.screen_standard.put(3, 4000);
    }
    

}
