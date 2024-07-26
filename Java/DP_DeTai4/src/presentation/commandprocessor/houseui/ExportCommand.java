package presentation.commandprocessor.houseui;

import domain.HouseService;
import presentation.commandprocessor.Command;

public class ExportCommand extends Command {
    private int month = 0;

    public ExportCommand(HouseService houseService, int month) {
        this.houseService = houseService;
        this.month = month;
    }

    @Override
    public void execute() {
        this.houseService.exportData(month);
    }
}
