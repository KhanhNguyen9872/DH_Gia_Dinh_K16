package persistence;

import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import domain.model.Land;

public class LandPersistenceServiceImpl implements LandPersistenceService {
    private String filePath;

    public LandPersistenceServiceImpl(String filePath) {
        this.filePath = filePath;
    }

    public void saveData(List<Land> lands) {
        try (ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream(filePath))) {
            for (Land land : lands) {
                outputStream.writeObject(land);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addLand(Land land) {
        List<Land> lands = this.getAllLands();
        lands.add(land);
        saveData(lands);
    }

    @Override
    public void updateLand(Land land) {

    }

    @Override
    public void deleteLand(int id) {
        List<Land> lands = this.getAllLands();
        for(Land land : lands) {
            if (land.getMaGiaoDich() == id) {
                lands.remove(land);
                break;
            }
        }
        this.saveData(lands);
    }

    @Override
    public Land getLandByID(int id) {
        List<Land> lands = this.getAllLands();
        for (Land land : lands) {
            if (land.getMaGiaoDich() == id) {
                return land;
            }
        }
        return null;
    }

    @Override
    public List<Land> getAllLands() {
        List<Land> lands = new ArrayList<>();
        
        try (ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream(this.filePath))) {
            while (true) {
                Land land = (Land) inputStream.readObject();
                lands.add(land);
            }
        } catch (EOFException e) {

        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return lands;
    }
}
