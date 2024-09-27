package Entity;

public class DivEntity extends CalcEntity {

    public DivEntity() {

    }

    @Override
    public double calc() {
        return this.number1 / this.number2;
    }
}
