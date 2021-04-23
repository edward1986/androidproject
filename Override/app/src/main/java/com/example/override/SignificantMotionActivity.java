package com.example.override;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.TriggerEvent;
import android.hardware.TriggerEventListener;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

public class SignificantMotionActivity extends AppCompatActivity {

    private SensorManager mSensorManager;
    private Sensor mSensor;
    private TextView mTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.sigmotion_layout);
        mTextView = (TextView) findViewById(R.id.text);
        mSensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        mSensor = mSensorManager.getDefaultSensor(Sensor.TYPE_SIGNIFICANT_MOTION);

    }

    @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN_MR2)
    public void requestSignificantMotionTrigger(View v) {
        mSensorManager.requestTriggerSensor(new SignificantMotionListener(), mSensor);
        mTextView.setText("Significant Motion Trigger is Set, Waiting for Trigger!");
    }

    @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN_MR2)
    class SignificantMotionListener extends TriggerEventListener {

        @Override
        public void onTrigger(TriggerEvent event) {
            mTextView.setText("Significant Motion Triggered!, Click again to request again.");
        }
    };

}
