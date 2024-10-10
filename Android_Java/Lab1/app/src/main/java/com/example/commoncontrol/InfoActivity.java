package com.example.commoncontrol;

import android.content.Intent;
import android.os.Bundle;
import android.widget.EditText;
import android.widget.RadioGroup;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class InfoActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.account_info);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        Intent intent = getIntent();
        Account account = (Account)intent.getParcelableExtra("account");

        EditText et_name = findViewById(R.id.editText4);
        EditText et_email = findViewById(R.id.editText);
        EditText et_username = findViewById(R.id.editText2);
        EditText et_password = findViewById(R.id.editText3);
        RadioGroup radioGroup = findViewById(R.id.radioGroup);

        et_name.setText(account.getName());
        et_email.setText(account.getEmail());
        et_username.setText(account.getUsername());
        et_password.setText(account.getPassword());
        if (account.getGender()) {
            radioGroup.check(R.id.radiobutton1);
        } else {
            radioGroup.check(R.id.radiobutton2);
        }
    }
}