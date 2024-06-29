package persistence;

import java.util.List;

import domain.model.House;

public interface HousePersistenceService {
    public void addHouse(House house);
    public void updateHouse(House house);
    public void deleteHouse(int id);

    public House getHouseByID(int id);
    public List<House> getAllHouses();
}
