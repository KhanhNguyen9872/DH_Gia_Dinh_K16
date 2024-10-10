package com.example.commoncontrol;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import java.util.ArrayList;
import java.util.List;

public class LoginActivity extends AppCompatActivity {
    private List<Account> listAccount = new ArrayList<>();
    public static final int REQUEST_CODE = 101;
    public static final int RESULT_CODE = 102;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.login_page);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        Button loginBtn = findViewById(R.id.btnLogin);
        Button registerBtn = findViewById(R.id.btnRegister);

        loginBtn.setOnClickListener(v -> {
            EditText et_username = findViewById(R.id.editText);
            EditText et_password = findViewById(R.id.editText1);

            String username = et_username.getText().toString();
            String password = et_password.getText().toString();

            for (Account account: listAccount) {
                if (username.equals(account.getUsername()) && password.equals(account.getPassword())) {
                    Intent intent = new Intent(this, InfoActivity.class);
                    intent.putExtra("account", account);
                    startActivity(intent);
                    return;
                }
            }

            Toast.makeText(this, "Wrong username or password", Toast.LENGTH_SHORT).show();
        });

        registerBtn.setOnClickListener(v -> {
            Intent intent = new Intent(this, RegisterActivity.class);
            startActivityForResult(intent, REQUEST_CODE);
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == REQUEST_CODE && resultCode == RESULT_CODE && data != null) {
            listAccount.add((Account)data.getParcelableExtra("account"));
        }
    }
}