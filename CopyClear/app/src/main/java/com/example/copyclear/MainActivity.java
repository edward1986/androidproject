package com.example.copyclear;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    EditText edtInputData;
    Button btnCopy,btnClear;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        edtInputData = findViewById(R.id.edt_input);
        btnCopy = findViewById(R.id.btn_copy);
        btnClear = findViewById(R.id.btn_clear);

        btnCopy.setOnClickListener(new View.OnClickListener() {
            @Override
            public
            void onClick(View v) {
                String Value = edtInputData.getText().toString();
                if (Value.isEmpty()) {
                    Toast.makeText(MainActivity.this, "Please Enter Data !!!", Toast.LENGTH_SHORT).show();
                } else {
                    ClipboardManager clipboardManager = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
                    ClipData clipData = ClipData.newPlainText("data", Value);
                    clipboardManager.setPrimaryClip(clipData);
                    Toast.makeText(MainActivity.this, "Data Copied Successfully...", Toast.LENGTH_SHORT).show();
                }
            }
        });

        btnClear.setOnClickListener(new View.OnClickListener() {
            @Override
            public
            void onClick(View v) {
                String text = edtInputData.getText().toString();
                if (text.isEmpty()) {
                    Toast.makeText(MainActivity.this, "Already Empty !!!", Toast.LENGTH_SHORT).show();
                } else {
                    edtInputData.setText("");
                }
            }
        });
    }
}
