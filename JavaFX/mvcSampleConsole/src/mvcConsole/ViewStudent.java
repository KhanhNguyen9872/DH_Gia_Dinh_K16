package mvcConsole;

import java.time.format.DateTimeFormatter;

public class ViewStudent {
	public void showDetail(ModelStudent student) {
		System.out.println("Thông tin sinh viên: ");
		System.out.println("  - MSSV: " + student.getId());
		System.out.println("  - Họ và tên: " + student.getFullName());
		System.out.println("  - Điện thoại: " + student.getPhoneNumber());
		System.out.println("  - Được cập nhật lúc: " + student.getUpdatedDate().format(DateTimeFormatter.ofPattern("HH:mm:ss dd/MM/yyyy")));
		System.out.println();
	}
	
	public void showSucceededUpdate(ModelStudent student) {
		System.out.println("Đã cập nhật thành công đối với sinh viên sau: ");
		showDetail(student);
	}
	
	public void showErrorMessage() {
		System.out.println("Cập nhật thất bại.");
	}
}
