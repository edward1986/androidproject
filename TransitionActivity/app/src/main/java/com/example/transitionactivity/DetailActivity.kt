package com.example.transitionactivity

import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.view.Window
import androidx.annotation.RequiresApi

class DetailActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        window.requestFeature(Window.FEATURE_CONTENT_TRANSITIONS);
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)
    }
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    fun onClickBack(view: View) {
        finishAfterTransition()

    }
}
