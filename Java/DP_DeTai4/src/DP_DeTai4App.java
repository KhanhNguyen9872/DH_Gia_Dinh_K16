import domain.*;
import persistence.*;
import presentation.*;
import presentation.commandprocessor.CommandProcessor;

public class DP_DeTai4App {
    public static void main(String[] args) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Class.forName("org.jdesktop.swingx.JXDatePicker");

        CommandProcessor commandProcessor = CommandProcessor.makeCommandProcessor();

        HousePersistenceService housePersistenceService = new HousePersistenceServiceImpl("localhost", "3306", "dbdetai4", "root", "12345678");

        HouseService houseServiceImpl = new HouseServiceImpl(housePersistenceService);

        HouseUI houseUI = new HouseUI(houseServiceImpl, commandProcessor);

        MainUI ui = new MainUI(houseUI, null);
    }
}
