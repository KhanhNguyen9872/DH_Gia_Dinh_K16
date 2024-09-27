package Entity;

public class AddEntity extends CalcEntity {

    public AddEntity() {

    }

    @Override
    public double calc() {
        return this.number1 + this.number2;
    }
}
