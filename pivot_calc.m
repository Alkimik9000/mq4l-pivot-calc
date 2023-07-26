// Fibonacci Pivot Lines Indicator
#property indicator_chart_window

// User inputs
extern double OPEN = 0.0;
extern double HIGH = 0.0;
extern double LOW = 0.0;
extern double CLOSE = 0.0;

double MedianPivot[];
double R1[], R2[], R3[], R4[];
double S1[], S2[], S3[], S4[];

int init() {
    IndicatorBuffers(8);
    SetIndexBuffer(0, MedianPivot);
    SetIndexBuffer(1, R1);
    SetIndexBuffer(2, R2);
    SetIndexBuffer(3, R3);
    SetIndexBuffer(4, R4);
    SetIndexBuffer(5, S1);
    SetIndexBuffer(6, S2);
    SetIndexBuffer(7, S3);
    SetIndexBuffer(8, S4);

    SetIndexStyle(0, DRAW_LINE, STYLE_DOT, 1, clrYellow);
    SetIndexStyle(1, DRAW_LINE, 1, clrPurple);
    SetIndexStyle(2, DRAW_LINE, 1, clrGreen);
    SetIndexStyle(3, DRAW_LINE, 1, clrRed);
    SetIndexStyle(4, DRAW_LINE, 1, clrBlue);  // Color for Torquees
    SetIndexStyle(5, DRAW_LINE, 1, clrPurple);
    SetIndexStyle(6, DRAW_LINE, 1, clrGreen);
    SetIndexStyle(7, DRAW_LINE, 1, clrRed);
    SetIndexStyle(8, DRAW_LINE, 1, clrBlue);  // Color for Torquees
    
    return(0);
}

int start() {
    double pivot = (HIGH + LOW + CLOSE) / 3;
    double r1 = 2 * pivot - LOW;
    double s1 = 2 * pivot - HIGH;
    double r2 = pivot + (HIGH - LOW) * 0.618;
    double s2 = pivot - (HIGH - LOW) * 0.618;
    double r3 = pivot + (HIGH - LOW) * 0.786;
    double s3 = pivot - (HIGH - LOW) * 0.786;
    double r4 = pivot + (HIGH - LOW);
    double s4 = pivot - (HIGH - LOW);
    
    for(int i = 0; i < Bars; i++) {
        MedianPivot[i] = pivot;
        R1[i] = r1;
        S1[i] = s1;
        R2[i] = r2;
        S2[i] = s2;
        R3[i] = r3;
        S3[i] = s3;
        R4[i] = r4;
        S4[i] = s4;
    }
    return(0);
}