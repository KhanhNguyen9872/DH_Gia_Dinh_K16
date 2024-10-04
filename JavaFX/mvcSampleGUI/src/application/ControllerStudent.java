package application;

import java.net.URL;
import java.time.LocalDateTime;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TextField;
import javafx.scene.control.TextArea;

public class ControllerStudent implements Initializable {
	private ViewStudent view;
	private ModelStudent model;
	
	@FXML
	private TextField id;
	@FXML
	private TextField fullName;
	@FXML
	private TextField phoneNumber;
	@FXML
	private TextArea result;
	
	public void actionButton(ActionEvent event) {
		Integer id = Integer.parseInt(this.id.getText());
		String fullName = this.fullName.getText();
		String phoneNumber = this.phoneNumber.getText();
		
		model.update(id, fullName, phoneNumber);
		
		save();
	}
	
	public void save() {
		boolean isSuccess = model.save();
		if (isSuccess) {
			view.showUpdate(result, model);
		} else {
			view.showError();
		}
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
		view = new ViewStudent();
		model = new ModelStudent(123, "Nguyễn Thị Tý", "090111111", LocalDateTime.now());
	}
}
