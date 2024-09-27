package Entity;

public abstract class CalcEntity {
    protected double number1;
    protected double number2;
    
    public abstract double calc();
    
    public void setNumber1(double number1) {
        this.number1 = number1;
    }

    public void setNumber2(double number2) {
        this.number2 = number2;
    }
}
