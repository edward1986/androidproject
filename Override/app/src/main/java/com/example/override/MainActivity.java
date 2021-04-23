package com.example.override;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    public void navigateToCompassActivity(View v) {
        Intent mIntent = new Intent(this, CompassActivity.class);
        startActivity(mIntent);
    }

    public void navigateToFingerPrintActivity(View v) {
        Intent mIntent = new Intent(this, FingerPrintActivity.class);
        startActivity(mIntent);
    }

    public void navigateToShakeDetectionActivity(View v) {
        Intent mIntent = new Intent(this, ShakeDetectionActivity.class);
        startActivity(mIntent);
    }

    public void navigateToSigMotionActivity(View v) {
        Intent mIntent = new Intent(this, SignificantMotionActivity.class);
        startActivity(mIntent);
    }
}
