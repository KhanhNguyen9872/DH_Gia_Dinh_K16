package presentation.commandprocessor.houseui;

import domain.HouseService;
import presentation.commandprocessor.Command;

public class AvgCommand extends Command {
    public AvgCommand(HouseService houseService) {
        this.houseService = houseService;
    }

    @Override
    public void execute() {
        this.houseService.avgMoney();
    }
}
