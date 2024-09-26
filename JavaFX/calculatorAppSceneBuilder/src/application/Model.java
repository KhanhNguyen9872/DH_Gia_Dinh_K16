package application;

public class Model {
	private String ketQua;
	
	public Model() {
		this.ketQua = "";
	}

	public String getKetQua() {
		return ketQua;
	}
	
	public void add(int a, int b) {
		this.ketQua = String.valueOf(a + b);
	}
	
	public void sub(int a, int b) {
		this.ketQua = String.valueOf(a - b);
	}
}
