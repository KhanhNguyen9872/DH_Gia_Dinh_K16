public class Sinhvien {
    private int id;
    private String name;
    private float lythuyet;
    private float thuchanh;
    
    public Sinhvien() {
        this.id = 0;
        this.name = "";
        this.lythuyet = 0;
        this.thuchanh = 0;
    }

    public Sinhvien(int id, String name, float lythuyet, float thuchanh) {
        this.id = id;
        this.name = name;
        this.lythuyet = lythuyet;
        this.thuchanh = thuchanh;
    }
    
    public float diemtb() {
        return (this.lythuyet + this.thuchanh) / 2;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLythuyet(float lythuyet) {
        this.lythuyet = lythuyet;
    }

    public void setThuchanh(float thuchanh) {
        this.thuchanh = thuchanh;
    }
    
    @Override
    public String toString() {
        return this.id + "\t" + this.name + "\t" + this.lythuyet + "\t\t" + this.thuchanh + "\t\t" + diemtb();
    }
}