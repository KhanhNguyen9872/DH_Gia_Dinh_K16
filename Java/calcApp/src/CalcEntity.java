

public class CalcEntity {
    private double number1;
    private double number2;
    
    public double add() {
        return this.number1 + this.number2;
    }

    public double sub() {
        return this.number1 - this.number2;
    }

    public double mul() {
        return this.number1 * this.number2;
    }

    public double div() {
        return this.number1 / this.number2;
    }
    
    public void setNumber1(double number1) {
        this.number1 = number1;
    }

    public void setNumber2(double number2) {
        this.number2 = number2;
    }
}
