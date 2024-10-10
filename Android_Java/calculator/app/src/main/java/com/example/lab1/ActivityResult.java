package com.example.lab1;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class ActivityResult extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_result);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        TextView tv_number1 = findViewById(R.id.number1);
        TextView tv_number2 = findViewById(R.id.number2);
        TextView tv_calc = findViewById(R.id.calc);
        TextView tv_result = findViewById(R.id.result);

        Intent intent = getIntent();

        Double number1 = Double.parseDouble(intent.getStringExtra("number1"));
        Double number2 = Double.parseDouble(intent.getStringExtra("number2"));
        String calc = intent.getStringExtra("calc");
        Double result = 0.0;

        switch (calc) {
            case "+":
                result = number1 + number2;
                break;
            case "-":
                result = number1 - number2;
                break;
            case "*":
                result = number1 * number2;
                break;
            case "/":
                result = number1 / number2;
                break;
        };

        tv_number1.setText(number1.toString());
        tv_number2.setText(number2.toString());
        tv_calc.setText(calc);
        tv_result.setText(result.toString());

        Intent data = new Intent();
        data.putExtra("result", result);
        setResult(MainActivity.RESULT_CODE, data);
    };
};