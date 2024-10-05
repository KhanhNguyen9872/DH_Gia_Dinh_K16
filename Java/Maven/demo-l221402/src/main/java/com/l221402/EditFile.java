package com.l221402;

import java.io.*;

public class EditFile {
    private String fileName;

    public EditFile(String fileName) {
        this.fileName = fileName;
    }

    public String read() throws IOException {
        String str = "";
        String line;
        BufferedReader stdInFile = new BufferedReader(new FileReader(this.fileName));

        while(true) {
            line = stdInFile.readLine();
            if (line == null) {
                break;
            };

            str = str + line + "\n";
        }
        
        stdInFile.close();
        return str;
    }

    public void write(String str) throws FileNotFoundException {
        File file = new File(this.fileName);
        PrintWriter stdOutFile = new PrintWriter(file);

        stdOutFile.print(str);
        stdOutFile.close();
    }
}
