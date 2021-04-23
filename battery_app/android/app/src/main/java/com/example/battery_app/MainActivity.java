package com.example.battery_app;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "call.flutter.io/battery";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        if (call.method.equals("getBatteryLevel")) {
                            int batteryLevel = getBatteryLevel();
                            if (batteryLevel != -1) {
                                result.success(batteryLevel);
                            } else {
                                result.error("Currently unavailable", "Battery level not available currently.", null);
                            }
                        } else {
                            result.notImplemented();
                        }
                    }
                });
    }
    private int getBatteryLevel() {
        int phoneBatteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager)
                    getSystemService(BATTERY_SERVICE);
            phoneBatteryLevel =
                    batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
           Intent intent = new ContextWrapper(getApplicationContext()).
            registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
phoneBatteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL,
        -1) * 100) /
        intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return phoneBatteryLevel;
    }
}
