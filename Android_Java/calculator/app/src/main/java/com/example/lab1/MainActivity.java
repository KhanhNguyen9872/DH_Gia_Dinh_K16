package com.example.lab1;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {
    public static final int REQUEST_CODE = 101;
    public static final int RESULT_CODE = 201;

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

        Button addBtn = findViewById(R.id.addBtn);
        Button subBtn = findViewById(R.id.subBtn);
        Button mulBtn = findViewById(R.id.mulBtn);
        Button divBtn = findViewById(R.id.divBtn);

        addBtn.setOnClickListener(v -> {
            startActivityResult("+");
        });

        subBtn.setOnClickListener(v -> {
            startActivityResult("-");
        });

        mulBtn.setOnClickListener(v -> {
            startActivityResult("*");
        });

        divBtn.setOnClickListener(v -> {
            startActivityResult("/");
        });
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if(requestCode == REQUEST_CODE && resultCode == RESULT_CODE && data != null) {
            Double result = data.getDoubleExtra("result", 0.0);
            TextView tv_result = findViewById(R.id.result);
            tv_result.setText(result.toString());
        };
    };

    private void startActivityResult(String calc) {
        EditText number1 = findViewById(R.id.input1);
        EditText number2 = findViewById(R.id.input2);

        Intent intent = new Intent(MainActivity.this, ActivityResult.class);
        intent.putExtra("number1", number1.getText().toString());
        intent.putExtra("number2", number2.getText().toString());
        intent.putExtra("calc", calc);
        startActivityForResult(intent, REQUEST_CODE);
    }
}