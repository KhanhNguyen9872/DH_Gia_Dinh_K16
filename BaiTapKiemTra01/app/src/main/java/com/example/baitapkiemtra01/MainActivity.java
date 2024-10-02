package com.example.baitapkiemtra01;

import android.os.Bundle;
import android.widget.CheckBox;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

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

        CheckBox kemBo = findViewById(R.id.kemBo);
        CheckBox kemSauRieng = findViewById(R.id.kemSauRieng);
        CheckBox kemDau = findViewById(R.id.kemDau);
        RadioGroup chonSize = findViewById(R.id.chonSize);
        TextView daChonKem = findViewById(R.id.daChonKem);
        TextView daChonKichCo = findViewById(R.id.daChonKichCo);

        chonSize.setOnCheckedChangeListener((group, checkedId) -> {
            int id = chonSize.getCheckedRadioButtonId();
            if (id == -1) {
                daChonKichCo.setText("Chưa chọn kích cỡ");
            } else {
                RadioButton radioButton = findViewById(id);
                daChonKichCo.setText(radioButton.getText());
            }
        });

        kemBo.setOnClickListener(v -> {
            checkChonKem(daChonKem);
        });

        kemSauRieng.setOnClickListener(v -> {
            checkChonKem(daChonKem);
        });

        kemDau.setOnClickListener(v -> {
            checkChonKem(daChonKem);
        });
    }

    private void checkChonKem(TextView daChonKem) {
        CheckBox kemBo = findViewById(R.id.kemBo);
        CheckBox kemSauRieng = findViewById(R.id.kemSauRieng);
        CheckBox kemDau = findViewById(R.id.kemDau);

        String result = "";

        if (kemBo.isChecked()) {
            result = result + kemBo.getText() + ", ";
        }

        if (kemSauRieng.isChecked()) {
            result = result + kemSauRieng.getText() + ", ";
        }

        if (kemDau.isChecked()) {
            result = result + kemDau.getText() + ", ";
        }

        if (result.isEmpty()) {
            result = "Chưa chọn kem";
        } else {
            result = result.substring(0, result.length() - 2);
        }

        daChonKem.setText(result);
    }
}