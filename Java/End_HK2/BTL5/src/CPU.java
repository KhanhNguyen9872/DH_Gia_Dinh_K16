
import java.util.Arrays;

public class CPU extends Laptop {
    private String ma_cpu; // CPU1, CPU2, CPU3
    private String loai_cpu; // i3, i5, i7
    private long don_gia; // 100, 200, 300
    private String hang_cpu = Lib.arrToString(Lib.read_data("cpu_company"));
    private final String[] cpu_arr = Lib.read_data("cpu_type");
    private final String[] cpu_price_arr = Lib.read_data("cpu_price");
    
    public CPU(){
        this.ma_cpu = "";
        this.loai_cpu = "";
        this.don_gia = 0;
    }
    
    public CPU(String ma_cpu, String loai_cpu, String hang_cpu, long don_gia) {
        this.ma_cpu = ma_cpu;
        this.hang_cpu = hang_cpu;
        this.loai_cpu = loai_cpu;
        this.don_gia = don_gia;
    }
    
    public void nhapTTCPU(){
        nhapTTCPU(0);
    }
    
    public void nhapTTCPU(int type_laptop){
        String[] tmpArr = {};
        System.out.print(">> CPU:\n");
        String ma_cpu = "";
        System.out.println("    " 
                + Lib.getlang("CPU_COMPANY") 
                + ": " 
                + String.valueOf(this.hang_cpu)
        );
        while(true){
            tmpArr = Lib.readDataLaptop(type_laptop)[0].split("/");
            if(tmpArr[0].toLowerCase().equals("null")) {
                System.out.print("    " 
                        + Lib.getlang("INPUT") 
                        + " "
                        + Lib.getlang("CPU_CODE")
                        + " " 
                        + String.valueOf(Lib.arrToListString(this.cpu_arr, "CPU", true)) 
                        + ": "
                );
                ma_cpu = Lib.str_input();
            } else {
                if(tmpArr.length < 2) {
                    ma_cpu = "CPU" + String.valueOf(Lib.getIndexArr(this.cpu_arr,tmpArr[0])+1);
                    System.out.println("    CPU: " 
                            + ma_cpu 
                            + " - "
                            + String.valueOf(tmpArr[0])
                    );
                } else {
                    System.out.print("    " 
                            + Lib.getlang("INPUT")
                            + " " 
                            + Lib.getlang("CPU_CODE") 
                            + " " 
                            + String.valueOf(Lib.arrToListString(tmpArr, "CPU", true)) 
                            + ": "
                    );
                    ma_cpu = Lib.str_input();
                    try {
                        if(!Arrays.asList(this.cpu_arr).contains(tmpArr[Integer.valueOf(ma_cpu.toLowerCase().replace("cpu", ""))-1])){
                            Integer.valueOf("KhanhNguyen9872");
                        }
                    } catch (Exception e) {
                        System.out.println("!! " + Lib.getlang("INVALID_CPU"));
                        continue;
                    }
                }
            }
            
            try {
                this.loai_cpu = cpu_arr[Integer.valueOf(
                        ma_cpu.toLowerCase().replace("cpu", "")
                )-1];
            } catch (Exception e) {
                System.out.println("!! " + Lib.getlang("INVALID_CPU_CODE"));
                continue;
            }
            try {
                this.don_gia = Long.valueOf(cpu_price_arr[Integer.valueOf(
                        ma_cpu.toLowerCase().replace("cpu", "")
                )-1]);
            } catch (Exception e) {
                this.don_gia = Lib.int_input(Lib.getlang("PRICE"), null, true, true, true);
            }

            this.ma_cpu = ma_cpu;
            System.out.println("    " + Lib.getlang("PRICE") + ": " + String.valueOf(this.don_gia) + " USD");
            break;
        }
    }
    
    public String getHang_cpu() {
        return hang_cpu;
    }

    public void setHang_cpu(String hang_cpu) {
        this.hang_cpu = hang_cpu;
    }
    
    public String getMa_cpu() {
        return ma_cpu;
    }

    public void setMa_cpu(String ma_cpu) {
        this.ma_cpu = ma_cpu;
    }

    public String getLoai_cpu() {
        return loai_cpu;
    }

    public void setLoai_cpu(String loai_cpu) {
        this.loai_cpu = loai_cpu;
    }
    
    public long getDon_gia() {
        return don_gia;
    }

    public void setDon_gia(long don_gia) {
        this.don_gia = don_gia;
    }
    
    public String export_config() {
        return String.valueOf(this.ma_cpu) 
            + "/" 
            + String.valueOf(this.hang_cpu) 
            + "/" 
            + String.valueOf(this.loai_cpu)
            + "/"
            + String.valueOf(this.don_gia) + ", ";
    }
    
    @Override
    public String toString(){
        return String.valueOf(this.ma_cpu) 
            + " - " 
            + String.valueOf(this.hang_cpu) 
            + " " 
            + String.valueOf(this.loai_cpu)
            + " ("
            + String.valueOf(this.don_gia)
            + " " 
            + Lib.getlang("MONEY") 
            + ")\n";
    }
    
}
