package persistence;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import domain.model.House;

public class HousePersistenceServiceImpl implements HousePersistenceService {
    private String filePath;

    public HousePersistenceServiceImpl(String filePath) {
        this.filePath = filePath;
    }

    public void saveData(List<House> houses) {
        try (ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream(filePath))) {
            for (House house : houses) {
                outputStream.writeObject(house);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addHouse(House house) {
        List<House> houses = this.getAllHouses();
        houses.add(house);
        this.saveData(houses);
    }

    @Override
    public void updateHouse(House house) {

        // saveData();
    }

    @Override
    public void deleteHouse(int id) {
        List<House> houses = this.getAllHouses();
        for(House house : houses) {
            if (house.getMaGiaoDich() == id) {
                houses.remove(house);
                break;
            }
        }
        this.saveData(houses);
    }

    @Override
    public House getHouseByID(int id) {
        List<House> houses = this.getAllHouses();
        for (House house : houses) {
            if (house.getMaGiaoDich() == id) {
                return house;
            }
        }
        return null;
    }

    @Override
    public List<House> getAllHouses() {
        List<House> houses = new ArrayList<>();
        
        try (ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream(this.filePath))) {
            while (true) {
                House house = (House) inputStream.readObject();
                houses.add(house);
            }
        } catch (EOFException e) {

        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return houses;
    }
}
