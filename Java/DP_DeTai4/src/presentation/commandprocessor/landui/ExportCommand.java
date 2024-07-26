package presentation.commandprocessor.landui;

import domain.LandService;
import presentation.commandprocessor.Command;

public class ExportCommand extends Command {
    private int month = 0;

    public ExportCommand(LandService landService, int month) {
        this.landService = landService;
        this.month = month;
    }

    @Override
    public void execute() {
        this.landService.exportData(month);
    }
}
