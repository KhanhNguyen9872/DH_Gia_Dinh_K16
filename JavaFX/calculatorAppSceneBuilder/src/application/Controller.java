package application;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;

public class Controller implements Initializable {
	@FXML
	private TextField textA;
	@FXML
	private TextField textB;
	@FXML
	private TextField textResult;
	
	private View view;
	private Model model;
	
	public void addButton(ActionEvent event) {
		int a = Integer.parseInt(textA.getText());
		int b = Integer.parseInt(textB.getText());
		
		this.model.add(a, b);
		
		String ketQua = this.model.getKetQua();
		this.view.hienThiKQ(ketQua, this.textResult);
	}
	
	public void subButton(ActionEvent event) {
		int a = Integer.parseInt(textA.getText());
		int b = Integer.parseInt(textB.getText());
		
		this.model.sub(a, b);
		
		String ketQua = this.model.getKetQua();
		this.view.hienThiKQ(ketQua, this.textResult);
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		this.model = new Model();
		this.view = new View();
	}
	
	
}
