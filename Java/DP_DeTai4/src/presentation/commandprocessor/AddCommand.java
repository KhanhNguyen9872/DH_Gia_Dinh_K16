package presentation.commandprocessor;

import domain.HouseService;
import domain.model.House;

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
