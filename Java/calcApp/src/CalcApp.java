import Entity.*;

public class CalcApp {
    public static void main(String[] args) throws Exception {
        AddEntity addEntity = new AddEntity();
        SubEntity subEntity = new SubEntity();
        MulEntity mulEntity = new MulEntity();
        DivEntity divEntity = new DivEntity();

        AddUIConsoleOutput addOutput = new AddUIConsoleOutput();
        AddUseCaseControl addControl = new AddUseCaseControl(addEntity, subEntity, mulEntity, divEntity, addOutput);
        AddUIConsoleInput addInput = new AddUIConsoleInput(addControl);
        
        addInput.input();
    }
}
