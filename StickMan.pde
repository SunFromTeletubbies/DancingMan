class StickMan{
  Amplitude mAmp;
  float mStartY; float mStartX;
  float mLimbL;
  float mLengthAmp; float mAngleAmp;
  float mStartTheta;
  float mSoundReduction;
  int mNumberOfBones;
  Star[] mStars = new Star[500];
  float mSpeed;
  
  StickMan(float startX, float startY, float limbL, float startTheta, 
           float soundReduction, int numberOfBones, Amplitude amp){
    init(startX, startY, limbL, startTheta, soundReduction, numberOfBones, amp);
  }
  
  void init(float startX, float startY, float limbL, float startTheta, 
            float soundReduction, int numberOfBones, Amplitude amp){
    mStartX = startX; mStartY = startY; 
    mLimbL = limbL;
    mStartTheta = startTheta;
    mSoundReduction = soundReduction;
    mNumberOfBones = numberOfBones;
    mAmp = amp;
    for (int i = 0; i < mStars.length; i++) {
      mStars[i] = new Star();
    }
  }
  
  void draw(){
    float theta = log2(1-mSoundReduction+mAmp.analyze())*5;
    if(theta>radians(45)){
      theta = radians(45);
    } else if(theta<0) {
      theta = 0;
    }
    float x = mStartX;
    float y = mStartY - degrees(theta);
    mSpeed = map(theta, 0, PI/2, 1, 25);
    colorMode(HSB, 360, 100, 100);
    background(216, 95-degrees(theta)*1.5, 73);
    colorMode(RGB, 255, 255, 255);
    ellipseMode(RADIUS);
    strokeWeight(5);
    ellipse(x, y-135, 42, 42);
    line(x, y-150, width/2, y+50);
    createLimb(x, y-50, mLimbL, theta, mStartTheta+PI/2, 0.66, 1.5, mNumberOfBones);
    createLimb(x, y-50, mLimbL, -theta, -mStartTheta+PI/2, 0.66, 1.5, mNumberOfBones);
    createLimb(x, y+50, mLimbL, theta, mStartTheta+PI/2, 0.66, 0.5, mNumberOfBones);
    createLimb(x, y+50, mLimbL, -theta, -mStartTheta+PI/2, 0.66, 0.5, mNumberOfBones);
    pushMatrix();
    translate(width/2, height/2);
    for (int i = 0; i < mStars.length; i++) {
      mStars[i].update(mSpeed);
      mStars[i].show();
    }
    popMatrix();
  }
  
  float log2 (float x) {
    return (log(x) / log(2));
  }

  
  void createLimb(float x, float y, float l, float theta, float theta1, float lF, float aF, int n){
    Limb newLimb = new Limb(x, y, l, theta, theta1, lF, aF, n);
  }
}
