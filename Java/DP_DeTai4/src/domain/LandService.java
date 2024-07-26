package domain;

import java.util.List;

import domain.model.Land;
import observer.Subscriber;

public interface LandService {
    public void addLand(Land land);
    public void updateLand(Land land);
    public void deleteLand(int id);

    public void findLand(int id);
    public Land findGetLand(int id);

    public void getAllLands();
    public List<Land> getData();

    public void addSub(Subscriber s);

    public Land getLand();
    public List<Land> getLands();

    // thanhTien
    public void calcMoney(Land land);
    public double getThanhTien();

    // tinhTongSoLuong
    public void sumCountLand(String loaiDat);
    public int getSoLuong();

    // tinhTrungBinhThanhTien
    public void avgMoney();
    public double getAvgMoney();

    // export
    public void exportData(int month);
}
