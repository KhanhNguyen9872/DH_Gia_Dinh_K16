package domain;

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
}
