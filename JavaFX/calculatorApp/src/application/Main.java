package application;
	
import javafx.application.Application;
import javafx.stage.Stage;


public class Main extends Application {
	@Override
	public void start(Stage primaryStage) {
		GiaoDien gd = new GiaoDien(primaryStage);
		gd.hienThi();
		gd.xuLy();
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
