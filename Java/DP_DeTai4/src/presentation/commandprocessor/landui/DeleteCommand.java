package presentation.commandprocessor.landui;

import domain.LandService;
import presentation.commandprocessor.Command;

public class DeleteCommand extends Command {
    public DeleteCommand(LandService landService, int id) {
        this.landService = landService;
        this.id = id;
    }

    @Override
    public void execute() {
        this.landService.deleteLand(id);
    }
}
