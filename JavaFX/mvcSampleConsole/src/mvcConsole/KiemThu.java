package mvcConsole;

public class KiemThu {
	public static void main(String[] args) {
		ControllerStudent controller = new ControllerStudent();
		
		controller.update(123, "Nguyễn Thị Tý", "09033333333");
		controller.save();
		
	}
}
