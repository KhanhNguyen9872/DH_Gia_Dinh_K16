package presentation.commandprocessor;

import domain.HouseService;
import domain.model.House;

public class UpdateCommand extends Command {
    public UpdateCommand(HouseService houseService, House house) {
        this.houseService = houseService;
        this.house = house;
    }

    @Override
    public void execute() {
        this.houseService.updateHouse(house);
    }
}
