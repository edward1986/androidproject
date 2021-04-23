package com.example.torchlight;

import android.content.ContentResolver;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Build;
import android.os.Bundle;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import static android.provider.Settings.Global.putInt;
import static android.provider.Settings.System.SCREEN_BRIGHTNESS;

public class LightSensorActivity extends AppCompatActivity implements SensorEventListener {

    private SensorManager mSensorManager;
    private Sensor mSensor;
    private boolean isSensorPresent;
    private ContentResolver mContentResolver;
    private Window mWindow;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.lightsensor_layout);

        mSensorManager = (SensorManager) this.getSystemService(Context.SENSOR_SERVICE);
        if (mSensorManager.getDefaultSensor(Sensor.TYPE_LIGHT) != null) {
            mSensor = mSensorManager.getDefaultSensor(Sensor.TYPE_LIGHT);
            isSensorPresent = true;
        } else {
            isSensorPresent = false;
        }

        initScreenBrightness();
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (isSensorPresent) {
            mSensorManager.registerListener(this, mSensor, SensorManager.SENSOR_DELAY_NORMAL);
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        if (isSensorPresent) {
            mSensorManager.unregisterListener(this);
        }
    }

    public void initScreenBrightness() {
        mContentResolver = getContentResolver();
        mWindow = getWindow();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();

        mSensorManager = null;
        mSensor = null;
        mContentResolver = null;
        mWindow = null;
    }

    @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN_MR1)
    public void changeScreenBrightness(float brightness) {
        //system setting brightness values ranges between 0 - 255
        //We scale up by multiplying by 255
        //This change the brightness for over all system settings
        putInt(mContentResolver, SCREEN_BRIGHTNESS, (int) (brightness * 255));
        //screen brightness values ranges between 0 - 1
        //This only changes the brightness for the current window
        ViewGroup.LayoutParams mLayoutParams = mWindow.getAttributes();
        ((WindowManager.LayoutParams) mLayoutParams).screenBrightness = brightness;
        mWindow.setAttributes((WindowManager.LayoutParams) mLayoutParams);
    }

    @Override
    public void onSensorChanged(SensorEvent event) {
        float light = event.values[0];
        //We only use light sensor value between 0 - 100
        //Before sending, we take the inverse of the value
        //So that they remain in range of 0 - 1
        if (light > 0 && light < 100) {
            changeScreenBrightness(1 / light);
        }
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {

    }


}