package presentation.commandprocessor.landui;

import domain.LandService;
import presentation.commandprocessor.Command;

public class AvgCommand extends Command {
    public AvgCommand(LandService landService) {
        this.landService = landService;
    }

    @Override
    public void execute() {
        this.landService.avgMoney();
    }
}
