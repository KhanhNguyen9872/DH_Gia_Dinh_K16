package domain;

import java.util.ArrayList;
import java.util.List;

import domain.model.Land;
import persistence.LandPersistenceService;

public class LandServiceImpl implements LandService {
    private LandPersistenceService persistenceService = null;

    public LandServiceImpl(LandPersistenceService persistenceService) {
        this.persistenceService = persistenceService;
    }

    @Override
    public void addLand(Land land) {
        this.persistenceService.addLand(land);
    }

    @Override
    public void updateLand(Land land) {
        this.persistenceService.updateLand(land);
    }

    @Override
    public void deleteLand(int id) {
        this.persistenceService.deleteLand(id);
    }

    @Override
    public Land findLand(int id) {
        return this.persistenceService.getLandByID(id);
    }

    @Override
    public List<Land> getAllLands() {
        return this.persistenceService.getAllLands();
    }

    @Override
    public List<Land> searchLandsByName(String name) {
        List<Land> listLands = new ArrayList<>();

        return listLands;
    }
}
