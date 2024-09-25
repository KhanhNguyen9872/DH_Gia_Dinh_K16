package com.example.loginscreenfacebook;

import android.app.AlertDialog;
import android.content.DialogInterface;
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

        EditText usernameEt = findViewById(R.id.username);
        EditText passwordEt = findViewById(R.id.password);
        Button loginBtn = findViewById(R.id.loginBtn);

        loginBtn.setOnClickListener(v -> {
            String username = usernameEt.getText().toString();
            String password = passwordEt.getText().toString();
            if (username.length() == 0) {
                showAlert("Error", "Please enter username");
                return;
            }
            if (password.length() == 0) {
                showAlert("Error", "Please enter password");
                return;
            }
            if (username.equals("root") && password.equals("root")) {
                showAlert("Success", "Login successfully");
            } else {
                showAlert("Error", "Invalid username or password");
            }
        });

        TextView helpBtn = findViewById(R.id.helpBtn);
        helpBtn.setOnClickListener(v -> {
            setContentView(R.layout.instagram_login);
        });
    }

    private void showAlert(String title, String msg) {
        AlertDialog alertDialog = new AlertDialog.Builder(MainActivity.this).create();
        alertDialog.setTitle(title);
        alertDialog.setMessage(msg);
        alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "OK",
            new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                }
            });
        alertDialog.show();
    }
}