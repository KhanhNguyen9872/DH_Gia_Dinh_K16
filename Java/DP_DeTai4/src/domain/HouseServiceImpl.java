package domain;

import java.util.ArrayList;
import java.util.List;

import domain.model.House;

import persistence.HousePersistenceService;

public class HouseServiceImpl implements HouseService {
    private HousePersistenceService persistenceService = null;

    public HouseServiceImpl(HousePersistenceService persistenceService) {
        this.persistenceService = persistenceService;
    }

    @Override
    public void addHouse(House house) {
        this.persistenceService.addHouse(house);
    }

    @Override
    public void updateHouse(House house) {
        this.persistenceService.updateHouse(house);
    }

    @Override
    public void deleteHouse(int id) {
        this.persistenceService.deleteHouse(id);
    }

    @Override
    public House findHouse(int id) {
        return this.persistenceService.getHouseByID(id);
    }

    @Override
    public List<House> getAllHouses() {
        return this.persistenceService.getAllHouses();
    }

    @Override
    public List<House> searchHousesByName(String name) {
        List<House> listHouses = new ArrayList<>();

        return listHouses;
    }
}
