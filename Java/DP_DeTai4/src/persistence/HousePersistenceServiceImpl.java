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

public class HousePersistenceServiceImpl implements HousePersistenceService {
    private String url;
    private String user;
    private String pass;
    private Connection connection = null;

    public HousePersistenceServiceImpl(String host, String port, String db, String user, String pass) {
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
    public void addHouse(House house) {
        this.connect();
        String sql = "INSERT INTO house (maGiaoDich, ngayGiaoDich, donGia, loaiNha, diaChi, dienTich) VALUES " +
            "(?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(sql);

            preparedStatement.setInt(1, house.getMaGiaoDich());
            preparedStatement.setString(2, house.getNgayGiaoDich());
            preparedStatement.setInt(3, house.getDonGia());
            preparedStatement.setString(4, house.getLoaiNha());
            preparedStatement.setString(5, house.getDiaChi());
            preparedStatement.setDouble(6, house.getDienTich());
            preparedStatement.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        this.close();
    }

    @Override
    public void updateHouse(House house) {
        this.connect();
        String sql = "UPDATE house SET ngayGiaoDich = ?, donGia = ?, loaiNha = ?, diaChi = ?, dienTich = ? WHERE (maGiaoDich = ?);";
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(sql);

            preparedStatement.setString(1, house.getNgayGiaoDich());
            preparedStatement.setInt(2, house.getDonGia());
            preparedStatement.setString(3, house.getLoaiNha());
            preparedStatement.setString(4, house.getDiaChi());
            preparedStatement.setDouble(5, house.getDienTich());
            preparedStatement.setInt(6, house.getMaGiaoDich());
            preparedStatement.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        this.close();
    }

    @Override
    public void deleteHouse(int id) {
        this.connect();
        String sql = "DELETE FROM house where (maGiaoDich = ?)";
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
    public House getHouseByID(int id) {
        List<House> houses = this.getAllHouses();
        for (House house : houses) {
            if (house.getMaGiaoDich() == id) {
                return house;
            }
        }
        return null;
    }

    @Override
    public List<House> getAllHouses() {
        this.connect();
        List<House> houses = new ArrayList<>();
        
        String sql = "select * from house;";
        try {
            Statement statement = this.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            House house;

            while(resultSet.next()) {
                house = new House(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3), resultSet.getString(4), resultSet.getString(5), resultSet.getDouble(6));
                houses.add(house);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        this.close();
        return houses;
    }
}
