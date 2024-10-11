package gui;

import businessRules.OutBoundary;
import businessRules.ResponseData;
import observer.Publisher;

public class Presenter extends Publisher implements OutBoundary {
    private ModelView modelView;

    public Presenter(ModelView modelView) {
        this.modelView = modelView;
    }

    public void changeState() {
        notifySubscribers();
    }

    @Override
    public void output(ResponseData responseData) {
        String status = responseData.getStatus();
        String msg = responseData.getMsg();
        String addResult = responseData.getAddResult();
        // String subResult = responseData.getSubResult();
        // String mulResult = responseData.getMulResult();
        // String divResult = responseData.getDivResult();

        this.modelView.setStatus(status);
        this.modelView.setMsg(msg);
        this.modelView.setAddResult(addResult);
        // this.modelView.setSubResult(subResult);
        // this.modelView.setMulResult(mulResult);
        // this.modelView.setDivResult(divResult);

        changeState();
    }
}
