import Control.FTPServerController;
import Model.FTPServerModel;
import View.FTPServerUI;

public class FTPServerApp {
    public static void main(String[] args) throws Exception {
        FTPServerModel model = new FTPServerModel();
        FTPServerController controller = new FTPServerController(model);
        FTPServerUI ui = new FTPServerUI(controller);
        ui.run();
    }
}
