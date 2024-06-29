package persistence;

import java.util.List;

import domain.model.Land;

public interface LandPersistenceService {
    public void addLand(Land land);
    public void updateLand(Land land);
    public void deleteLand(int id);

    public Land getLandByID(int id);
    public List<Land> getAllLands();
}
