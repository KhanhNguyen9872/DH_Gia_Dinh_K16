package presentation.commandprocessor;

import domain.HouseService;

public class DeleteCommand extends Command {
    public DeleteCommand(HouseService houseService, int id) {
        this.houseService = houseService;
        this.id = id;
    }

    @Override
    public void execute() {
        this.houseService.deleteHouse(id);
    }
}
