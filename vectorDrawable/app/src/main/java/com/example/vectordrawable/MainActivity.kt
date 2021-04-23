package com.example.vectordrawable

import android.graphics.drawable.Animatable
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.vectordrawable.graphics.drawable.AnimatedVectorDrawableCompat
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var isChecked = true

        avdImage.setOnClickListener {
            if (isChecked)
                checkToClose()
            else
                closeToCheck()

            isChecked = !isChecked
        }
    }

    private fun closeToCheck() {

        avdImage.setImageResource(R.drawable.avd_close_to_check)
        val avdCheckToClose = avdImage.drawable as Animatable

        avdCheckToClose.start()
    }

    private fun checkToClose() {
        avdImage.setImageResource(R.drawable.avd_check_to_close)
        val avdCheckToClose = avdImage.drawable as Animatable
        avdCheckToClose.start()
    }
}
