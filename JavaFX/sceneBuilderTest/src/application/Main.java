package application;
	
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;
import javafx.scene.layout.BorderPane;
import javafx.scene.*;


public class Main extends Application {
	@Override
	public void start(Stage primaryStage) {
		try {
			Parent giaoDien = FXMLLoader.load(getClass().getResource("sceneBuilder.fxml"));
			Scene canhVat = new Scene(giaoDien);
			primaryStage.setTitle("Ứng dụng - Thử nghiệm");
			primaryStage.setScene(canhVat);
			primaryStage.setResizable(false);
			primaryStage.show();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
