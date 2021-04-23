public class CustomView extends View {

final Paint mPaint = new Paint();

public CustomView(Context context) {
super(context);
mPaint.setColor(Color.BLACK);
mPaint.setTextSize(30);
}

@Override
protected void onDraw(Canvas canvas) {
super.onDraw(canvas);
setBackgroundColor(Color.CYAN);
canvas.drawText("Custom Text", 100, 100, mPaint);
invalidate();
}
}