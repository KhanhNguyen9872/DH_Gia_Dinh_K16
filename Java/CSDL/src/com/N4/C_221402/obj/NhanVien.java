package com.N4.C_221402.obj;

/**
 *
 * @author KhanhNguyen9872
 */
public class NhanVien {
    private String MaNV;
    private String Ho;
    private String TenLot;
    private String Ten;
    private String Phai;
    private String NgSinh;
    private String QueQuan;
    private String NoiSinh;
    private int PHG;
    
    public NhanVien() {
        this.MaNV = "";
        this.Ho = "";
        this.TenLot = "";
        this.Ten = "";
        this.Phai = "";
        this.NgSinh = "";
        this.QueQuan = "";
        this.NgSinh = "";
        this.PHG = -1;
    }
    
    
    public NhanVien(String MaNV, String Ho, String TenLot, String Ten, String Phai, String NgSinh, String QueQuan, String NoiSinh, int PHG) {
        this.MaNV = MaNV;
        this.Ho = Ho;
        this.TenLot = TenLot;
        this.Ten = Ten;
        this.Phai = Phai;
        this.NgSinh = NgSinh;
        this.QueQuan = QueQuan;
        this.NgSinh = NgSinh;
        this.PHG = PHG;
    }

    public String getMaNV() {
        return MaNV;
    }

    public void setMaNV(String MaNV) {
        this.MaNV = MaNV;
    }

    public String getHo() {
        return Ho;
    }

    public void setHo(String Ho) {
        this.Ho = Ho;
    }

    public String getTenLot() {
        return TenLot;
    }

    public void setTenLot(String TenLot) {
        this.TenLot = TenLot;
    }

    public String getTen() {
        return Ten;
    }

    public void setTen(String Ten) {
        this.Ten = Ten;
    }

    public String getPhai() {
        return Phai;
    }

    public void setPhai(String Phai) {
        this.Phai = Phai;
    }

    public String getNgSinh() {
        return NgSinh;
    }

    public void setNgSinh(String NgSinh) {
        this.NgSinh = NgSinh;
    }

    public String getQueQuan() {
        return QueQuan;
    }

    public void setQueQuan(String QueQuan) {
        this.QueQuan = QueQuan;
    }

    public String getNoiSinh() {
        return NoiSinh;
    }

    public void setNoiSinh(String NoiSinh) {
        this.NoiSinh = NoiSinh;
    }

    public int getPHG() {
        return PHG;
    }

    public void setPHG(int PHG) {
        this.PHG = PHG;
    }
}
