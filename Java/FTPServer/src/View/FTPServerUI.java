package View;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import Control.FTPServerConfig;
import Control.FTPServerController;

public class FTPServerUI {
    private FTPServerController controller;
    private PrintWriter stdOut;
    private BufferedReader stdIn;

    public FTPServerUI(FTPServerController controller) {
        this.controller = controller;
        this.stdOut = new PrintWriter(System.out, true);
        this.stdIn = new BufferedReader(new InputStreamReader(System.in));
    }

    public void run() throws IOException {
        do {
            try {
                this.stdOut.print("Port (Default: 21): ");
                this.stdOut.flush();
                String port = this.stdIn.readLine();

                this.stdOut.print("Username (Default: root): ");
                this.stdOut.flush();
                String username = this.stdIn.readLine();

                this.stdOut.print("Password (Default: root): ");
                this.stdOut.flush();
                String password = this.stdIn.readLine();

                String path;
                do {
                    this.stdOut.print("Path: ");
                    this.stdOut.flush();
                    path = this.stdIn.readLine();
                } while (path.isEmpty());

                FTPServerConfig config = new FTPServerConfig();
                config.setPort(port);
                config.setUsername(username);
                config.setPassword(password);
                config.setPath(path);

                this.controller.execute(config);
                break;
            } catch (Exception ex) {
                this.stdOut.println(ex.getMessage());
            }
        } while (true);
    }
}
