import businessRules.*;

// import cui.*;
import gui.*;

public class CalcApp {
    public static void main(String[] args) throws Exception {
        AddEntity addEntity = new AddEntity();

        // GUI
        ModelView modelView = new ModelView();
        OutBoundary outBoundary = new Presenter(modelView);
        InBoundary inBoundary = new AddUseCaseControl(addEntity, outBoundary);

        AddController addController = new AddController(inBoundary);
        AddView addView = new AddView(addController, modelView);

        ((Presenter)outBoundary).subscriber(addView);
        addView.start();

        // CUI
        // OutBoundary outputBoundary = new AddUIConsoleOutput();
        // InBoundary inputBoundary = new AddUseCaseControl(addEntity, outputBoundary);
        // AddUIConsoleInput addInput = new AddUIConsoleInput(inputBoundary);  

        // ((AddUIConsoleOutput)outputBoundary).setAddInput(addInput);
        // addInput.input();
    };
};
