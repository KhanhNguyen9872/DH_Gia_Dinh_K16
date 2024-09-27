public class CalcApp {
    public static void main(String[] args) throws Exception {
        CalcEntity calcEntity = new CalcEntity();

        AddUIConsoleOutput addOutput = new AddUIConsoleOutput();
        AddUseCaseControl addControl = new AddUseCaseControl(calcEntity, addOutput);
        AddUIConsoleInput addInput = new AddUIConsoleInput(addControl);
        
        addOutput.setAddInput(addInput);
        addInput.input();
    }
}
