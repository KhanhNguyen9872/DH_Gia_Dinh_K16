package presentation.commandprocessor.landui;

import domain.LandService;
import domain.model.Land;
import presentation.commandprocessor.Command;

public class UpdateCommand extends Command {
    public UpdateCommand(LandService landService, Land land) {
        this.landService = landService;
        this.land = land;
    }

    @Override
    public void execute() {
        this.landService.updateLand(land);
    }
}
