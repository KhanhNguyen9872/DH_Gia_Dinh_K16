package application;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TextField;

public class Controller implements Initializable {
	@FXML
	private TextField textFieldGio;
	
	private Model model;
	private View view;
	
	public void hienThiGio(ActionEvent event) {
		this.model.gioHienTai();
		
		String stringGio = model.getGio();
		
		this.view.hienThiGio(stringGio, textFieldGio);
	}
	
	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		this.model = new Model("");
		this.view = new View();
	}
}
