package application;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Model {
	private String gio;
	
	public Model(String gio) {
		this.gio = gio;
	}
	
	public String getGio() {
		return this.gio;
	}
	
	public void setGio(String gio) {
		this.gio = gio;
	}
	
	public void gioHienTai() {
		String stringGio = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss"));
		setGio(stringGio);
	}
}
