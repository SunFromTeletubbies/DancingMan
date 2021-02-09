class Limb{
  float mX1, mY1;
  float mL;
  float mLF; float mAF;
  float mTheta;
  float mTheta1;
  int mN;
  
  
  Limb(float x, float y, float l, float theta, float theta1, float lF, float aF, int n){
    init(x, y, l, theta, theta1, lF, aF, n);
  }
  
  void init(float x, float y, float l, float theta, float theta1, float lF, float aF, int n){
    mX1 = x; mY1 = y;
    mL = l; 
    mLF = lF; mAF = aF;
    mTheta = theta;
    mTheta1 = theta1;
    mN = n;
    drawLimb(mX1, mY1, mL, mTheta*mAF, mN);
  }
  
  void drawLimb(float x1, float y1, float l, float a, int n){
    if(n<1)
      return;
      
    stroke(255);
    float x2 = x1+cos(a+mTheta1)*l;
    float y2 = y1+sin(a+mTheta1)*l;
    line(x1, y1, x2, y2);
    drawLimb(x2, y2, l*mLF, a*mAF, n-1);
  }
}
