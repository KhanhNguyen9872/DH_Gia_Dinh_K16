package gui;

import businessRules.InBoundary;
import businessRules.RequestData;

public class AddController {
    private InBoundary inBoundary;

    public AddController(InBoundary inBoundary) {
        this.inBoundary = inBoundary;
    }

    public void execute(String number1, String number2) {
        RequestData requestData = new RequestData(number1, number2);
        this.inBoundary.execute(requestData);
    }
}