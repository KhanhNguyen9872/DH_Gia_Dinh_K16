import Entity.*;

public class AddUseCaseControl {
    private AddEntity addEntity;
    private SubEntity subEntity;
    private MulEntity mulEntity;
    private DivEntity divEntity;
    private AddUIConsoleOutput addOut;

    public AddUseCaseControl(AddEntity addEntity, SubEntity subEntity, MulEntity mulEntity, DivEntity divEntity, AddUIConsoleOutput addOut) {
        this.addEntity = addEntity;
        this.subEntity = subEntity;
        this.mulEntity = mulEntity;
        this.divEntity = divEntity;
        this.addOut = addOut;
    }

    public void execute(RequestData requestData) throws Exception {
        double number1 = 0;
        double number2 = 0;

        // check number
        try {
            number1 = Double.parseDouble(requestData.getNumber1());
            number2 = Double.parseDouble(requestData.getNumber2());
        } catch (Exception ex) {
            throw new Exception("Error! Please input again!");
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
        String addResult = String.valueOf(this.addEntity.add());
        String subResult = String.valueOf(this.subEntity.sub());
        String mulResult = String.valueOf(this.mulEntity.mul());
        String divResult = String.valueOf(this.divEntity.div());

        // response
        ResponseData responseData = new ResponseData();
        responseData.setAddResult(addResult);
        responseData.setSubResult(subResult);
        responseData.setMulResult(mulResult);
        responseData.setDivResult(divResult);

        this.addOut.output(responseData);
    }
}
