public class AddUseCaseControl {
    private CalcEntity calcEntity;
    private AddUIConsoleOutput addOut;

    public AddUseCaseControl(CalcEntity calcEntity, AddUIConsoleOutput addOut) {
        this.calcEntity = calcEntity;
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
        this.calcEntity.setNumber1(number1);
        this.calcEntity.setNumber2(number2);
        
        // execute
        String addResult = String.valueOf(this.calcEntity.add());
        String subResult = String.valueOf(this.calcEntity.sub());
        String mulResult = String.valueOf(this.calcEntity.mul());
        String divResult = String.valueOf(this.calcEntity.div());

        // response
        responseData.setAddResult(addResult);
        responseData.setSubResult(subResult);
        responseData.setMulResult(mulResult);
        responseData.setDivResult(divResult);
        responseData.setMsg("success");

        this.addOut.output(responseData);
    }
}
