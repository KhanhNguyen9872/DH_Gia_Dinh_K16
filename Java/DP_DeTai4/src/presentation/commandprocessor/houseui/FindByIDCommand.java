package presentation.commandprocessor.houseui;

import domain.HouseService;
import presentation.commandprocessor.Command;

public class FindByIDCommand extends Command {
    public FindByIDCommand(HouseService houseService, int id) {
        this.houseService = houseService;
        this.id = id;
    }

    @Override
    public void execute() {
        this.houseService.findHouse(id);
    }
}
