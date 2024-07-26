package presentation.commandprocessor.landui;

import domain.LandService;
import presentation.commandprocessor.Command;

public class SumCountLandCommand extends Command {
    private String loaiDat;

    public SumCountLandCommand(LandService landService, String _loaiDat) {
        this.landService = landService;
        loaiDat = _loaiDat;
    }

    @Override
    public void execute() {
        this.landService.sumCountLand(loaiDat);
    }
}
