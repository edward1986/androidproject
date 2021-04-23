package com.example.calljava_app;
import android.os.Bundle;

import androidx.annotation.NonNull;

import io.flutter.app.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.flutter.epic/epic";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
                                                                              @Override
                                                                              public void onMethodCall(MethodCall methodCall, @NonNull MethodChannel.Result result) {
                                                                                  if (methodCall.method.equals("Printy")) {

                                                                                      result.success("Hi From Java");
                                                                                  }
                                                                              }
                                                                          }
        );
    }
}