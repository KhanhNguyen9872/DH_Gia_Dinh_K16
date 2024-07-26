package presentation.commandprocessor.houseui;

import domain.HouseService;
import presentation.commandprocessor.Command;

public class SumCountHouseCommand extends Command {
    private String loaiNha;

    public SumCountHouseCommand(HouseService houseService, String _loaiNha) {
        this.houseService = houseService;
        loaiNha = _loaiNha;
    }

    @Override
    public void execute() {
        this.houseService.sumCountHouse(loaiNha);
    }
}
