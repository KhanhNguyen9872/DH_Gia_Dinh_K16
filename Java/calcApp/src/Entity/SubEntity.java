package Entity;

public class SubEntity {
    private double number1;
    private double number2;

    public SubEntity() {

    }

    public double sub() {
        return this.number1 - this.number2;
    }

    public void setNumber1(double number1) {
        this.number1 = number1;
    }

    public void setNumber2(double number2) {
        this.number2 = number2;
    }
}
