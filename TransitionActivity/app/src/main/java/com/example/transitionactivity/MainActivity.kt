package com.example.transitionactivity

import android.app.ActivityOptions
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.util.Pair as UtilPair
class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

fun onClick(view: View) {

    val transitionImg = findViewById<View>(R.id.imgTaj)
    val transitionText = findViewById<View>(R.id.txvTaj)

    val imgPair = UtilPair.create(transitionImg, "sharedImage")
    val textPair = UtilPair.create(transitionText, "sharedTitle")

    val options = ActivityOptions.makeSceneTransitionAnimation(this, imgPair, textPair)
    val i = Intent(this@MainActivity, DetailActivity::class.java)
    startActivity(i, options.toBundle())

}}
