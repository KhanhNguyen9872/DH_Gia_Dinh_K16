package businessRules;

public class ResponseData {
    private String status = null;
    private String msg = null;
    private String addResult;
    // private String subResult;
    // private String mulResult;
    // private String divResult;

    public ResponseData() {

    }

    public String getAddResult() {
        return addResult;
    }

    public void setAddResult(String addResult) {
        this.addResult = addResult;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
