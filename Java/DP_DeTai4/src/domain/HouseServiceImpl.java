package domain;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import observer.Publisher;
import observer.Subscriber;
import domain.model.House;

import persistence.HousePersistenceService;

public class HouseServiceImpl extends Publisher implements HouseService {
    private HousePersistenceService persistenceService = null;
    private House house = null;
    private List<House> houses = null;
    private double thanhTien = -1;
    private int soLuong = -1;
    private double avgMoney = -1;

    public HouseServiceImpl(HousePersistenceService persistenceService) {
        this.persistenceService = persistenceService;
    }

    public void changeState() {
        notifySubscribers();
    }

    @Override
    public House getHouse() {
        return this.house;
    }

    @Override
    public List<House> getHouses() {
        return this.houses;
    }

    @Override
    public House findGetHouse(int id) {
        return this.persistenceService.getHouseByID(id);
    }

    @Override
    public List<House> getData() {
        return this.persistenceService.getAllHouses();
    }

    @Override
    public void addSub(Subscriber s) {
        subscriber(s);
    }

    @Override
    public void addHouse(House house) {
        this.persistenceService.addHouse(house);
        this.house = null;
        this.houses = null;
        changeState();
    }

    @Override
    public void updateHouse(House house) {
        this.persistenceService.updateHouse(house);
        this.house = null;
        this.houses = null;
        changeState();
    }

    @Override
    public void deleteHouse(int id) {
        this.persistenceService.deleteHouse(id);
        this.house = null;
        this.houses = null;
        changeState();
    }

    @Override
    public void findHouse(int id) {
        this.house = this.persistenceService.getHouseByID(id);
        changeState();
    }

    @Override
    public void getAllHouses() {
        this.houses = this.persistenceService.getAllHouses();
        changeState();
    }

    @Override
    public void calcMoney(House house) {
        this.thanhTien = this.tinhThanhTien(house);
        changeState();
    }

    public double tinhThanhTien(House house) {
        double thanhTien = 0;

        Double dienTich = house.getDienTich();
        int donGia = house.getDonGia();
        String loaiNha = house.getLoaiNha();
        thanhTien = dienTich * donGia;

        if (!loaiNha.toLowerCase().equals("nhà cao cấp")) {
            thanhTien = thanhTien * 0.9;
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
    public void sumCountHouse(String loaiNha) {
        int tong = 0;
        List<House> listHouses = this.persistenceService.getAllHouses();

        for (House house : listHouses) {
            if (loaiNha.toLowerCase().equals(house.getLoaiNha().toLowerCase())) {
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
        List<House> listHouses = this.persistenceService.getAllHouses();
        for (House house : listHouses) {
            money = money + this.tinhThanhTien(house);
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
            this.getAllHouses();
            return;
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date;

        List<House> tmp = this.persistenceService.getAllHouses();
        List<House> result = new ArrayList<House>();

        for (House house : tmp) {
            date = LocalDate.parse(house.getNgayGiaoDich(), formatter);
            int m = date.getMonthValue();
            if (m == month) {
                result.add(house);
            }
        }

        this.houses = result;
        changeState();
    }
}
