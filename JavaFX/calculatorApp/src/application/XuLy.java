package application;

import javafx.geometry.*;
import javafx.scene.control.*;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.layout.*;

public class XuLy {
	private TextField textA;
	private TextField textB;
	private Button addBtn;
	private Button subBtn;
	private TextField result;
	
	public XuLy(TextField textA, TextField textB, Button addBtn, Button subBtn, TextField result) {
		this.textA = textA;
		this.textB = textB;
		this.addBtn = addBtn;
		this.subBtn = subBtn;
		this.result = result;
	}
	
	public void add() {
		int a, b;
		a = Integer.parseInt(this.textA.getText());
		b = Integer.parseInt(this.textB.getText());
		this.result.setText(String.valueOf(a + b));
	}
	
	public void sub() {
		int a, b;
		a = Integer.parseInt(this.textA.getText());
		b = Integer.parseInt(this.textB.getText());
		this.result.setText(String.valueOf(a - b));
	}
	
	public void addButton() {
		this.addBtn.setOnAction(e -> {
			add();
		});
	}
	
	public void subButton() {
		this.subBtn.setOnAction(e -> {
			sub();
		});
	}
	
}
