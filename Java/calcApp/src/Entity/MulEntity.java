package Entity;

public class MulEntity extends CalcEntity {

    public MulEntity() {

    }

    @Override
    public double calc() {
        return this.number1 * this.number2;
    }
}
