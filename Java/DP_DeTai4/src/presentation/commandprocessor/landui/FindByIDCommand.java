package presentation.commandprocessor.landui;

import domain.LandService;
import presentation.commandprocessor.Command;

public class FindByIDCommand extends Command {
    public FindByIDCommand(LandService landService, int id) {
        this.landService = landService;
        this.id = id;
    }

    @Override
    public void execute() {
        this.landService.findLand(id);
    }
}
