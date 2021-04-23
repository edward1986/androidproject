package com.example.alertdialog;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        final EditText Input = findViewById(R.id.et_input);
        Button Show = findViewById(R.id.bt_show);
        Show.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String Text = Input.getText().toString();
                if(Text.isEmpty()) {
                    alert("Please enter your alert on the textbox");
                }
            }
        });
    }

    private void alert(String message) {
        AlertDialog dlg = new AlertDialog.Builder(MainActivity.this).setTitle("Message")
                .setMessage(message)
                .setPositiveButton("ok", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                }).create();
        dlg.show();
    }
}
