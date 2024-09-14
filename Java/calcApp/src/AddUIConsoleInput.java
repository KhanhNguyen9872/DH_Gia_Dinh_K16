import java.io.*;

public class AddUIConsoleInput {
    private AddUseCaseControl addControl;
    private PrintWriter stdOut;
    private BufferedReader stdIn;

    public AddUIConsoleInput(AddUseCaseControl addcontrol) {
        this.stdOut = new PrintWriter(System.out);
        this.stdIn = new BufferedReader(new InputStreamReader(System.in));
        this.addControl = addcontrol;
    }

    public void input() throws IOException {
        String number1, number2;
        do {
            this.stdOut.print("Input number1: ");
            this.stdOut.flush();
            number1 = this.stdIn.readLine();
            this.stdOut.print("Input number2: ");
            this.stdOut.flush();
            number2 = this.stdIn.readLine();
            
            RequestData requestData = new RequestData(number1, number2);
            try {
                this.addControl.execute(requestData);
                break;
            } catch (Exception ex) {
                this.stdOut.println(ex.getMessage());
                this.stdOut.flush();
            }
        } while(true);
    }
}
