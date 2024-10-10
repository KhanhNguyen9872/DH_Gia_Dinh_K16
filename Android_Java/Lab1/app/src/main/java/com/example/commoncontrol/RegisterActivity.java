package com.example.commoncontrol;

import android.content.Intent;
import android.os.Bundle;
import android.widget.EditText;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AppCompatButton;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class RegisterActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.inside_login);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        AppCompatButton btnRegister = findViewById(R.id.btnLogin);
        AppCompatButton btnCancel = findViewById(R.id.btnCancel);

        btnRegister.setOnClickListener(v -> {
            EditText email = findViewById(R.id.editText);
            EditText username = findViewById(R.id.editText2);
            EditText password = findViewById(R.id.editText3);
            EditText confirmPassword = findViewById(R.id.editText4);

            Account account = new Account("test", username.getText().toString(), password.getText().toString(), email.getText().toString(), false);
            Intent intent = new Intent();
            intent.putExtra("account", account);
            setResult(LoginActivity.RESULT_CODE, intent);
            finish();
        });

        btnCancel.setOnClickListener(v -> {
            finish();
        });
    }
}