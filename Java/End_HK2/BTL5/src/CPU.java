public class CPU extends Laptop {
    private String ma_cpu; // CPU1, CPU2, CPU3
    private String loai_cpu; // i3, i5, i7
    private long don_gia; // 100, 200, 300
    private String hang_cpu = "Intel";
    
    public CPU(){
        this.ma_cpu = "";
        this.loai_cpu = "";
        this.don_gia = 0;
    }

//    public CPU(String ma_cpu, String loai_cpu, long don_gia) {
//        this.ma_cpu = ma_cpu;
//        this.loai_cpu = loai_cpu;
//        this.don_gia = don_gia;
//    }
    
    public void nhapTTCPU(){
        System.out.print(">> CPU:\n");
        String ma_cpu;
        while(true){
            System.out.print("  Nhập mã CPU [CPU1 - i3 , CPU2 - i5, CPU3 - i7]: ");
            ma_cpu = Main.str_input();
            if(ma_cpu.equalsIgnoreCase("CPU1")){
                this.loai_cpu = "i3";
                this.don_gia = 100;
            } else if (ma_cpu.equalsIgnoreCase("CPU2")) {
                this.loai_cpu = "i5";
                this.don_gia = 200;
            } else if (ma_cpu.equalsIgnoreCase("CPU3")) {
                this.loai_cpu = "i7";
                this.don_gia = 300;
            } else {
                System.out.println("!! Mã CPU không hợp lệ!");
                continue;
            }
            this.ma_cpu = ma_cpu;
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
    
    
}
