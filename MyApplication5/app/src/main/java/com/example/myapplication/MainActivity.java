package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class MainActivity extends StockPortfolioListViewActivity {
    @Inject
    JobManager jobManager;

    @Override
    protected void onStart() {
        super.onStart();
        jobManager.schedule(PortfolioSyncJob.createJob());
    }
}