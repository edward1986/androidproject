package com.example.circularactivity;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Region;
import android.os.Build;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Scroller;

import androidx.annotation.RequiresApi;

public class CircularActivityIndicator extends View {
    private static final String TAG = CircularActivityIndicator.class.getName();

    private static final int DEFAULT_FG_COLOR = 0xffff0000;
    private static final int PRESSED_FG_COLOR = 0xff0000ff;
    private static final int DEFAULT_BG_COLOR = 0xffa0a0a0;
    private static final int FLING_SCALE = 200;
    private Paint backgroundPaint;
    private Paint foregroundPaint;
    private int selectedAngle;
    private Path clipPath;
    private boolean pressed;
    private int circleSize;
    private GestureDetector gestureListener;
    private Scroller angleScroller;
    private ValueAnimator angleAnimator;

    public CircularActivityIndicator(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);

        backgroundPaint = new Paint();
        backgroundPaint.setColor(DEFAULT_BG_COLOR);
        backgroundPaint.setStyle(Paint.Style.FILL);

        foregroundPaint = new Paint();
        foregroundPaint.setColor(DEFAULT_FG_COLOR);
        foregroundPaint.setStyle(Paint.Style.FILL);

        selectedAngle = 280;
        pressed = false;

        angleScroller = new Scroller(context, null, true);
        angleScroller.setFinalX(selectedAngle);

        gestureListener = new GestureDetector(context, new GestureDetector.OnGestureListener() {
            boolean processed;

            @Override
            public
            boolean onDown(MotionEvent event) {
                processed = computeAndSetAngle(event.getX(), event.getY());
                if (processed) {
                    getParent().requestDisallowInterceptTouchEvent(true);
                    changePressedState(true);
                    postInvalidate();
                }
                return processed;
            }

            @Override
            public
            void onShowPress(MotionEvent e) {

            }

            @Override
            public
            boolean onSingleTapUp(MotionEvent e) {
                endGesture();
                return false;
            }

            @Override
            public
            boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
                computeAndSetAngle(e2.getX(), e2.getY());
                postInvalidate();
                return true;
            }

            @Override
            public
            void onLongPress(MotionEvent e) {
                endGesture();
            }

            @Override
            public
            boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
                return false;
            }
        });
    }

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    @Override
    protected void onDraw(Canvas canvas) {
        boolean notFinished = angleScroller.computeScrollOffset();
        selectedAngle = angleScroller.getCurrX();

        if (pressed) {
            foregroundPaint.setColor(PRESSED_FG_COLOR);
        } else {
            foregroundPaint.setColor(DEFAULT_FG_COLOR);
        }

        circleSize = getWidth();
        if (getHeight() < circleSize) circleSize = getHeight();

        int horMargin = (getWidth() - circleSize) / 2;
        int verMargin = (getHeight() - circleSize) / 2;

        // create a clipPath the first time
        if (clipPath == null) {
            int clipWidth = (int) (circleSize * 0.75);

            int clipX = (getWidth() - clipWidth) / 2;
            int clipY = (getHeight() - clipWidth) / 2;
            clipPath = new Path();
            clipPath.addArc(
                    clipX,
                    clipY,
                    clipX + clipWidth,
                    clipY + clipWidth,
                    0, 360);
        }

        canvas.clipRect(0, 0, getWidth(), getHeight());
        canvas.clipPath(clipPath, Region.Op.DIFFERENCE);

        canvas.save();
        canvas.rotate(-90, getWidth() / 2, getHeight() / 2);

        canvas.drawArc(
                horMargin,
                verMargin,
                horMargin + circleSize,
                verMargin + circleSize,
                0, 360, true, backgroundPaint);

        canvas.drawArc(
                horMargin,
                verMargin,
                horMargin + circleSize,
                verMargin + circleSize,
                0, selectedAngle, true, foregroundPaint);

        canvas.restore();

        if (notFinished) invalidate();
    }

    private void endGesture() {
        getParent().requestDisallowInterceptTouchEvent(false);
        changePressedState(false);
        postInvalidate();
    }

    private void changePressedState(boolean pressed) {
        this.pressed = pressed;
    }

    private boolean computeAndSetAngle(float x, float y) {
        x -= getWidth() / 2;
        y -= getHeight() / 2;

        double radius = Math.sqrt(x * x + y * y);
        if (radius > circleSize / 2) return false;

        int angle = (int) (180.0 * Math.atan2(y, x) / Math.PI) + 90;
        angle = ((angle > 0) ? angle : 360 + angle);

        if (angleScroller.computeScrollOffset()) {
            angleScroller.forceFinished(true);
        }

        angleScroller.startScroll(angleScroller.getCurrX(), 0, angle - angleScroller.getCurrX(), 0);
        return true;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        return gestureListener.onTouchEvent(event);
    }
}