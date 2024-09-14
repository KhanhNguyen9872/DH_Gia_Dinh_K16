import java.io.*;

public class AddUIConsoleOutput {
    private PrintWriter stdOut;
    private String fileName = "result.txt";

    public AddUIConsoleOutput() {
        this.stdOut = new PrintWriter(System.out);
    }

    public void output(ResponseData responseData) throws IOException, FileNotFoundException {
        // get data from response
        String addResult = responseData.getAddResult();
        String subResult = responseData.getSubResult();
        String mulResult = responseData.getMulResult();
        String divResult = responseData.getDivResult();

        // write data to file
        File file = new File(this.fileName);
        PrintWriter stdOutFile = new PrintWriter(file);

        stdOutFile.println("- Add Result: " + addResult);
        stdOutFile.println("- Sub Result: " + subResult);
        stdOutFile.println("- Mul Result: " + mulResult);
        stdOutFile.println("- Div Result: " + divResult);
        stdOutFile.close();

        // read file and print to console
        String line;
        FileReader fileReader = new FileReader(this.fileName);
        BufferedReader stdInFile = new BufferedReader(fileReader);
        while ((line = stdInFile.readLine()) != null) {
            this.stdOut.println(line);
        }
        this.stdOut.flush();
    }
}
