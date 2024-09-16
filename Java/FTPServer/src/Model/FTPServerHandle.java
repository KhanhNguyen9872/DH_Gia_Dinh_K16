package Model;

import java.io.*;
import java.net.*;
import java.util.StringTokenizer;

class FTPClientHandler implements Runnable {
    private ServerSocket dataSocket;
    private Socket clientSocket;
    private Integer dataPort;
    private String username;
    private String password;
    private String rootPath;
    private String curPath;
    private BufferedReader in;
    private PrintWriter out;
    private String transferMode = "A";

    public FTPClientHandler(Socket clientSocket, Integer dataPort, String username, String password, String rootPath) throws IOException {
        this.clientSocket = clientSocket;
        this.in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
        this.out = new PrintWriter(clientSocket.getOutputStream(), true);
        this.dataPort = dataPort;
        this.username = username;
        this.password = password;
        this.rootPath = rootPath;
        this.curPath = this.rootPath;
    }

    @Override
    public void run() {
        try {
            sendResponse("220 FTP Server Ready");

            String line;
            while ((line = in.readLine()) != null) {
                System.out.println("Received: '" + line + "'");
                handleCommand(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                clientSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void handleCommand(String command) {
        StringTokenizer tokenizer = new StringTokenizer(command);
        String cmd = tokenizer.nextToken().toUpperCase();

        switch (cmd) {
            case "USER":
                handleUser(tokenizer);
                break;
            case "PASS":
                handlePass(tokenizer);
                break;
            case "LIST":
                handleList();
                break;
            case "RETR":
                handleRetrieve(tokenizer);
                break;
            case "STOR":
                handleStore(tokenizer);
                break;
            case "SYST":
                handleSyst();
                break;
            case "FEAT":
                handleFeat();
                break;
            case "CWD":
                handleCwd(tokenizer);
                break;
            case "PWD":
            case "XPWD":
                handlePwd();
                break;
            case "QUIT":
                handleQuit();
                break;
            case "TYPE":
                handleType(tokenizer);
                break;
            case "PASV":
                handlePasv();
                break;
            default:
                sendResponse("502 Command not implemented");
        }
    }

    private void handleCwd(StringTokenizer tokenizer) {
        String filename = this.curPath;
    
        // // cd ..
        // if (args.equals("..")) {
        //     int ind = filename.lastIndexOf(fileSeparator);
        //     if (ind > 0) {
        //         filename = filename.substring(0, ind);
        //     }
        // }
    
        // // if argument is anything else (cd . does nothing)
        // else if ((args != null) && (!args.equals("."))) {
        //   filename = filename + "/" + args;
        // }
    
        // check if file exists, is directory and is not above root directory
        File f = new File(filename);
    
        if (f.exists() && f.isDirectory() && (filename.length() >= this.rootPath.length())) {
            this.curPath = filename;
            sendResponse("250 The current directory has been changed to " + this.curPath);
        } else {
            sendResponse("550 Requested action not taken. File unavailable.");
        }
    }

    private void openDataConnectionPassive(int port) {
        int tried = 0;
        while (tried < 10) {
            try {
                this.dataSocket = new ServerSocket(port);
                this.clientSocket = this.dataSocket.accept();
                this.out = new PrintWriter(this.clientSocket.getOutputStream(), true);
                System.out.println("Data connection - Passive Mode - established");
        
            } catch (IOException e) {
                port = port + 1;
                this.dataPort = port;
                tried = tried + 1;
            }
        }
      }

    private void handlePasv() {
        String myIp = "127.0.0.1";
        String myIpSplit[] = myIp.split("\\.");

        int p1 = this.dataPort / 256;
        int p2 = this.dataPort % 256;

        sendResponse("227 Entering Passive Mode (" + myIpSplit[0] + "," + myIpSplit[1] + "," + myIpSplit[2] + ","
            + myIpSplit[3] + "," + p1 + "," + p2 + ")");

        openDataConnectionPassive(this.dataPort);
    }

    private void handleFeat() {
        sendResponse("211-Extensions supported:");
        sendResponse("211 END");
    }

    private void handleType(StringTokenizer tokenizer) {
        String mode = tokenizer.nextToken().toUpperCase();

        if (mode.toUpperCase().equals("A")) {
            this.transferMode = "A";
            sendResponse("200 OK");
        } else if (mode.toUpperCase().equals("I")) {
            this.transferMode = "I";
            sendResponse("200 OK");
        } else {
            sendResponse("504 Not OK");
        };
    }

    private void handleQuit() {
        sendResponse("221 Closing connection");
    }

    private void handleSyst() {
        sendResponse("215 COMP4621 FTP Server Homebrew");
    }
    
    private void handlePwd() {
        sendResponse("257 \"" + this.curPath + "\"");
    }

    private void handleUser(StringTokenizer tokenizer) {
        String username = tokenizer.nextToken();
        if (this.username.equals(username)) {
            sendResponse("331 Username OK, need password");
        } else {
            sendResponse("530 Invalid username");
        };
    }

    private void handlePass(StringTokenizer tokenizer) {
        String password = tokenizer.nextToken();
        if (this.password.equals(password)) {
            sendResponse("230 User logged in, proceed");
        } else {
            sendResponse("530 Invalid password");
        }
    }

    private void handleList() {
        sendResponse("150 Opening data connection for file list");
        sendResponse("226 Transfer complete");
    }

    private void handleRetrieve(StringTokenizer tokenizer) {
        String filename = tokenizer.nextToken();
        System.out.println("Retrieving file: " + filename);
        sendResponse("150 Opening data connection for file transfer");
        sendResponse("226 Transfer complete");
    }

    private void handleStore(StringTokenizer tokenizer) {
        String filename = tokenizer.nextToken();
        System.out.println("Storing file: " + filename);
        sendResponse("150 Opening data connection for file upload");
        sendResponse("226 Transfer complete");
    }

    private void sendResponse(String response) {
        out.println(response);
        System.out.println("Sent: " + response);
    }
}