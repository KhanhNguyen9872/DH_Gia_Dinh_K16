package presentation.commandprocessor.landui;

import domain.LandService;
import domain.model.Land;
import presentation.commandprocessor.Command;

public class AddCommand extends Command {
    public AddCommand(LandService landService, Land land) {
        this.landService = landService;
        this.land = land;
    }

    @Override
    public void execute() {
        this.landService.addLand(land);
    }
}
