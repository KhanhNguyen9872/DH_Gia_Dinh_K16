package application;

import javafx.scene.control.Alert;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;

public class ViewStudent {
	public void showDetail(ModelStudent student, TextField textFieldId, TextField textFieldFullName, TextField textFieldPhoneNumber) {
		textFieldId.setText("" + student.getId());
		textFieldFullName.setText(student.getFullName());
		textFieldPhoneNumber.setText(student.getPhoneNumber());
	}
	
	public void showUpdate(TextArea result, ModelStudent student) {
		result.setText(
			"- MSSV: " + student.getId() + "\n" +
			"- Họ và tên: " + student.getFullName() + "\n" + 
			"- Số điện thoại: " + student.getPhoneNumber() + "\n"
		);
		result.setDisable(true);
		showSuccess();
	};
	
	public void showSuccess() {
		thongBao("Đã cập nhật thành công.");
	}
	
	public void showError() {
		thongBao("Cập nhật thất bại!");
	}
	
	public void thongBao(String tb) {
		Alert alert = new Alert(AlertType.INFORMATION);
		alert.setTitle("Thông báo");
		alert.setHeaderText(null);
		alert.setContentText(tb);
		alert.show();
	}
}
