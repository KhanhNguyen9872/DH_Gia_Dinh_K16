package com.example.de5_ktgk;

import android.os.Bundle;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.DatePicker;
import android.widget.EditText;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import java.util.Calendar;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        // set datepicker to 2020
        DatePicker datePicker = findViewById(R.id.datepicker);
        datePicker.updateDate(2020, Calendar.JANUARY, 1);

        Button dangKyBtn = findViewById(R.id.dangKyBtn);
        dangKyBtn.setOnClickListener(v -> {
            xuLyDangKy();
        });
    }

    private void xuLyDangKy() {
        EditText fullName = findViewById(R.id.fullName);
        EditText mssv = findViewById(R.id.mssv);
        DatePicker datePicker = findViewById(R.id.datepicker);
        CheckBox checkboxBongDa = findViewById(R.id.checkboxBongDa);
        CheckBox checkboxNhacKich = findViewById(R.id.checkboxNhacKich);
        CheckBox checkboxKyThuat = findViewById(R.id.checkboxKyThuat);
        CheckBox checkboxVanHoc = findViewById(R.id.checkboxVanHoc);
        EditText lyDoThamGia = findViewById(R.id.lyDoThamGia);

        String fullNameStr = fullName.getText().toString();
        String mssvStr = mssv.getText().toString();
        int ngay = datePicker.getDayOfMonth();
        int thang = datePicker.getMonth() + 1;
        int nam = datePicker.getYear();
        String lyDoThamGiaStr = lyDoThamGia.getText().toString();

        // fullName
        if (fullNameStr.length() < 12) {
            showMsg("Lỗi", "Họ và tên phải có ít nhất 12 ký tự");
            return;
        }

        // mssv
        if (mssvStr.length() == 8) {
            try {
                Integer.parseInt(mssvStr);
            } catch (Exception ex) {
                showMsg("Lỗi", "MSSV phải là số");
                return;
            }
        } else {
            showMsg("Lỗi", "MSSV phải có 8 ký tự");
            return;




































        }

        // ngayDangKy
        if (ngay == 1 && thang == 1 && nam == 2020) {
            showMsg("Lỗi", "Ngày đăng ký phải sau ngày 1/1/2020");
            return;
        }

        // cauLacBo
        String cauLacBoStr = "";

        if (checkboxBongDa.isChecked()) {
            cauLacBoStr += checkboxBongDa.getText().toString() + ", ";
        }

        if (checkboxNhacKich.isChecked()) {
            cauLacBoStr += checkboxNhacKich.getText().toString() + ", ";
        }

        if (checkboxKyThuat.isChecked()) {
            cauLacBoStr += checkboxKyThuat.getText().toString() + ", ";
        }

        if (checkboxVanHoc.isChecked()) {
            cauLacBoStr += checkboxVanHoc.getText().toString() + ", ";
        }

        if (cauLacBoStr.isEmpty()) {
            showMsg("Lỗi", "Phải chọn ít nhất 1 câu lạc bộ");
            return;

        } else {
            cauLacBoStr = cauLacBoStr.substring(0, cauLacBoStr.length() - 2);
        }

        // lyDoThamGia
        if (lyDoThamGiaStr.isEmpty()) {
            lyDoThamGiaStr = "không có";
        }

        // thongBao
        showMsg("Thông tin đăng ký câu lạc bộ",
                "Họ và tên: " + fullNameStr + "\n" +
                    "MSSV" + mssvStr + "\n" +
                    "Ngày đăng ký: " + ngay + "/" + thang + "/" + nam + "\n" +
                    "Câu lạc bộ: " + cauLacBoStr + "\n" +
                    "Lý do tham gia: " + lyDoThamGiaStr + "\n"
        );
    }

    private void showMsg(String title, String msg) {
        new AlertDialog.Builder(this)
                .setTitle(title)
                .setMessage(msg)
                .setPositiveButton(android.R.string.ok, null)
                .show();
    }
}