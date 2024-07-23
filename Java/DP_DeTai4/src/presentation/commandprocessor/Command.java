package presentation.commandprocessor;

import domain.*;
import domain.model.*;

public abstract class Command {
    public HouseService houseService;
    public House house;
    public LandService landService;
    public Land land;
    public int id;
    public abstract void execute();
}
