package presentation.commandprocessor.houseui;

import domain.HouseService;
import domain.model.House;
import presentation.commandprocessor.Command;

public class CalcCommand extends Command {
    public CalcCommand(HouseService houseService, House house) {
        this.houseService = houseService;
        this.house = house;
    }

    @Override
    public void execute() {
        this.houseService.calcMoney(house);
    }
}
