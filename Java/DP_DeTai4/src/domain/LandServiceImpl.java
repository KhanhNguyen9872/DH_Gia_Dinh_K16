package domain;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import observer.Publisher;
import observer.Subscriber;
import domain.model.House;
import domain.model.Land;

import persistence.LandPersistenceService;

public class LandServiceImpl extends Publisher implements LandService {
    private LandPersistenceService persistenceService = null;
    private Land land = null;
    private List<Land> lands = null;
    private double thanhTien = -1;
    private int soLuong = -1;
    private double avgMoney = -1;

    public LandServiceImpl(LandPersistenceService persistenceService) {
        this.persistenceService = persistenceService;
    }

    public void changeState() {
        notifySubscribers();
    }

    @Override
    public Land getLand() {
        return this.land;
    }

    @Override
    public List<Land> getLands() {
        return this.lands;
    }

    @Override
    public Land findGetLand(int id) {
        return this.persistenceService.getLandByID(id);
    }

    @Override
    public List<Land> getData() {
        return this.persistenceService.getAllLands();
    }

    @Override
    public void addSub(Subscriber s) {
        subscriber(s);
    }

    @Override
    public void addLand(Land land) {
        this.persistenceService.addLand(land);
        this.land = null;
        this.lands = null;
        changeState();
    }

    @Override
    public void updateLand(Land land) {
        this.persistenceService.updateLand(land);
        this.land = null;
        this.lands = null;
        changeState();
    }

    @Override
    public void deleteLand(int id) {
        this.persistenceService.deleteLand(id);
        this.land = null;
        this.lands = null;
        changeState();
    }

    @Override
    public void findLand(int id) {
        this.land = this.persistenceService.getLandByID(id);
        changeState();
    }

    @Override
    public void getAllLands() {
        this.lands = this.persistenceService.getAllLands();
        changeState();
    }

    @Override
    public void calcMoney(Land land) {
        this.thanhTien = this.tinhThanhTien(land);
        changeState();
    }

    public double tinhThanhTien(Land land) {
        double thanhTien = 0;

        Double dienTich = land.getDienTich();
        int donGia = land.getDonGia();
        String loaiDat = land.getLoaiDat();
        thanhTien = dienTich * donGia;

        if (loaiDat.toLowerCase().equals("a")) {
            thanhTien = thanhTien * 1.5;
        }

        return thanhTien;
    }

    @Override
    public double getThanhTien() {
        double p = this.thanhTien;
        this.thanhTien = -1;
        return p;
    }

    @Override
    public void sumCountLand(String loaiNha) {
        int tong = 0;
        List<Land> listLands = this.persistenceService.getAllLands();

        for (Land land : listLands) {
            if (loaiNha.toLowerCase().equals(land.getLoaiDat().toLowerCase())) {
                tong = tong + 1;
            }   
        }

        this.soLuong = tong;
        changeState();
    }

    @Override
    public int getSoLuong() {
        int p = this.soLuong;
        this.soLuong = -1;
        return p;
    }

    @Override
    public void avgMoney() {
        double money = 0;
        int count = 0;
        List<Land> listLands = this.persistenceService.getAllLands();
        for (Land land : listLands) {
            money = money + this.tinhThanhTien(land);
            count = count + 1;
        }

        this.avgMoney = (double)(money / count);
        changeState();
    }

    @Override
    public double getAvgMoney() {
        double p = this.avgMoney;
        this.avgMoney = -1;
        return p;
    }

    @Override
    public void exportData(int month) {
        if (month == 0) {
            this.getAllLands();
            return;
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date;

        List<Land> tmp = this.persistenceService.getAllLands();
        List<Land> result = new ArrayList<Land>();

        for (Land land : tmp) {
            date = LocalDate.parse(land.getNgayGiaoDich(), formatter);
            int m = date.getMonthValue();
            if (m == month) {
                result.add(land);
            }
        }

        this.lands = result;
        changeState();
    }
}
