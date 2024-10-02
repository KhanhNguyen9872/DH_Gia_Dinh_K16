package com.example.commoncontrol;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.HorizontalScrollView;
import android.widget.RadioButton;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {
    private CheckBox intCb, doubleCb, stringCb, allCb;
    private Button resultBtn, hintBtn;
    private HorizontalScrollView scrollView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        intCb = findViewById(R.id.intCb);
        doubleCb = findViewById(R.id.doubleCb);
        stringCb = findViewById(R.id.stringCb);
        allCb = findViewById(R.id.allCb);

        resultBtn = findViewById(R.id.resultBtn);
        hintBtn = findViewById(R.id.hintBtn);

        intCb.setOnClickListener(v -> {
            if (intCb.isChecked()) {
                showToast("int | true");
            } else {
                showToast("int | false");
            }
        });

        doubleCb.setOnClickListener(v -> {
            if (doubleCb.isChecked()) {
                showToast("double | true");
            } else {
                showToast("double | false");
            }
        });

        stringCb.setOnClickListener(v -> {
            if (stringCb.isChecked()) {
                showToast("string | true");
            } else {
                showToast("string | false");
            }
        });

        allCb.setOnClickListener(v -> {
            if (allCb.isChecked()) {
                intCb.setChecked(true);
                intCb.setEnabled(false);

                doubleCb.setChecked(true);
                doubleCb.setEnabled(false);

                stringCb.setChecked(true);
                stringCb.setEnabled(false);
            } else {
                intCb.setChecked(false);
                intCb.setEnabled(true);

                doubleCb.setChecked(false);
                doubleCb.setEnabled(true);

                stringCb.setChecked(false);
                stringCb.setEnabled(true);
            }
        });

        resultBtn.setOnClickListener(v -> {
            if (!intCb.isChecked() && !doubleCb.isChecked() && stringCb.isChecked() && !allCb.isChecked()) {
                showToast("Đúng rồi");
            } else {
                showToast("Sai rồi");
            }
        });

        hintBtn.setOnClickListener(v -> {
            intCb.setChecked(false);
            doubleCb.setChecked(false);
            stringCb.setChecked(true);
            allCb.setChecked(false);

            intCb.setEnabled(true);
            doubleCb.setEnabled(true);
            stringCb.setEnabled(true);
        });
    }

    private void showToast(String msg) {
        Toast.makeText(this, msg, Toast.LENGTH_SHORT).show();
    }
}