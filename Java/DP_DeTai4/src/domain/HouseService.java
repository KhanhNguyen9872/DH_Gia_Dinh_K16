package domain;

import java.util.List;

import domain.model.House;

public interface HouseService {
    public void addHouse(House house);
    public void updateHouse(House house);
    public void deleteHouse(int id);

    public House findHouse(int id);
    public List<House> getAllHouses();

    public List<House> searchHousesByName(String name);
}
