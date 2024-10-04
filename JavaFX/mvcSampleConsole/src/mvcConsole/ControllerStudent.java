package mvcConsole;

import java.time.LocalDateTime;

public class ControllerStudent {
	private ModelStudent student;
	private ViewStudent view;
	
	public ControllerStudent() {
		this.student = new ModelStudent(123, "Nguyễn Thị Tý", "0901111111", LocalDateTime.now());
		view = new ViewStudent();
		view.showDetail(student);
	}
	
	public void update(Integer id, String fullName, String phoneNumber) {
		student.update(id, fullName, phoneNumber);
	}
	
	public void save() {
		boolean isSuccess = student.save();
		if (isSuccess) {
			view.showSucceededUpdate(student);
		} else {
			view.showErrorMessage();
		}
	}
}
