package persistence;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import com.mysql.cj.protocol.Message;

import domain.model.House;
import domain.model.Land;

public class LandPersistenceServiceImpl implements LandPersistenceService {
    private String url;
    private String user;
    private String pass;
    private Connection connection = null;

    public LandPersistenceServiceImpl(String host, String port, String db, String user, String pass) {
        this.url = "jdbc:mysql://" + host + ":" + port + "/" + db;
        this.user = user;
        this.pass = pass;
    }

    private void connect() {
        if (this.connection == null) {
            try {
                this.connection = DriverManager.getConnection(url, user, pass);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        };
    }

    private void close() {
        if (this.connection != null) {
            try {
                this.connection.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            this.connection = null;
        }
    }

    @Override
    public void addLand(Land land) {
        this.connect();
        String sql = "INSERT INTO land (maGiaoDich, ngayGiaoDich, donGia, loaiDat, dienTich) VALUES " +
            "(?, ?, ?, ?, ?);";
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(sql);

            preparedStatement.setInt(1, land.getMaGiaoDich());
            preparedStatement.setString(2, land.getNgayGiaoDich());
            preparedStatement.setInt(3, land.getDonGia());
            preparedStatement.setString(4, land.getLoaiDat());
            preparedStatement.setDouble(5, land.getDienTich());
            preparedStatement.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        this.close();
    }

    @Override
    public void updateLand(Land land) {
        this.connect();
        String sql = "UPDATE land SET ngayGiaoDich = ?, donGia = ?, loaiDat = ?, dienTich = ? WHERE (maGiaoDich = ?);";
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(sql);

            preparedStatement.setString(1, land.getNgayGiaoDich());
            preparedStatement.setInt(2, land.getDonGia());
            preparedStatement.setString(3, land.getLoaiDat());
            preparedStatement.setDouble(4, land.getDienTich());
            preparedStatement.setInt(5, land.getMaGiaoDich());
            preparedStatement.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        this.close();
    }

    @Override
    public void deleteLand(int id) {
        this.connect();
        String sql = "DELETE FROM land where (maGiaoDich = ?)";
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(sql);

            preparedStatement.setInt(1, id);
            preparedStatement.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        this.close();
    }

    @Override
    public Land getLandByID(int id) {
        List<Land> lands = this.getAllLands();
        for (Land land : lands) {
            if (land.getMaGiaoDich() == id) {
                return land;
            }
        }
        return null;
    }

    @Override
    public List<Land> getAllLands() {
        this.connect();
        List<Land> lands = new ArrayList<>();
        
        String sql = "select * from land;";
        try {
            Statement statement = this.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            Land land;

            while(resultSet.next()) {
                land = new Land(
                    resultSet.getInt(1), 
                    resultSet.getString(2),
                    resultSet.getInt(3),
                    resultSet.getString(4),
                    resultSet.getDouble(5)
                );  //
                lands.add(land);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        this.close();
        return lands;
    }
}
