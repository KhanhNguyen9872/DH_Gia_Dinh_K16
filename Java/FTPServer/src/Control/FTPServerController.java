package Control;

import Model.FTPServerModel;

public class FTPServerController {
    private FTPServerModel model;

    public FTPServerController(FTPServerModel model) {
        this.model = model;
    }

    public void execute(FTPServerConfig config) throws Exception {
        int port = Integer.parseInt(config.getPort());
        String username = config.getUsername();
        String password = config.getPassword();
        String path = config.getPath();

        this.model.setPort(port);
        this.model.setUsername(username);
        this.model.setPassword(password);
        this.model.setPath(path);

        this.model.start();
    }
}
