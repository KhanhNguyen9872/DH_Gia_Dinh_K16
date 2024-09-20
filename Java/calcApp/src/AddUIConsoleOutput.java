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

        //
        EditFile f = new EditFile(this.fileName);

        // write data
        f.write(
            "- Add Result: " + addResult + "\n" + 
            "- Sub Result: " + subResult + "\n" + 
            "- Mul Result: " + mulResult + "\n" + 
            "- Div Result: " + divResult + "\n"
        );

        // read data and print to console
        this.stdOut.print(f.read());
        this.stdOut.flush();
    }
}
