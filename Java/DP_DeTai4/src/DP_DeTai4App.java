import domain.*;
import persistence.*;
import presentation.*;

public class DP_DeTai4App {
    public static void main(String[] args) {
        HousePersistenceService HousePersistenceService = new HousePersistenceServiceImpl("dataHouse.db");
        LandPersistenceService landPersistenceService = new LandPersistenceServiceImpl("dataLand.db");

        HouseService houseServiceImpl = new HouseServiceImpl(HousePersistenceService);
        LandService landServiceImpl = new LandServiceImpl(landPersistenceService);

        HouseUI houseUI = new HouseUI(houseServiceImpl);
        LandUI landUI = new LandUI(landServiceImpl);

        MainUI ui = new MainUI(houseUI, landUI);
        ui.Show();
    }
}
