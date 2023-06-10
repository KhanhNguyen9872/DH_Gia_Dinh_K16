public class Vehicle {
    private String tenchuxe;
    private String loaixe;
    private int dungtich;
    private float trigia;
    
    public Vehicle() {
        this.tenchuxe = "";
        this.loaixe = "";
        this.dungtich = 0;
        this.trigia = 0;
    }

    public float thue(){
        if(this.dungtich < 100) {
            return this.trigia * 0.1f;
        } else if(this.dungtich <= 200) {
            return this.trigia * 0.3f;
        } else if(this.dungtich > 200) {
            return this.trigia * 0.5f;
        }
        return 0f;
    }
    
    public void setTenchuxe(String tenchuxe) {
        this.tenchuxe = tenchuxe;
    }

    public void setLoaixe(String loaixe) {
        this.loaixe = loaixe;
    }

    public void setDungtich(int dungtich) {
        this.dungtich = dungtich;
    }

    public void setTrigia(float trigia) {
        this.trigia = trigia;
    }
    
    public String print(){
        return this.tenchuxe + "\t\t" + this.loaixe + "\t\t" + this.dungtich + "\t\t" + String.format("%.2f",this.trigia) + "\t" + thue();
    }
}
