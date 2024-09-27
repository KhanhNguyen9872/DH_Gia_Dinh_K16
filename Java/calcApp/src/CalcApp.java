import Entity.*;

public class CalcApp {
    public static void main(String[] args) throws Exception {
        CalcEntity addEntity = new AddEntity();
        CalcEntity subEntity = new SubEntity();
        CalcEntity mulEntity = new MulEntity();
        CalcEntity divEntity = new DivEntity();

        AddUIConsoleOutput addOutput = new AddUIConsoleOutput();
        AddUseCaseControl addControl = new AddUseCaseControl(addEntity, subEntity, mulEntity, divEntity, addOutput);
        AddUIConsoleInput addInput = new AddUIConsoleInput(addControl);
        
        addOutput.setAddInput(addInput);
        addInput.input();
    }
}
