package com.example.showcount;

import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

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

        TextView countTv = findViewById(R.id.countTv);
        Button toastBtn = findViewById(R.id.toastBtn);
        Button countBtn = findViewById(R.id.countBtn);
        toastBtn.setOnClickListener(v -> {
           showToast(countTv.getText().toString());
        });

        countBtn.setOnClickListener(v -> {
            int countValue = Integer.parseInt(countTv.getText().toString()) + 1;
            countTv.setText(Integer.toString(countValue));
        });
    }

    protected void showToast(String msg) {
        Toast.makeText(this, msg, Toast.LENGTH_SHORT).show();
    }
}