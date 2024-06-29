package domain;

import java.util.List;

import domain.model.Land;

public interface LandService {
    public void addLand(Land land);
    public void updateLand(Land land);
    public void deleteLand(int id);

    public Land findLand(int id);
    public List<Land> getAllLands();
    public List<Land> searchLandsByName(String name);
}
