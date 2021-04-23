package com.example.waterdrop;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;

import androidx.annotation.RequiresApi;

public class WaterWave extends View {

    private int mWaveHeight;//Water ripple height
    private Paint mPaint;//A brush that draws ripples
    private Path mPath;//Draw the path of the ripple
    private int mWL;//Screen Width
    private String TAG = "zoneLog";//Tag of Log Log
    private int mFu;//Amplitude of water ripple
    private int mOffset;//Offset value of water ripple movement
    private boolean mMIsAnimatorPlaying;//Used to determine if ValueAnimator was executed for the first time
    private Paint mTextPaint;//Text Brush
    private String mText;//Progress value text

    public WaterWave(Context context) {
        super(context);
        init();
    }

    public WaterWave(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public WaterWave(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    public WaterWave(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    private void init() {
        mPaint = new Paint();//Used to draw waves
        mPaint.setAntiAlias(true);
        mPaint.setColor(Color.parseColor("#5DCEC6"));
        mPaint.setStyle(Paint.Style.FILL_AND_STROKE);
        mFu = 100;//Amplitude of Waves
        mTextPaint = new Paint();//Used to draw text
        mTextPaint.setColor(Color.WHITE);
        mTextPaint.setStyle(Paint.Style.FILL_AND_STROKE);
        mTextPaint.setAntiAlias(true);
        mTextPaint.setTextSize(75);
        mOffset = 0;//Offset value of water ripple movement
        mWaveHeight = 0;//Progress value, also the height of the ripple
        mPath = new Path();//Used to draw waves
    }

    @Override
    protected void onDraw(final Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawColor(Color.WHITE);
        mWL = getWidth();
        mPath.reset();
        final int sc = canvas.saveLayer(0, 0, getWidth(), getHeight(), null, Canvas.ALL_SAVE_FLAG);


        mPath.moveTo(mWL + mOffset, getHeight() - mWaveHeight);//Because the positive y-axis is downward, the height of the ripple is subtracted
        mPath.lineTo(mWL + mOffset, getHeight());//Draw the right segment
        mPath.lineTo(-mWL + mOffset, getHeight());//Draw bottom segment
        mPath.lineTo(-mWL + mOffset, getHeight() - mWaveHeight);//Draw the left segment

        mPath.quadTo((-mWL * 3 / 4) + mOffset, getHeight() - mWaveHeight + mFu, (-mWL / 2) + mOffset, getHeight() - mWaveHeight); //Draw the first curve of the first ripple
        mPath.quadTo((-mWL / 4) + mOffset, getHeight() - mWaveHeight - mFu, 0 + mOffset, getHeight() - mWaveHeight); //Draw the second curve of the first ripple
        mPath.quadTo((mWL / 4) + mOffset, getHeight() - mWaveHeight + mFu, (mWL / 2) + mOffset, getHeight() - mWaveHeight); //Draw the first curve of the second ripple
        mPath.quadTo((mWL * 3 / 4) + mOffset, getHeight() - mWaveHeight - mFu, mWL + mOffset, getHeight() - mWaveHeight);  //Draw the second curve of the second ripple
        mPath.close();//Closed Curve
        canvas.drawPath(mPath, mPaint);//draw a curve
        if (!mMIsAnimatorPlaying) {//Determine if ValueAnimator started for the first time
            mMIsAnimatorPlaying = true;
            ValueAnimator animator = ValueAnimator.ofInt(0, mWL);//Set the moving range to a screen width
            animator.setDuration(1000);//Set duration to 1 second
            animator.setRepeatCount(ValueAnimator.INFINITE);//Set to infinite loop
            animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
                @Override
                public void onAnimationUpdate(ValueAnimator animation) {
                    int value = (int) animation.getAnimatedValue();
                    mOffset = value;//Modify Offset
                    postInvalidate();//Refresh interface
                }
            });
            animator.start();
            ValueAnimator animatorHeight = ValueAnimator.ofInt(0, getHeight() + mFu);
            animatorHeight.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
                @Override
                public void onAnimationUpdate(ValueAnimator animation) {
                    mWaveHeight = (int) animation.getAnimatedValue();
                    mText = String.valueOf((int) ((double) mWaveHeight / (double) (getHeight() + mFu) * 100)) + "%";//Percentage of calculation progress
                    if (mWaveHeight == getHeight() + mFu) {//Stop ripple movement when water level is above screen height
                        animation.cancel();
                    }
                    if (mWaveHeight > getHeight() / 2) {//When the water level is above the text, the font is white, otherwise it is light blue
                        mTextPaint.setColor(Color.WHITE);
                    } else {
                        mTextPaint.setColor(Color.parseColor("#5DCEC6"));
                    }
                    postInvalidate();
                }
            });
            animatorHeight.setDuration(10000);//10 seconds
            animatorHeight.start();
        }
        canvas.drawText(mText, getWidth() / 2 - mTextPaint.measureText(mText) / 2, getHeight() / 2, mTextPaint);
        mPaint.setXfermode(null);
        canvas.restoreToCount(sc);// Restore Canvas
    }
}