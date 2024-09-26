package application;

import javafx.geometry.*;
import javafx.scene.control.*;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.layout.*;

public class GiaoDien {
	private Stage sanKhau;
	
	private TextField textA;
	private TextField textB;
	private Button addBtn;
	private Button subBtn;
	private TextField result;
	
	public GiaoDien(Stage sanKhau) {
		this.sanKhau = sanKhau;
		
		this.textA = new TextField();
		this.textB = new TextField();
		this.addBtn = new Button("+");
		this.subBtn = new Button("-");
		this.result = new TextField();
		this.result.setPrefWidth(80);
		this.result.setPrefHeight(30);
		
		FlowPane flowPane = new FlowPane();
		flowPane.setHgap(10);
		flowPane.setVgap(10);
		flowPane.setPadding(new Insets(15, 15, 15, 15));
		
		flowPane.getChildren().addAll(this.textA, this.textB, this.addBtn, this.subBtn, this.result);
		
		Scene canhVat = new Scene(flowPane, 195, 130);
		
		this.sanKhau.setScene(canhVat);
		this.sanKhau.setTitle("calcApp");
		this.sanKhau.setResizable(false);
		
	}
	
	public void hienThi() {
		this.sanKhau.show();
	}
	
	public void xuLy() {
		XuLy xuLy = new XuLy(this.textA, this.textB, this.addBtn, this.subBtn, this.result);
		xuLy.addButton();
		xuLy.subButton();
	}
}
