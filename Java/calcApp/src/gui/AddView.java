package gui;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Dimension;

import observer.Subscriber;
import javax.swing.*;

public class AddView extends JFrame implements Subscriber, ActionListener {
    private AddController addController;
    private ModelView modelView;
    private JLabel lb_num1, lb_num2, lb_result;
    private JTextField tf_num1, tf_num2;
    private JButton submitBtn;

    public AddView(AddController addController, ModelView modelView) {
        this.addController = addController;
        this.modelView = modelView;

        buildPanel();
        setResizable(false);
        setSize(300, 160);
        setTitle("Calculator App");
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
    }

    public void start() {
        setVisible(true);
    }

    private void buildPanel() {
        // Initialize label, textfield, button
        this.lb_num1 = new JLabel("Number1: ");
        this.lb_num2 = new JLabel("Number2: ");
        this.lb_result = new JLabel("");

        this.tf_num1 = new JTextField(15);
        this.tf_num2 = new JTextField(15);

        this.submitBtn = new JButton("Submit");
        this.submitBtn.setPreferredSize(new Dimension(250, 30));

        // add ActionListener
        this.submitBtn.addActionListener(this);

        // Initialize JPanel
        JPanel panel = new JPanel();

        panel.add(lb_num1);
        panel.add(tf_num1);
        panel.add(lb_num2);
        panel.add(tf_num2);
        panel.add(submitBtn);
        panel.add(lb_result);

        this.add(panel);
    }

    private void showResult() {
        String addResult = this.modelView.getAddResult();
        // String subResult = this.modelView.getSubResult();
        // String mulResult = this.modelView.getMulResult();
        // String divResult = this.modelView.getDivResult();

        this.lb_result.setText(
            "Result: " + addResult 
                        // + ", " + 
                        // subResult + ", " + 
                        // mulResult + ", " +
                        // divResult
        );
    }

    public void showError() {
        String msg = this.modelView.getMsg();
        this.lb_result.setText("Error: " + msg);
    }

    @Override
    public void update() {
        String status = this.modelView.getStatus();

        if (status.equals("success")) {
            this.showResult();
        } else {
            this.showError();
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String number1 = tf_num1.getText();
        String number2 = tf_num2.getText();

        addController.execute(number1, number2);
    }
}
