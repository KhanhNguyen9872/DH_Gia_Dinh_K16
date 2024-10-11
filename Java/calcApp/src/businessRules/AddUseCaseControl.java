package businessRules;

public class AddUseCaseControl implements InBoundary {
    private AddEntity addEntity;
    private OutBoundary outBoundary;

    public AddUseCaseControl(AddEntity addEntity, OutBoundary outBoundary) {
        this.addEntity = addEntity;
        this.outBoundary = outBoundary;
    }

    private boolean isNumber(String number) {
        try {
            Double.parseDouble(number);
        } catch (Exception ex) {
            return false;
        };
        return true;
    }

    @Override
    public void execute(RequestData requestData) {
        ResponseData responseData = new ResponseData();

        String number1Str = requestData.getNumber1();
        String number2Str = requestData.getNumber2();

        double number1 = 0;
        double number2 = 0;

        // check number
        if (isNumber(number1Str) && isNumber(number2Str)) {
            number1 = Double.parseDouble(number1Str);
            number2 = Double.parseDouble(number2Str);
        } else {
            responseData.setStatus("error");
            responseData.setMsg("Vui long nhap lai!");
            this.outBoundary.output(responseData);
            return;
        }

        // setter
        this.addEntity.setNumber1(number1);
        this.addEntity.setNumber2(number2);
        
        // execute
        String addResult = String.valueOf(this.addEntity.add());
        // String subResult = String.valueOf(this.addEntity.sub());
        // String mulResult = String.valueOf(this.addEntity.mul());
        // String divResult = String.valueOf(this.addEntity.div());

        // response
        responseData.setAddResult(addResult);
        // responseData.setSubResult(subResult);
        // responseData.setMulResult(mulResult);
        // responseData.setDivResult(divResult);
        responseData.setStatus("success");

        this.outBoundary.output(responseData);
    }
}
