package Model;

import java.io.*;
import java.net.*;

public class FTPServerModel {
    private int port = 21;
    private String username;
    private String password;
    private String path;

    private ServerSocket serverSocket;
    
    public FTPServerModel() {

    }

    public void start() throws IOException {
        this.serverSocket = new ServerSocket(this.port);
        Socket clientSocket;
        FTPClientHandler clientHandler;
        int thread = 0;
        
        System.out.println("FTPServer started on port: " + this.serverSocket.getLocalPort());
        
        while (true) {
            clientSocket = serverSocket.accept();
            System.out.println("Client connected: " + clientSocket.getInetAddress());

            clientHandler = new FTPClientHandler(clientSocket, port + thread + 1, username, password, path);
            thread = thread + 1;
            new Thread(clientHandler).start();
        }
    }

    public void setPort(int port) {
        this.port = port;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
