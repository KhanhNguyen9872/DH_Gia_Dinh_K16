package Control;

public class FTPServerConfig {
    private String port = "21";
    private String username = "root";
    private String password = "root";
    private String path = "";

    public FTPServerConfig() {

    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        if (port.isEmpty()) {
            return;
        }

        this.port = port;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        if (username.isEmpty()) {
            return;
        }

        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        if (password.isEmpty()) {
            return;
        }

        this.password = password;
    }

    public void setPath(String path) {
        if (path.isEmpty()) {
            return;
        }

        this.path = path;
    }

    public String getPath() {
        return path;
    }
}
