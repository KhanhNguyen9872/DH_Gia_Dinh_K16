package Entity;

public class SubEntity extends CalcEntity {

    public SubEntity() {

    }

    @Override
    public double calc() {
        return this.number1 - this.number2;
    }
}
