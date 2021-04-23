package com.example.web3;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.view.inputmethod.InputMethodManager;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
public class MainActivity extends AppCompatActivity {
    WebView webView, web2, web3, web4, web5, web6, web7;
    private boolean isNetworkAvailable() {
        ConnectivityManager connectivityManager = (ConnectivityManager) getSystemService( CONNECTIVITY_SERVICE );
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected();
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        webView = (WebView) findViewById(R.id.web_view);
        web2 = (WebView) findViewById(R.id.web2);
        web3 = (WebView) findViewById(R.id.web3);
        web4 = (WebView) findViewById(R.id.web4);
        web5 = (WebView) findViewById(R.id.web5);
        web6 = (WebView) findViewById(R.id.web6);
        web7 = (WebView) findViewById(R.id.web7);

        try {


            if(isNetworkAvailable()){
                webView.setWebViewClient(new WebViewClient());

                web2.setWebViewClient(new WebViewClient());
                web3.setWebViewClient(new WebViewClient());
                web4.setWebViewClient(new WebViewClient());
                web5.setWebViewClient(new WebViewClient());
                web6.setWebViewClient(new WebViewClient());
                web7.setWebViewClient(new WebViewClient());
                webView.loadUrl("https://edwardize.blogspot.com/");
                web2.loadUrl("https://edwardize.blogspot.com/");
                web3.loadUrl("https://edwardize.blogspot.com/");
                web4.loadUrl("https://edwardize.blogspot.com/");
                web5.loadUrl("https://edwardize.blogspot.com/");
                web6.loadUrl("https://edwardize.blogspot.com/");
                web7.loadUrl("https://edwardize.blogspot.com/");

                webView.getSettings().setJavaScriptEnabled(true);
            }

        }catch (Exception e) {
            e.printStackTrace();
        }


    }
}
