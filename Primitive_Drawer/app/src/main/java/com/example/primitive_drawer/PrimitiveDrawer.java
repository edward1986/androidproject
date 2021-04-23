package com.example.primitive_drawer;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;

public class PrimitiveDrawer extends View {
    private static final int BACKGROUND_COLOR = 0xff000040;
    private Paint paint;
    private int rectSize;
    private long timeStart;


    public PrimitiveDrawer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);

        paint = new Paint();
        paint.setStyle(Paint.Style.STROKE);
        paint.setAntiAlias(true);
        paint.setColor(0xffffffff);
    }

    @Override
    protected
    void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);

        int smallerDimension = (right - left);
        if (bottom - top < smallerDimension) smallerDimension = bottom - top;

        rectSize = smallerDimension / 10;
        timeStart = System.currentTimeMillis();
    }

    @Override
    protected
    void onDraw(Canvas canvas) {
        float angle = (System.currentTimeMillis() - timeStart) / 100.f;

        canvas.drawColor(BACKGROUND_COLOR);

        canvas.save();
        canvas.translate(canvas.getWidth() / 2, canvas.getHeight() / 2);

        for (int i = 0; i < 15; i++) {
            canvas.rotate(angle);
            canvas.drawRect(-rectSize / 2, -rectSize / 2, rectSize / 2, rectSize / 2, paint);
            canvas.scale(1.2f, 1.2f);
        }

        canvas.restore();
        invalidate();
    }


}