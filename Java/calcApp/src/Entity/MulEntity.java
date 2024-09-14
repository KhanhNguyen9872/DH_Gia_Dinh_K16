package Entity;
public class MulEntity {
    private int number1;
    private int number2;

    public MulEntity() {

    }

    public int mul() {
        return this.number1 * this.number2;
    }

    public void setNumber1(int number1) {
        this.number1 = number1;
    }

    public void setNumber2(int number2) {
        this.number2 = number2;
    }
}
