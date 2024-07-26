package presentation.commandprocessor.houseui;

import domain.HouseService;
import domain.model.House;
import presentation.commandprocessor.Command;

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
