package presentation.commandprocessor.houseui;

import domain.HouseService;
import domain.model.House;
import presentation.commandprocessor.Command;

public class AddCommand extends Command {
    public AddCommand(HouseService houseService, House house) {
        this.houseService = houseService;
        this.house = house;
    }

    @Override
    public void execute() {
        this.houseService.addHouse(house);
    }
}
