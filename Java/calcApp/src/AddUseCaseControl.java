import Entity.*;

public class AddUseCaseControl {
    private CalcEntity addEntity;
    private CalcEntity subEntity;
    private CalcEntity mulEntity;
    private CalcEntity divEntity;
    private AddUIConsoleOutput addOut;

    public AddUseCaseControl(CalcEntity addEntity, CalcEntity subEntity, CalcEntity mulEntity, CalcEntity divEntity, AddUIConsoleOutput addOut) {
        this.addEntity = addEntity;
        this.subEntity = subEntity;
        this.mulEntity = mulEntity;
        this.divEntity = divEntity;
        this.addOut = addOut;
    }

    public void execute(RequestData requestData) throws Exception {
        ResponseData responseData = new ResponseData();

        double number1 = 0;
        double number2 = 0;

        // check number
        try {
            number1 = Double.parseDouble(requestData.getNumber1());
            number2 = Double.parseDouble(requestData.getNumber2());
        } catch (Exception ex) {
            responseData.setMsg("Vui long nhap lai!");
            this.addOut.output(responseData);
            return;
        }

        // set
        this.addEntity.setNumber1(number1);
        this.addEntity.setNumber2(number2);

        this.subEntity.setNumber1(number1);
        this.subEntity.setNumber2(number2);

        this.mulEntity.setNumber1(number1);
        this.mulEntity.setNumber2(number2);

        this.divEntity.setNumber1(number1);
        this.divEntity.setNumber2(number2);
        
        // execute
        String addResult = String.valueOf(this.addEntity.calc());
        String subResult = String.valueOf(this.subEntity.calc());
        String mulResult = String.valueOf(this.mulEntity.calc());
        String divResult = String.valueOf(this.divEntity.calc());

        // response
        responseData.setAddResult(addResult);
        responseData.setSubResult(subResult);
        responseData.setMulResult(mulResult);
        responseData.setDivResult(divResult);

        this.addOut.output(responseData);
    }
}
