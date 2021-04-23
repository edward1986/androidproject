package com.example.flinganimation

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.dynamicanimation.animation.DynamicAnimation
import androidx.dynamicanimation.animation.FlingAnimation

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
    fun fling(view: View) {

        val testFling = findViewById<View>(R.id.testImage)

        val fling = FlingAnimation(testFling, DynamicAnimation.Y)
        fling.apply {
            setStartVelocity(700f)
            friction = 0.5f
            start()
        }
    }
}
