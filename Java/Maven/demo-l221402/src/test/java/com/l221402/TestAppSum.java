package com.l221402;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class TestAppSum {
    @Test
    public void testError() throws Exception {
        RequestData requestData = new RequestData();
        requestData.setNumber1("2");
        requestData.setNumber2("a");

        CalcEntity calcEntity = new CalcEntity();
        OutBoundary outBoundary = new AddUIConsoleOutput();

        InBoundary inBoundary = new AddUseCaseControl(calcEntity, outBoundary);

        inBoundary.execute(requestData);

        assertEquals("error", ((AddUIConsoleOutput)outBoundary).responseData.getStatus());
    }

    @Test
    public void testResult() throws Exception {
        RequestData requestData = new RequestData();
        requestData.setNumber1("2");
        requestData.setNumber2("3");

        CalcEntity calcEntity = new CalcEntity();
        OutBoundary outBoundary = new AddUIConsoleOutput();

        InBoundary inBoundary = new AddUseCaseControl(calcEntity, outBoundary);

        inBoundary.execute(requestData);

        ResponseData responseData = ((AddUIConsoleOutput)outBoundary).responseData;
        assertEquals("success", responseData.getStatus());
        assertEquals("5.0", responseData.getAddResult());
    }
}

