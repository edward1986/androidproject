package com.example.retrofitmultipleupload;

import android.content.Context;
import android.net.ConnectivityManager;

import androidx.annotation.NonNull;

import java.util.Objects;

class InternetConnection {
    /**
     * CHECK WHETHER INTERNET CONNECTION IS AVAILABLE OR NOT
     */
    static boolean checkConnection(@NonNull Context context) {
        return ((ConnectivityManager) Objects.requireNonNull(context.getSystemService
                (Context.CONNECTIVITY_SERVICE))).getActiveNetworkInfo() != null;
    }
}